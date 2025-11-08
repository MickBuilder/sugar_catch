import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cleanfood/features/onboarding/data/onboarding_models.dart';
import 'package:cleanfood/features/onboarding/data/onboarding_service.dart';

final onboardingDataProvider = StateNotifierProvider<OnboardingNotifier, OnboardingData>((ref) {
  return OnboardingNotifier();
});


final testimonialsProvider = Provider<List<Testimonial>>((ref) {
  return OnboardingService.getTestimonials();
});

final hasCompletedOnboardingProvider = Provider<bool>((ref) {
  // Use the reactive onboarding data provider
  final onboardingData = ref.watch(onboardingDataProvider);
  return onboardingData.hasCompletedOnboarding;
});

class OnboardingNotifier extends StateNotifier<OnboardingData> {
  OnboardingNotifier() : super(_loadInitialData());
  
  /// Load initial data - this is safe because OnboardingService.init() is called before runApp()
  static OnboardingData _loadInitialData() {
    try {
      return OnboardingService.getOnboardingData();
    } catch (e) {
      // If service isn't ready, return default data
      return const OnboardingData();
    }
  }

  void updateGender(String gender) {
    state = state.copyWith(gender: gender);
    OnboardingService.saveOnboardingData(state);
  }

  void updateDiscoverySource(String source) {
    state = state.copyWith(discoverySource: source);
    OnboardingService.saveOnboardingData(state);
  }

  void updateHealthyFoodTaste(String taste) {
    state = state.copyWith(healthyFoodTaste: taste);
    OnboardingService.saveOnboardingData(state);
  }

  void updateComfortEating(String frequency) {
    state = state.copyWith(comfortEating: frequency);
    OnboardingService.saveOnboardingData(state);
  }

  void updateProcessedFoodFrequency(String frequency) {
    state = state.copyWith(processedFoodFrequency: frequency);
    OnboardingService.saveOnboardingData(state);
  }

  void updateStressEating(String frequency) {
    state = state.copyWith(stressEating: frequency);
    OnboardingService.saveOnboardingData(state);
  }

  void updateAgeRange(String age) {
    state = state.copyWith(ageRange: age);
    OnboardingService.saveOnboardingData(state);
  }

  void updateBoredomEating(String frequency) {
    state = state.copyWith(boredomEating: frequency);
    OnboardingService.saveOnboardingData(state);
  }

  Future<void> completeOnboarding() async {
    await OnboardingService.markOnboardingComplete();
    state = state.copyWith(hasCompletedOnboarding: true);
  }

  void resetOnboarding() {
    state = const OnboardingData();
    OnboardingService.clearOnboardingData();
  }

  Future<void> resetOnboardingStatus() async {
    await OnboardingService.resetOnboardingStatus();
    state = const OnboardingData();
  }
}
