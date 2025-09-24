import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sugar_catch/features/onboarding/data/onboarding_models.dart';
import 'package:sugar_catch/features/onboarding/data/onboarding_service.dart';

final onboardingDataProvider = StateNotifierProvider<OnboardingNotifier, OnboardingData>((ref) {
  return OnboardingNotifier();
});

final onboardingScreensProvider = Provider<List<OnboardingScreen>>((ref) {
  return OnboardingService.getOnboardingScreens();
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
  OnboardingNotifier() : super(OnboardingService.getOnboardingData());

  void updateSugarGoal(SugarGoal goal) {
    state = state.copyWith(sugarGoal: goal);
    OnboardingService.saveOnboardingData(state);
  }

  void updateMotivations(List<SugarMotivation> motivations) {
    state = state.copyWith(motivations: motivations);
    OnboardingService.saveOnboardingData(state);
  }

  void addMotivation(SugarMotivation motivation) {
    final currentMotivations = List<SugarMotivation>.from(state.motivations);
    if (!currentMotivations.contains(motivation)) {
      currentMotivations.add(motivation);
      updateMotivations(currentMotivations);
    }
  }

  void removeMotivation(SugarMotivation motivation) {
    final currentMotivations = List<SugarMotivation>.from(state.motivations);
    currentMotivations.remove(motivation);
    updateMotivations(currentMotivations);
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
