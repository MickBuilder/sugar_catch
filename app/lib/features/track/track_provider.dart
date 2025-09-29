import 'dart:developer';
import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweetr/features/scan/data/product_model.dart';
import 'package:sweetr/features/track/data/track_models.dart';
import 'package:sweetr/features/track/data/track_service.dart';
import 'package:sweetr/core/services/history_service.dart';

part 'track_provider.g.dart';

@riverpod
class TrackNotifier extends _$TrackNotifier {
  @override
  DailyLog build() {
    // Load today's log on initialization
    return _loadTodaysLog();
  }

  DailyLog _loadTodaysLog() {
    return TrackService.getTodaysLog();
  }

  // Add product to daily log
  Future<void> addToDailyLog({
    required Product product,
    required SugarInfo sugarInfo,
    required double quantity,
  }) async {
    log('📊 [TRACK_PROVIDER] Adding to daily log: ${product.productName}', name: 'Track');
    
    await TrackService.addToDailyLog(
      product: product,
      sugarInfo: sugarInfo,
      quantity: quantity,
    );
    
    // Reload today's log
    state = _loadTodaysLog();
  }

  // Remove log entry
  Future<void> removeLogEntry(String entryId) async {
    log('📊 [TRACK_PROVIDER] Removing log entry: $entryId', name: 'Track');
    
    await TrackService.removeLogEntry(entryId);
    
    // Reload today's log
    state = _loadTodaysLog();
  }

  // Refresh today's log
  void refreshTodaysLog() {
    state = _loadTodaysLog();
  }
}

// Provider for getting recent history (for "Recently Scanned" section)
@riverpod
List<HistoryItem> recentHistory(Ref ref) {
  final history = HistoryService.getRecentHistory(limit: 10);
  return history;
}

// Provider for getting logs for the last N days (for graphs)
@riverpod
List<DailyLog> logsForLastDays(Ref ref, int days) {
  return TrackService.getLogsForLastDays(days);
}

// Provider for getting weekly sugar total
@riverpod
double weeklySugarTotal(Ref ref) {
  return TrackService.getWeeklySugarTotal();
}

// Provider for getting average daily sugar
@riverpod
double averageDailySugar(Ref ref, int days) {
  return TrackService.getAverageDailySugar(days);
}
