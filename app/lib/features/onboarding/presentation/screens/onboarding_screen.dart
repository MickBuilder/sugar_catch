import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sugar_catch/core/analytics/analytics_service.dart';
import 'package:sugar_catch/features/onboarding/onboarding_provider.dart';
import 'package:sugar_catch/features/onboarding/presentation/widgets/welcome_screen_widget.dart';
import 'package:sugar_catch/features/onboarding/presentation/widgets/hidden_sugar_problem_widget.dart';
import 'package:sugar_catch/features/onboarding/presentation/widgets/how_it_works_widget.dart';
import 'package:sugar_catch/features/onboarding/presentation/widgets/sugar_goals_widget.dart';
import 'package:sugar_catch/features/onboarding/presentation/widgets/motivation_widget.dart';
import 'package:sugar_catch/features/onboarding/presentation/widgets/testimonials_widget.dart';
import 'package:sugar_catch/features/onboarding/presentation/widgets/complete_widget.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  DateTime? _screenStartTime;
  final List<String> _screenNames = [
    'welcome',
    'hidden_sugar_problem', 
    'how_it_works',
    'sugar_goals',
    'motivation',
    'testimonials',
    'complete'
  ];

  @override
  void initState() {
    super.initState();
    _trackScreenViewed(0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    HapticFeedback.lightImpact();
    
    // Track screen completion
    _trackScreenCompleted(_currentPage);
    
    if (_currentPage < 6) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _previousPage() {
    HapticFeedback.lightImpact();
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _completeOnboarding() async {
    HapticFeedback.heavyImpact();
    
    // Track onboarding completion
    await _trackOnboardingCompleted();
    
    await ref.read(onboardingDataProvider.notifier).completeOnboarding();
    if (mounted) {
      context.go('/');
    }
  }

  // Analytics tracking methods
  Future<void> _trackScreenViewed(int screenIndex) async {
    try {
      final analytics = await ref.read(analyticsServiceProvider.future);
      await analytics.trackOnboardingScreenViewed(screenIndex, _screenNames[screenIndex]);
      _screenStartTime = DateTime.now();
    } catch (e) {
      log('Analytics error: $e', name: 'Onboarding');
    }
  }

  Future<void> _trackScreenCompleted(int screenIndex) async {
    try {
      final analytics = await ref.read(analyticsServiceProvider.future);
      final timeSpent = _screenStartTime != null 
          ? DateTime.now().difference(_screenStartTime!).inMilliseconds 
          : 0;
      await analytics.trackOnboardingScreenCompleted(screenIndex, timeSpent);
    } catch (e) {
      log('Analytics error: $e', name: 'Onboarding');
    }
  }

  Future<void> _trackOnboardingCompleted() async {
    try {
      final analytics = await ref.read(analyticsServiceProvider.future);
      final onboardingData = ref.read(onboardingDataProvider);
      final totalTime = _screenStartTime != null 
          ? DateTime.now().difference(_screenStartTime!).inMilliseconds 
          : 0;
      
      await analytics.trackOnboardingCompleted(
        totalTime,
        onboardingData.sugarGoal.title,
        onboardingData.motivations.map((m) => m.title).toList(),
      );
    } catch (e) {
      log('Analytics error: $e', name: 'Onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: SafeArea(
        child: Column(
          children: [
            // Page content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(), // Disable swipe navigation
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                  _trackScreenViewed(index);
                },
                itemCount: 7, // Fixed count to match our 7 screens
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return WelcomeScreenWidget(onNext: _nextPage);
                    case 1:
                      return HiddenSugarProblemWidget(onNext: _nextPage);
                    case 2:
                      return HowItWorksWidget(onNext: _nextPage);
                    case 3:
                      return SugarGoalsWidget(
                        onNext: _nextPage,
                        onPrevious: _previousPage,
                      );
                    case 4:
                      return MotivationWidget(
                        onNext: _nextPage,
                        onPrevious: _previousPage,
                      );
                    case 5:
                      return TestimonialsWidget(onNext: _nextPage);
                    case 6:
                      return CompleteWidget(onNext: _nextPage);
                    default:
                      return WelcomeScreenWidget(onNext: _nextPage);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
