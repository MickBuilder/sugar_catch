import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cleanfood/core/analytics/analytics_service.dart';
import 'package:cleanfood/features/onboarding/onboarding_provider.dart';
import 'package:flutter/painting.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/welcome_screen_widget.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/gender_question_widget.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/discovery_question_widget.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/healthy_taste_question_widget.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/comfort_eating_question_widget.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/frequency_question_widget.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/stress_eating_question_widget.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/age_question_widget.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/boredom_eating_question_widget.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/personalizing_widget.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/education_weight_widget.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/education_disease_widget.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/education_anxiety_widget.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/education_support_widget.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/feature_scanning_widget.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/feature_additives_widget.dart';
import 'package:cleanfood/features/onboarding/presentation/widgets/testimonials_widget.dart';
import 'package:cleanfood/features/premium/presentation/screens/paywall_screen.dart';

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
    'gender',
    'discovery',
    'healthy_taste',
    'comfort_eating',
    'frequency',
    'stress_eating',
    'age',
    'boredom_eating',
    'personalizing',
    'education_weight',
    'education_disease',
    'education_anxiety',
    'education_support',
    'feature_scanning',
    'feature_additives',
    'testimonials'
  ];

  @override
  void initState() {
    super.initState();
    // Precache images for first screen to avoid loading delay
    _precacheWelcomeImages();
    _trackScreenViewed(0);
  }

  /// Precache images used in welcome screen for instant display
  void _precacheWelcomeImages() {
    // Precache images after first frame to avoid blocking initial render
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final context = this.context;
        precacheImage(const AssetImage('assets/images/icon.png'), context);
        precacheImage(const AssetImage('assets/images/welcome_screen.png'), context);
      }
    });
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
    
    if (_currentPage < 16) {
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
      // Show paywall as bottom sheet after onboarding completion
      await showPaywallBottomSheet(context);
    }
  }

  // Analytics tracking methods - non-blocking for better performance
  void _trackScreenViewed(int screenIndex) {
    // Don't await - fire and forget to avoid blocking UI
    _screenStartTime = DateTime.now();
    ref.read(analyticsServiceProvider.future).then((analytics) {
      analytics.trackOnboardingScreenViewed(screenIndex, _screenNames[screenIndex]);
    }).catchError((e) {
      log('Analytics error: $e', name: 'Onboarding');
    });
  }

  void _trackScreenCompleted(int screenIndex) {
    // Don't await - fire and forget to avoid blocking UI
    final timeSpent = _screenStartTime != null 
        ? DateTime.now().difference(_screenStartTime!).inMilliseconds 
        : 0;
    ref.read(analyticsServiceProvider.future).then((analytics) {
      analytics.trackOnboardingScreenCompleted(screenIndex, timeSpent);
    }).catchError((e) {
      log('Analytics error: $e', name: 'Onboarding');
    });
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
        onboardingData.gender ?? 'unknown',
        [onboardingData.discoverySource ?? 'unknown'],
      );
    } catch (e) {
      log('Analytics error: $e', name: 'Onboarding');
    }
  }

  /// Lazy widget factory - builds widgets only when needed
  /// This helps with tree-shaking and defers loading of non-visible widgets
  Widget _buildOnboardingWidget(int index) {
    switch (index) {
      case 0:
        return WelcomeScreenWidget(onNext: _nextPage);
      case 1:
        return GenderQuestionWidget(
          onNext: _nextPage,
          onPrevious: _previousPage,
        );
      case 2:
        return DiscoveryQuestionWidget(
          onNext: _nextPage,
          onPrevious: _previousPage,
        );
      case 3:
        return HealthyTasteQuestionWidget(
          onNext: _nextPage,
          onPrevious: _previousPage,
        );
      case 4:
        return ComfortEatingQuestionWidget(
          onNext: _nextPage,
          onPrevious: _previousPage,
        );
      case 5:
        return FrequencyQuestionWidget(
          onNext: _nextPage,
          onPrevious: _previousPage,
        );
      case 6:
        return StressEatingQuestionWidget(
          onNext: _nextPage,
          onPrevious: _previousPage,
        );
      case 7:
        return AgeQuestionWidget(
          onNext: _nextPage,
          onPrevious: _previousPage,
        );
      case 8:
        return BoredomEatingQuestionWidget(
          onNext: _nextPage,
          onPrevious: _previousPage,
        );
      case 9:
        return PersonalizingWidget(onNext: _nextPage);
      case 10:
        return EducationWeightWidget(onNext: _nextPage);
      case 11:
        return EducationDiseaseWidget(onNext: _nextPage);
      case 12:
        return EducationAnxietyWidget(onNext: _nextPage);
      case 13:
        return EducationSupportWidget(onNext: _nextPage);
      case 14:
        return FeatureScanningWidget(onNext: _nextPage);
      case 15:
        return FeatureAdditivesWidget(onNext: _nextPage);
      case 16:
        return TestimonialsWidget(onNext: _nextPage);
      default:
        return WelcomeScreenWidget(onNext: _nextPage);
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
                itemCount: 17, // Total number of screens
                itemBuilder: (context, index) {
                  // Lazy widget factory - only builds the widget when the page is actually needed
                  // This allows better tree-shaking and defers loading of non-visible widgets
                  return _buildOnboardingWidget(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
