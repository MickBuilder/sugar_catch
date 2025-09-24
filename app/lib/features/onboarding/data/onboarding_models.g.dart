// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnboardingDataImpl _$$OnboardingDataImplFromJson(Map<String, dynamic> json) =>
    _$OnboardingDataImpl(
      sugarGoal:
          $enumDecodeNullable(_$SugarGoalEnumMap, json['sugarGoal']) ??
          SugarGoal.moderate,
      motivations:
          (json['motivations'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SugarMotivationEnumMap, e))
              .toList() ??
          const [],
      hasCompletedOnboarding: json['hasCompletedOnboarding'] as bool? ?? false,
    );

Map<String, dynamic> _$$OnboardingDataImplToJson(
  _$OnboardingDataImpl instance,
) => <String, dynamic>{
  'sugarGoal': _$SugarGoalEnumMap[instance.sugarGoal]!,
  'motivations': instance.motivations
      .map((e) => _$SugarMotivationEnumMap[e]!)
      .toList(),
  'hasCompletedOnboarding': instance.hasCompletedOnboarding,
};

const _$SugarGoalEnumMap = {
  SugarGoal.detox: 'detox',
  SugarGoal.lowSugar: 'lowSugar',
  SugarGoal.moderate: 'moderate',
  SugarGoal.trackOnly: 'trackOnly',
};

const _$SugarMotivationEnumMap = {
  SugarMotivation.loseWeight: 'loseWeight',
  SugarMotivation.improveEnergy: 'improveEnergy',
  SugarMotivation.betterSkin: 'betterSkin',
  SugarMotivation.preventDiabetes: 'preventDiabetes',
  SugarMotivation.generalHealth: 'generalHealth',
  SugarMotivation.other: 'other',
};
