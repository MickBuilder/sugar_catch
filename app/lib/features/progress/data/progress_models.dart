import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_models.freezed.dart';
part 'progress_models.g.dart';

@freezed
class ProgressStatistics with _$ProgressStatistics {
  const factory ProgressStatistics({
    required int currentStreak,
    required int bestStreak,
    required double averageDailyIntake,
    required double totalSugarIntake,
    required double lastPeriodChange,
    required String lastPeriodLabel,
  }) = _ProgressStatistics;

  factory ProgressStatistics.fromJson(Map<String, dynamic> json) =>
      _$ProgressStatisticsFromJson(json);
}

@freezed
class Achievement with _$Achievement {
  const factory Achievement({
    required String id,
    required String title,
    required String description,
    required String iconPath,
    required bool isUnlocked,
    required DateTime? unlockedAt,
    required AchievementType type,
    required Map<String, dynamic> criteria,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
}

@freezed
class AchievementType with _$AchievementType {
  const factory AchievementType.sugarFreeWeek() = _SugarFreeWeek;
  const factory AchievementType.itemsScanned({required int count}) = _ItemsScanned;
  const factory AchievementType.streak({required int days}) = _Streak;
  const factory AchievementType.lowSugarDay() = _LowSugarDay;
  const factory AchievementType.goalReached() = _GoalReached;

  factory AchievementType.fromJson(Map<String, dynamic> json) =>
      _$AchievementTypeFromJson(json);
}

@freezed
class ConsumptionDataPoint with _$ConsumptionDataPoint {
  const factory ConsumptionDataPoint({
    required DateTime date,
    required double sugarAmount,
    required String periodLabel,
  }) = _ConsumptionDataPoint;

  factory ConsumptionDataPoint.fromJson(Map<String, dynamic> json) =>
      _$ConsumptionDataPointFromJson(json);
}

@freezed
class ProgressData with _$ProgressData {
  const factory ProgressData({
    required ProgressStatistics statistics,
    required List<Achievement> achievements,
    required List<ConsumptionDataPoint> consumptionData,
    required String selectedPeriod, // 'weekly', 'monthly', 'yearly'
  }) = _ProgressData;

  factory ProgressData.fromJson(Map<String, dynamic> json) =>
      _$ProgressDataFromJson(json);
}
