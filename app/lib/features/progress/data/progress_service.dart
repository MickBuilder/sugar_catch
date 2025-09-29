import 'dart:developer';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:sweetr/features/progress/data/progress_models.dart';
import 'package:sweetr/features/track/data/track_service.dart';
import 'package:sweetr/core/services/history_service.dart';

class ProgressService {
  static Box<String>? _progressBox;
  static const String _progressBoxName = 'progress_data';

  static Future<void> init() async {
    _progressBox = await Hive.openBox<String>(_progressBoxName);
    log('📊 [PROGRESS] ProgressService initialized', name: 'Progress');
  }

  // Get progress statistics
  static ProgressStatistics getStatistics() {
    final logs = TrackService.getLogsForLastDays(365); // Last year
    
    // Calculate streaks
    final currentStreak = _calculateCurrentStreak(logs);
    final bestStreak = _calculateBestStreak(logs);
    
    // Calculate average daily intake (last 30 days)
    final last30Days = TrackService.getLogsForLastDays(30);
    final averageDailyIntake = _calculateAverageDailyIntake(last30Days);
    
    // Calculate total sugar intake (last 30 days)
    final totalSugarIntake = _calculateTotalSugarIntake(last30Days);
    
    // Calculate change from previous period
    final previous30Days = TrackService.getLogsForDateRange(
      startDate: DateTime.now().subtract(const Duration(days: 60)),
      endDate: DateTime.now().subtract(const Duration(days: 30)),
    );
    final previousAverage = _calculateAverageDailyIntake(previous30Days);
    final lastPeriodChange = previousAverage > 0 
        ? ((averageDailyIntake - previousAverage) / previousAverage) * 100
        : 0.0;
    
    return ProgressStatistics(
      currentStreak: currentStreak,
      bestStreak: bestStreak,
      averageDailyIntake: averageDailyIntake,
      totalSugarIntake: totalSugarIntake,
      lastPeriodChange: lastPeriodChange,
      lastPeriodLabel: 'Last 30 Days',
    );
  }

  // Get achievements
  static List<Achievement> getAchievements() {
    final logs = TrackService.getLogsForLastDays(365);
    final history = HistoryService.getRecentHistory(limit: 1000);
    
    return [
      _createSugarFreeWeekAchievement(logs),
      _createItemsScannedAchievement(history.length),
      _createStreakAchievement(logs),
      _createLowSugarDayAchievement(logs),
      _createGoalReachedAchievement(logs),
    ];
  }

  // Get consumption data for graph
  static List<ConsumptionDataPoint> getConsumptionData(String period) {
    switch (period) {
      case 'weekly':
        return _getWeeklyConsumptionData();
      case 'monthly':
        return _getMonthlyConsumptionData();
      case 'yearly':
        return _getYearlyConsumptionData();
      default:
        return _getMonthlyConsumptionData();
    }
  }

  // Calculate current streak (consecutive days with sugar intake)
  static int _calculateCurrentStreak(List<dynamic> logs) {
    if (logs.isEmpty) return 0;
    
    final today = DateTime.now();
    int streak = 0;
    
    for (int i = 0; i < 365; i++) {
      final date = today.subtract(Duration(days: i));
      final dayLogs = logs.where((log) => _isSameDay(log.date, date)).toList();
      
      if (dayLogs.isNotEmpty && dayLogs.first.totalSugar > 0) {
        streak++;
      } else {
        break;
      }
    }
    
    return streak;
  }

  // Calculate best streak
  static int _calculateBestStreak(List<dynamic> logs) {
    if (logs.isEmpty) return 0;
    
    int bestStreak = 0;
    int currentStreak = 0;
    
    // Sort logs by date
    final sortedLogs = List.from(logs)..sort((a, b) => a.date.compareTo(b.date));
    
    for (final log in sortedLogs) {
      if (log.totalSugar > 0) {
        currentStreak++;
        bestStreak = currentStreak > bestStreak ? currentStreak : bestStreak;
      } else {
        currentStreak = 0;
      }
    }
    
    return bestStreak;
  }

  // Calculate average daily intake
  static double _calculateAverageDailyIntake(List<dynamic> logs) {
    if (logs.isEmpty) return 0.0;
    
    final totalSugar = logs.fold(0.0, (sum, log) => sum + log.totalSugar);
    return totalSugar / logs.length;
  }

  // Calculate total sugar intake
  static double _calculateTotalSugarIntake(List<dynamic> logs) {
    return logs.fold(0.0, (sum, log) => sum + log.totalSugar);
  }

  // Check if two dates are the same day
  static bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
           date1.month == date2.month &&
           date1.day == date2.day;
  }

  // Create sugar-free week achievement
  static Achievement _createSugarFreeWeekAchievement(List<dynamic> logs) {
    final now = DateTime.now();
    bool hasSugarFreeWeek = false;
    DateTime? unlockedAt;
    
    // Check last 7 days
    for (int i = 0; i < 7; i++) {
      final date = now.subtract(Duration(days: i));
      final dayLogs = logs.where((log) => _isSameDay(log.date, date)).toList();
      
      if (dayLogs.isNotEmpty && dayLogs.first.totalSugar > 0) {
        hasSugarFreeWeek = false;
        break;
      }
      hasSugarFreeWeek = true;
    }
    
    if (hasSugarFreeWeek) {
      unlockedAt = now.subtract(const Duration(days: 7));
    }
    
    return Achievement(
      id: 'sugar_free_week',
      title: 'Sugar-Free Week',
      description: 'Go 7 days without consuming sugar',
      iconPath: 'assets/achievements/sugar_free_week.png',
      isUnlocked: hasSugarFreeWeek,
      unlockedAt: unlockedAt,
      type: const AchievementType.sugarFreeWeek(),
      criteria: {'days': 7},
    );
  }

  // Create items scanned achievement
  static Achievement _createItemsScannedAchievement(int scannedCount) {
    final milestones = [10, 50, 100, 250, 500, 1000];
    int unlockedMilestone = 0;
    DateTime? unlockedAt;
    
    for (final milestone in milestones) {
      if (scannedCount >= milestone) {
        unlockedMilestone = milestone;
        unlockedAt = DateTime.now(); // Simplified - would need actual scan dates
      }
    }
    
    return Achievement(
      id: 'items_scanned_$unlockedMilestone',
      title: '$unlockedMilestone Items Scanned',
      description: 'Scan $unlockedMilestone products',
      iconPath: 'assets/achievements/items_scanned.png',
      isUnlocked: unlockedMilestone > 0,
      unlockedAt: unlockedAt,
      type: AchievementType.itemsScanned(count: unlockedMilestone),
      criteria: {'count': unlockedMilestone},
    );
  }

  // Create streak achievement
  static Achievement _createStreakAchievement(List<dynamic> logs) {
    final currentStreak = _calculateCurrentStreak(logs);
    final milestones = [7, 14, 30, 60, 90];
    int unlockedMilestone = 0;
    DateTime? unlockedAt;
    
    for (final milestone in milestones) {
      if (currentStreak >= milestone) {
        unlockedMilestone = milestone;
        unlockedAt = DateTime.now(); // Simplified
      }
    }
    
    return Achievement(
      id: 'streak_$unlockedMilestone',
      title: '$unlockedMilestone Day Streak',
      description: 'Maintain a $unlockedMilestone day streak',
      iconPath: 'assets/achievements/streak.png',
      isUnlocked: unlockedMilestone > 0,
      unlockedAt: unlockedAt,
      type: AchievementType.streak(days: unlockedMilestone),
      criteria: {'days': unlockedMilestone},
    );
  }

  // Create low sugar day achievement
  static Achievement _createLowSugarDayAchievement(List<dynamic> logs) {
    final last30Days = logs.take(30);
    final lowSugarDays = last30Days.where((log) => log.totalSugar <= 15.0).length;
    final isUnlocked = lowSugarDays >= 7; // 7 low sugar days in last 30
    
    return Achievement(
      id: 'low_sugar_days',
      title: 'Low Sugar Days',
      description: 'Have 7 days with ≤15g sugar in 30 days',
      iconPath: 'assets/achievements/low_sugar.png',
      isUnlocked: isUnlocked,
      unlockedAt: isUnlocked ? DateTime.now() : null,
      type: const AchievementType.lowSugarDay(),
      criteria: {'days': 7, 'threshold': 15.0},
    );
  }

  // Create goal reached achievement
  static Achievement _createGoalReachedAchievement(List<dynamic> logs) {
    // Simplified - would need actual goal tracking
    final isUnlocked = false;
    
    return Achievement(
      id: 'goal_reached',
      title: 'Goal Reached',
      description: 'Reach your daily sugar goal',
      iconPath: 'assets/achievements/goal.png',
      isUnlocked: isUnlocked,
      unlockedAt: null,
      type: const AchievementType.goalReached(),
      criteria: {},
    );
  }

  // Get weekly consumption data
  static List<ConsumptionDataPoint> _getWeeklyConsumptionData() {
    final logs = TrackService.getLogsForLastDays(7);
    final dataPoints = <ConsumptionDataPoint>[];
    
    for (int i = 6; i >= 0; i--) {
      final date = DateTime.now().subtract(Duration(days: i));
      final dayLogs = logs.where((log) => _isSameDay(log.date, date)).toList();
      final totalSugar = dayLogs.isNotEmpty ? dayLogs.first.totalSugar : 0.0;
      
      dataPoints.add(ConsumptionDataPoint(
        date: date,
        sugarAmount: totalSugar,
        periodLabel: _getDayName(date.weekday),
      ));
    }
    
    return dataPoints;
  }

  // Get monthly consumption data
  static List<ConsumptionDataPoint> _getMonthlyConsumptionData() {
    final logs = TrackService.getLogsForLastDays(30);
    final dataPoints = <ConsumptionDataPoint>[];
    
    // Group by weeks
    for (int week = 0; week < 4; week++) {
      final weekStart = DateTime.now().subtract(Duration(days: (week + 1) * 7));
      final weekEnd = DateTime.now().subtract(Duration(days: week * 7));
      
      final weekLogs = logs.where((log) => 
        log.date.isAfter(weekStart) && log.date.isBefore(weekEnd)
      ).toList();
      
      final weekTotal = weekLogs.fold(0.0, (sum, log) => sum + log.totalSugar);
      
      dataPoints.add(ConsumptionDataPoint(
        date: weekStart,
        sugarAmount: weekTotal,
        periodLabel: 'Week ${week + 1}',
      ));
    }
    
    return dataPoints.reversed.toList();
  }

  // Get yearly consumption data
  static List<ConsumptionDataPoint> _getYearlyConsumptionData() {
    final logs = TrackService.getLogsForLastDays(365);
    final dataPoints = <ConsumptionDataPoint>[];
    
    // Group by months
    for (int month = 0; month < 12; month++) {
      final monthDate = DateTime.now().subtract(Duration(days: month * 30));
      final monthLogs = logs.where((log) => 
        log.date.month == monthDate.month && log.date.year == monthDate.year
      ).toList();
      
      final monthTotal = monthLogs.fold(0.0, (sum, log) => sum + log.totalSugar);
      
      dataPoints.add(ConsumptionDataPoint(
        date: monthDate,
        sugarAmount: monthTotal,
        periodLabel: _getMonthName(monthDate.month),
      ));
    }
    
    return dataPoints.reversed.toList();
  }

  // Get day name
  static String _getDayName(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }

  // Get month name
  static String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
}
