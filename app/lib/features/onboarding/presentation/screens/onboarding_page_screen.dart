import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cleanfood/core/analytics/analytics_service.dart';
import 'package:cleanfood/features/onboarding/onboarding_provider.dart';
import 'package:cleanfood/features/onboarding/core/onboarding_routes.dart';
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
import 'package:cleanfood/features/onboarding/presentation/widgets/get_started_widget.dart';
import 'package:cleanfood/features/premium/presentation/screens/paywall_screen.dart';

class OnboardingPageScreen extends ConsumerStatefulWidget {
  final String page;
  
  const OnboardingPageScreen({
    super.key,
    required this.page,
  });

  @override
  ConsumerState<OnboardingPageScreen> createState() => _OnboardingPageScreenState();
}

class _OnboardingPageScreenState extends ConsumerState<OnboardingPageScreen> {
  DateTime? _screenStartTime;

  @override
  void initState() {
    super.initState();
    _trackScreenViewed();
  }

  void _trackScreenViewed() {
    _screenStartTime = DateTime.now();
    final screenIndex = OnboardingRoutes.getRouteIndex('/onboarding/${widget.page}');
    final screenName = OnboardingRoutes.getScreenName('/onboarding/${widget.page}');
    
    ref.read(analyticsServiceProvider.future).then((analytics) {
      analytics.trackOnboardingScreenViewed(screenIndex, screenName);
    }).catchError((e) {
      log('Analytics error: $e', name: 'Onboarding');
    });
  }

  void _nextPage() {
    HapticFeedback.lightImpact();
    
    _trackScreenCompleted();
    
    final currentRoute = '/onboarding/${widget.page}';
    final nextRoute = OnboardingRoutes.getNextRoute(currentRoute);
    
    if (nextRoute != null) {
      context.go(nextRoute);
    } else {
      // Last page - complete onboarding
      _completeOnboarding();
    }
  }

  void _previousPage() {
    HapticFeedback.lightImpact();
    
    final currentRoute = '/onboarding/${widget.page}';
    final previousRoute = OnboardingRoutes.getPreviousRoute(currentRoute);
    
    if (previousRoute != null) {
      context.go(previousRoute);
    }
  }

  void _trackScreenCompleted() {
    final timeSpent = _screenStartTime != null 
        ? DateTime.now().difference(_screenStartTime!).inMilliseconds 
        : 0;
    final screenIndex = OnboardingRoutes.getRouteIndex('/onboarding/${widget.page}');
    
    ref.read(analyticsServiceProvider.future).then((analytics) {
      analytics.trackOnboardingScreenCompleted(screenIndex, timeSpent);
    }).catchError((e) {
      log('Analytics error: $e', name: 'Onboarding');
    });
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

  Widget _buildPageContent() {
    switch (widget.page) {
      case 'welcome':
        return WelcomeScreenWidget(onNext: _nextPage);
      case 'gender':
        return GenderQuestionWidget(
          onNext: _nextPage,
          onPrevious: _previousPage,
        );
      case 'discovery':
        return DiscoveryQuestionWidget(
          onNext: _nextPage,
          onPrevious: _previousPage,
        );
      case 'healthy_taste':
        return HealthyTasteQuestionWidget(
          onNext: _nextPage,
          onPrevious: _previousPage,
        );
      case 'comfort_eating':
        return ComfortEatingQuestionWidget(
          onNext: _nextPage,
          onPrevious: _previousPage,
        );
      case 'frequency':
        return FrequencyQuestionWidget(
          onNext: _nextPage,
          onPrevious: _previousPage,
        );
      case 'stress_eating':
        return StressEatingQuestionWidget(
          onNext: _nextPage,
          onPrevious: _previousPage,
        );
      case 'age':
        return AgeQuestionWidget(
          onNext: _nextPage,
          onPrevious: _previousPage,
        );
      case 'boredom_eating':
        return BoredomEatingQuestionWidget(
          onNext: _nextPage,
          onPrevious: _previousPage,
        );
      case 'personalizing':
        return PersonalizingWidget(onNext: _nextPage);
      case 'education_weight':
        return EducationWeightWidget(onNext: _nextPage);
      case 'education_disease':
        return EducationDiseaseWidget(onNext: _nextPage);
      case 'education_anxiety':
        return EducationAnxietyWidget(onNext: _nextPage);
      case 'education_support':
        return EducationSupportWidget(onNext: _nextPage);
      case 'feature_scanning':
        return FeatureScanningWidget(onNext: _nextPage);
      case 'feature_additives':
        return FeatureAdditivesWidget(onNext: _nextPage);
      case 'testimonials':
        return TestimonialsWidget(onNext: _nextPage);
      case 'get_started':
        return GetStartedWidget(onNext: _nextPage);
      default:
        return WelcomeScreenWidget(onNext: _nextPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: SafeArea(
        child: _buildPageContent(),
      ),
    );
  }
}


