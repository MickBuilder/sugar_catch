import 'dart:convert';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:sugar_catch/features/scan/data/product_model.dart';

class HistoryService {
  static const String _historyBoxName = 'scan_history';
  static const int _maxHistoryItems = 50; // Keep last 50 scanned items

  static Box<String>? _historyBox;

  static Future<void> init() async {
    _historyBox = await Hive.openBox<String>(_historyBoxName);
  }

  // Add a scanned product to history
  static Future<void> addToHistory(Product product, SugarInfo sugarInfo) async {
    if (_historyBox != null) {
      final historyItem = HistoryItem(
        product: product,
        sugarInfo: sugarInfo,
        scannedAt: DateTime.now(),
      );

      final historyJson = historyItem.toJson();
      final historyJsonString = jsonEncode(historyJson);

      // Use timestamp as key to maintain chronological order
      final timestamp = historyItem.scannedAt.millisecondsSinceEpoch.toString();
      await _historyBox!.put(timestamp, historyJsonString);

      // Clean up old items if we exceed the limit
      await _cleanupOldItems();

      print('📚 [HISTORY] Added to history: ${product.productName}');
    }
  }

  // Get recent scan history
  static List<HistoryItem> getRecentHistory({int limit = 10}) {
    if (_historyBox == null) return [];

    final allKeys = _historyBox!.keys.toList();
    allKeys.sort((a, b) => b.compareTo(a)); // Sort descending (newest first)

    final recentKeys = allKeys.take(limit).toList();
    final historyItems = <HistoryItem>[];

    for (final key in recentKeys) {
      final historyJsonString = _historyBox!.get(key);
      if (historyJsonString != null) {
        try {
          final historyJson =
              jsonDecode(historyJsonString) as Map<String, dynamic>;
          final historyItem = HistoryItem.fromJson(historyJson);
          historyItems.add(historyItem);
        } catch (e) {
          print('📚 [HISTORY] Error parsing history item: $e');
        }
      }
    }

    return historyItems;
  }

  // Get weekly sugar consumption data
  static Map<String, double> getWeeklySugarData() {
    if (_historyBox == null) return {};

    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final weekData = <String, double>{};

    // Initialize with 0 for each day
    for (int i = 0; i < 7; i++) {
      final day = weekStart.add(Duration(days: i));
      final dayKey = _getDayKey(day);
      weekData[dayKey] = 0.0;
    }

    // Sum up sugar consumption for each day
    final allKeys = _historyBox!.keys.toList();
    for (final key in allKeys) {
      final historyJsonString = _historyBox!.get(key);
      if (historyJsonString != null) {
        try {
          final historyJson =
              jsonDecode(historyJsonString) as Map<String, dynamic>;
          final historyItem = HistoryItem.fromJson(historyJson);

          final dayKey = _getDayKey(historyItem.scannedAt);
          if (weekData.containsKey(dayKey)) {
            weekData[dayKey] =
                (weekData[dayKey] ?? 0.0) +
                historyItem.sugarInfo.totalSugarsInProduct;
          }
        } catch (e) {
          print('📚 [HISTORY] Error parsing history item for weekly data: $e');
        }
      }
    }

    return weekData;
  }

  // Clear all history
  static Future<void> clearHistory() async {
    if (_historyBox != null) {
      await _historyBox!.clear();
      print('📚 [HISTORY] Cleared all history');
    }
  }

  // Get history statistics
  static Map<String, int> getHistoryStats() {
    return {'total_scans': _historyBox?.length ?? 0};
  }

  // Private helper methods
  static Future<void> _cleanupOldItems() async {
    if (_historyBox == null) return;

    final allKeys = _historyBox!.keys.toList();
    if (allKeys.length > _maxHistoryItems) {
      allKeys.sort(); // Sort ascending (oldest first)
      final keysToDelete = allKeys.take(allKeys.length - _maxHistoryItems);

      for (final key in keysToDelete) {
        await _historyBox!.delete(key);
      }

      print('📚 [HISTORY] Cleaned up ${keysToDelete.length} old items');
    }
  }

  static String _getDayKey(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

class HistoryItem {
  final Product product;
  final SugarInfo sugarInfo;
  final DateTime scannedAt;

  const HistoryItem({
    required this.product,
    required this.sugarInfo,
    required this.scannedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'sugarInfo': sugarInfo.toJson(),
      'scannedAt': scannedAt.toIso8601String(),
    };
  }

  factory HistoryItem.fromJson(Map<String, dynamic> json) {
    return HistoryItem(
      product: Product.fromJson(json['product']),
      sugarInfo: SugarInfo.fromJson(json['sugarInfo']),
      scannedAt: DateTime.parse(json['scannedAt']),
    );
  }
}
