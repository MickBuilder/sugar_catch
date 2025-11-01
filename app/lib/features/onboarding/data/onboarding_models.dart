import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_models.freezed.dart';
part 'onboarding_models.g.dart';

@freezed
class OnboardingData with _$OnboardingData {
  const factory OnboardingData({
    String? gender,
    String? discoverySource,
    String? healthyFoodTaste,
    String? comfortEating,
    String? processedFoodFrequency,
    String? stressEating,
    String? ageRange,
    String? boredomEating,
    @Default(false) bool hasCompletedOnboarding,
  }) = _OnboardingData;

  factory OnboardingData.fromJson(Map<String, dynamic> json) =>
      _$OnboardingDataFromJson(json);
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