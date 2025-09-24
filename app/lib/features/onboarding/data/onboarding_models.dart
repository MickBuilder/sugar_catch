import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_models.freezed.dart';
part 'onboarding_models.g.dart';

@freezed
class OnboardingData with _$OnboardingData {
  const factory OnboardingData({
    @Default(SugarGoal.moderate) SugarGoal sugarGoal,
    @Default([]) List<SugarMotivation> motivations,
    @Default(false) bool hasCompletedOnboarding,
  }) = _OnboardingData;

  factory OnboardingData.fromJson(Map<String, dynamic> json) =>
      _$OnboardingDataFromJson(json);
}

enum SugarGoal {
  detox('Sugar Detox', '0-5g daily', 'For serious detox', 5.0),
  lowSugar('Low Sugar', '5-15g daily', 'For gradual reduction', 15.0),
  moderate('Moderate', '15-25g daily', 'For awareness', 25.0),
  trackOnly('Just Track', 'No limit', 'For monitoring', null);

  const SugarGoal(this.title, this.subtitle, this.description, this.maxDailyGrams);

  final String title;
  final String subtitle;
  final String description;
  final double? maxDailyGrams;
}

enum SugarMotivation {
  loseWeight('Lose weight', '💪'),
  improveEnergy('Improve energy', '⚡'),
  betterSkin('Better skin', '✨'),
  preventDiabetes('Prevent diabetes', '🫀'),
  generalHealth('General health', '🏃‍♀️'),
  other('Other', '🎯');

  const SugarMotivation(this.title, this.emoji);

  final String title;
  final String emoji;
}

class OnboardingScreen {
  final int index;
  final String title;
  final String subtitle;
  final String description;
  final String? ctaText;
  final bool isLastScreen;

  const OnboardingScreen({
    required this.index,
    required this.title,
    required this.subtitle,
    required this.description,
    this.ctaText,
    this.isLastScreen = false,
  });
}

class Testimonial {
  final String name;
  final String handle;
  final String quote;
  final String? beforeAfter;

  const Testimonial({
    required this.name,
    required this.handle,
    required this.quote,
    this.beforeAfter,
  });
}
