// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnboardingDataImpl _$$OnboardingDataImplFromJson(Map<String, dynamic> json) =>
    _$OnboardingDataImpl(
      gender: json['gender'] as String?,
      discoverySource: json['discoverySource'] as String?,
      healthyFoodTaste: json['healthyFoodTaste'] as String?,
      comfortEating: json['comfortEating'] as String?,
      processedFoodFrequency: json['processedFoodFrequency'] as String?,
      stressEating: json['stressEating'] as String?,
      ageRange: json['ageRange'] as String?,
      boredomEating: json['boredomEating'] as String?,
      hasCompletedOnboarding: json['hasCompletedOnboarding'] as bool? ?? false,
    );

Map<String, dynamic> _$$OnboardingDataImplToJson(
  _$OnboardingDataImpl instance,
) => <String, dynamic>{
  'gender': instance.gender,
  'discoverySource': instance.discoverySource,
  'healthyFoodTaste': instance.healthyFoodTaste,
  'comfortEating': instance.comfortEating,
  'processedFoodFrequency': instance.processedFoodFrequency,
  'stressEating': instance.stressEating,
  'ageRange': instance.ageRange,
  'boredomEating': instance.boredomEating,
  'hasCompletedOnboarding': instance.hasCompletedOnboarding,
};
