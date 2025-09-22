// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgressStatisticsImpl _$$ProgressStatisticsImplFromJson(
  Map<String, dynamic> json,
) => _$ProgressStatisticsImpl(
  currentStreak: (json['currentStreak'] as num).toInt(),
  bestStreak: (json['bestStreak'] as num).toInt(),
  averageDailyIntake: (json['averageDailyIntake'] as num).toDouble(),
  totalSugarIntake: (json['totalSugarIntake'] as num).toDouble(),
  lastPeriodChange: (json['lastPeriodChange'] as num).toDouble(),
  lastPeriodLabel: json['lastPeriodLabel'] as String,
);

Map<String, dynamic> _$$ProgressStatisticsImplToJson(
  _$ProgressStatisticsImpl instance,
) => <String, dynamic>{
  'currentStreak': instance.currentStreak,
  'bestStreak': instance.bestStreak,
  'averageDailyIntake': instance.averageDailyIntake,
  'totalSugarIntake': instance.totalSugarIntake,
  'lastPeriodChange': instance.lastPeriodChange,
  'lastPeriodLabel': instance.lastPeriodLabel,
};

_$AchievementImpl _$$AchievementImplFromJson(Map<String, dynamic> json) =>
    _$AchievementImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      iconPath: json['iconPath'] as String,
      isUnlocked: json['isUnlocked'] as bool,
      unlockedAt: json['unlockedAt'] == null
          ? null
          : DateTime.parse(json['unlockedAt'] as String),
      type: AchievementType.fromJson(json['type'] as Map<String, dynamic>),
      criteria: json['criteria'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$AchievementImplToJson(_$AchievementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'iconPath': instance.iconPath,
      'isUnlocked': instance.isUnlocked,
      'unlockedAt': instance.unlockedAt?.toIso8601String(),
      'type': instance.type,
      'criteria': instance.criteria,
    };

_$SugarFreeWeekImpl _$$SugarFreeWeekImplFromJson(Map<String, dynamic> json) =>
    _$SugarFreeWeekImpl($type: json['runtimeType'] as String?);

Map<String, dynamic> _$$SugarFreeWeekImplToJson(_$SugarFreeWeekImpl instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

_$ItemsScannedImpl _$$ItemsScannedImplFromJson(Map<String, dynamic> json) =>
    _$ItemsScannedImpl(
      count: (json['count'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ItemsScannedImplToJson(_$ItemsScannedImpl instance) =>
    <String, dynamic>{'count': instance.count, 'runtimeType': instance.$type};

_$StreakImpl _$$StreakImplFromJson(Map<String, dynamic> json) => _$StreakImpl(
  days: (json['days'] as num).toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$StreakImplToJson(_$StreakImpl instance) =>
    <String, dynamic>{'days': instance.days, 'runtimeType': instance.$type};

_$LowSugarDayImpl _$$LowSugarDayImplFromJson(Map<String, dynamic> json) =>
    _$LowSugarDayImpl($type: json['runtimeType'] as String?);

Map<String, dynamic> _$$LowSugarDayImplToJson(_$LowSugarDayImpl instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

_$GoalReachedImpl _$$GoalReachedImplFromJson(Map<String, dynamic> json) =>
    _$GoalReachedImpl($type: json['runtimeType'] as String?);

Map<String, dynamic> _$$GoalReachedImplToJson(_$GoalReachedImpl instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

_$ConsumptionDataPointImpl _$$ConsumptionDataPointImplFromJson(
  Map<String, dynamic> json,
) => _$ConsumptionDataPointImpl(
  date: DateTime.parse(json['date'] as String),
  sugarAmount: (json['sugarAmount'] as num).toDouble(),
  periodLabel: json['periodLabel'] as String,
);

Map<String, dynamic> _$$ConsumptionDataPointImplToJson(
  _$ConsumptionDataPointImpl instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'sugarAmount': instance.sugarAmount,
  'periodLabel': instance.periodLabel,
};

_$ProgressDataImpl _$$ProgressDataImplFromJson(Map<String, dynamic> json) =>
    _$ProgressDataImpl(
      statistics: ProgressStatistics.fromJson(
        json['statistics'] as Map<String, dynamic>,
      ),
      achievements: (json['achievements'] as List<dynamic>)
          .map((e) => Achievement.fromJson(e as Map<String, dynamic>))
          .toList(),
      consumptionData: (json['consumptionData'] as List<dynamic>)
          .map((e) => ConsumptionDataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedPeriod: json['selectedPeriod'] as String,
    );

Map<String, dynamic> _$$ProgressDataImplToJson(_$ProgressDataImpl instance) =>
    <String, dynamic>{
      'statistics': instance.statistics,
      'achievements': instance.achievements,
      'consumptionData': instance.consumptionData,
      'selectedPeriod': instance.selectedPeriod,
    };
