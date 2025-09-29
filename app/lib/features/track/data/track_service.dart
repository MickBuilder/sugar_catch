import 'dart:developer';
import 'dart:convert';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:sweetr/features/scan/data/product_model.dart';
import 'package:sweetr/features/track/data/track_models.dart';

class TrackService {
  static Box<String>? _trackBox;
  static const String _trackBoxName = 'track_data';

  static Future<void> init() async {
    _trackBox = await Hive.openBox<String>(_trackBoxName);
    log('📊 [TRACK] TrackService initialized', name: 'Track');
  }

  // Add a product to today's log
  static Future<void> addToDailyLog({
    required Product product,
    required SugarInfo sugarInfo,
    required double quantity,
  }) async {
    if (_trackBox == null) return;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    // Calculate serving size
    final servingSize = ServingSizeCalculator.calculateServingSize(
      product: product,
      sugarInfo: sugarInfo,
      quantity: quantity,
    );
    
    // Create log entry
    final logEntry = LogEntry(
      id: '${product.code}_${now.millisecondsSinceEpoch}',
      product: product,
      sugarInfo: sugarInfo,
      servingSize: servingSize,
      loggedAt: now,
      totalSugarAmount: servingSize.sugarPerServing,
    );

    // Get today's log
    final todayKey = _getDateKey(today);
    final existingLogJson = _trackBox!.get(todayKey);
    
    DailyLog dailyLog;
    if (existingLogJson != null) {
      final existingLog = DailyLog.fromJson(jsonDecode(existingLogJson));
      final updatedEntries = List<LogEntry>.from(existingLog.entries)..add(logEntry);
      final totalSugar = updatedEntries.fold(0.0, (sum, entry) => sum + entry.totalSugarAmount);
      
      dailyLog = existingLog.copyWith(
        entries: updatedEntries,
        totalSugar: totalSugar,
      );
    } else {
      dailyLog = DailyLog(
        date: today,
        entries: [logEntry],
        totalSugar: logEntry.totalSugarAmount,
      );
    }

    // Save updated log
    final logJson = jsonEncode(dailyLog.toJson());
    await _trackBox!.put(todayKey, logJson);
    
    log('📊 [TRACK] Added ${product.productName} to daily log: ${servingSize.sugarPerServing.toStringAsFixed(1)}g sugar', name: 'Track');
  }

  // Get today's log
  static DailyLog getTodaysLog() {
    if (_trackBox == null) {
      // Return empty log if service not initialized
      final today = DateTime.now();
      return DailyLog(
        date: today,
        entries: [],
        totalSugar: 0.0,
      );
    }
    
    final today = DateTime.now();
    final todayKey = _getDateKey(today);
    final logJson = _trackBox!.get(todayKey);
    
    if (logJson != null) {
      return DailyLog.fromJson(jsonDecode(logJson));
    }
    
    // Return empty log for today if no data exists
    return DailyLog(
      date: today,
      entries: [],
      totalSugar: 0.0,
    );
  }

  // Get logs for a date range
  static List<DailyLog> getLogsForDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    if (_trackBox == null) return [];
    
    final logs = <DailyLog>[];
    var currentDate = DateTime(startDate.year, startDate.month, startDate.day);
    final endDateOnly = DateTime(endDate.year, endDate.month, endDate.day);
    
    while (!currentDate.isAfter(endDateOnly)) {
      final dateKey = _getDateKey(currentDate);
      final logJson = _trackBox!.get(dateKey);
      
      if (logJson != null) {
        try {
          final log = DailyLog.fromJson(jsonDecode(logJson));
          logs.add(log);
        } catch (e) {
          log('📊 [TRACK] Error parsing log for $dateKey: $e', name: 'Track');
        }
      }
      
      currentDate = currentDate.add(const Duration(days: 1));
    }
    
    return logs;
  }

  // Get logs for the last N days
  static List<DailyLog> getLogsForLastDays(int days) {
    final endDate = DateTime.now();
    final startDate = endDate.subtract(Duration(days: days - 1));
    return getLogsForDateRange(startDate: startDate, endDate: endDate);
  }

  // Remove a log entry
  static Future<void> removeLogEntry(String entryId) async {
    if (_trackBox == null) return;
    
    final today = DateTime.now();
    final todayKey = _getDateKey(today);
    final logJson = _trackBox!.get(todayKey);
    
    if (logJson != null) {
      final dailyLog = DailyLog.fromJson(jsonDecode(logJson));
      final updatedEntries = dailyLog.entries.where((entry) => entry.id != entryId).toList();
      final totalSugar = updatedEntries.fold(0.0, (sum, entry) => sum + entry.totalSugarAmount);
      
      final updatedLog = dailyLog.copyWith(
        entries: updatedEntries,
        totalSugar: totalSugar,
      );
      
      final updatedLogJson = jsonEncode(updatedLog.toJson());
      await _trackBox!.put(todayKey, updatedLogJson);
      
      log('📊 [TRACK] Removed log entry: $entryId', name: 'Track');
    }
  }

  // Get total sugar for a specific date
  static double getTotalSugarForDate(DateTime date) {
    final dateKey = _getDateKey(date);
    final logJson = _trackBox?.get(dateKey);
    
    if (logJson != null) {
      try {
        final log = DailyLog.fromJson(jsonDecode(logJson));
        return log.totalSugar;
      } catch (e) {
        log('📊 [TRACK] Error parsing log for $dateKey: $e', name: 'Track');
      }
    }
    
    return 0.0;
  }

  // Helper method to generate date key
  static String _getDateKey(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  // Get average daily sugar for the last N days
  static double getAverageDailySugar(int days) {
    final logs = getLogsForLastDays(days);
    if (logs.isEmpty) return 0.0;
    
    final totalSugar = logs.fold(0.0, (sum, log) => sum + log.totalSugar);
    return totalSugar / logs.length;
  }

  // Get weekly sugar total
  static double getWeeklySugarTotal() {
    final logs = getLogsForLastDays(7);
    return logs.fold(0.0, (sum, log) => sum + log.totalSugar);
  }
}
