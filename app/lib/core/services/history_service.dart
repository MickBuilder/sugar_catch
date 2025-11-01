import 'dart:developer';
import 'dart:convert';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:cleanfood/features/scan/data/product_model.dart';

class HistoryService {
  static const String _historyBoxName = 'scan_history';
  // No limit - store all scanned items indefinitely

  static Box<String>? _historyBox;

  static Future<void> init() async {
    _historyBox = await Hive.openBox<String>(_historyBoxName);
  }

  // Add a scanned product to history
  static Future<void> addToHistory(Product product, SugarInfo sugarInfo) async {
    if (_historyBox != null) {
      final now = DateTime.now();
      final dayOfWeek = _getDayOfWeek(now);
      
      // Check if this product already exists in history
      final existingKey = _findExistingProductKey(product.code);
      
      if (existingKey != null) {
        // Product exists, update with new scan data
        log('📚 [HISTORY] Product already exists, updating scan data: ${product.productName}', name: 'Service');
        
        // Get existing item
        final existingItem = _getHistoryItem(existingKey);
        if (existingItem != null) {
          // Update day of week count
          final updatedDayCounts = Map<String, int>.from(existingItem.dayOfWeekCounts);
          updatedDayCounts[dayOfWeek] = (updatedDayCounts[dayOfWeek] ?? 0) + 1;
          
          // Update recent scans (keep last 20)
          final updatedRecentScans = List<DateTime>.from(existingItem.recentScans);
          updatedRecentScans.add(now);
          if (updatedRecentScans.length > 20) {
            updatedRecentScans.removeAt(0); // Remove oldest
          }
          
          // Create updated item
          final updatedItem = existingItem.copyWith(
            lastScannedAt: now,
            scanCount: existingItem.scanCount + 1,
            recentScans: updatedRecentScans,
            dayOfWeekCounts: updatedDayCounts,
          );

          // Remove old entry and add updated one
          await _historyBox!.delete(existingKey);
          
          final historyJson = updatedItem.toJson();
          final historyJsonString = jsonEncode(historyJson);
          final timestamp = now.millisecondsSinceEpoch.toString();
          await _historyBox!.put(timestamp, historyJsonString);
          
          log('📚 [HISTORY] Updated scan data for: ${product.productName} (${updatedItem.scanCount} total scans', name: 'Service');
        }
      } else {
        // Product doesn't exist, add new entry
        final historyItem = HistoryItem(
          product: product,
          sugarInfo: sugarInfo,
          lastScannedAt: now,
          scanCount: 1,
          firstScannedAt: now,
          recentScans: [now],
          dayOfWeekCounts: {dayOfWeek: 1},
        );

        final historyJson = historyItem.toJson();
        final historyJsonString = jsonEncode(historyJson);

        // Use timestamp as key to maintain chronological order
        final timestamp = now.millisecondsSinceEpoch.toString();
        await _historyBox!.put(timestamp, historyJsonString);

        log('📚 [HISTORY] Added new product to history: ${product.productName}', name: 'Service');
      }

      // No cleanup - store all items indefinitely
      log('📚 [HISTORY] Total items in history: ${_historyBox?.length ?? 0}', name: 'Service');
    }
  }

  // Get all scan history (no limit by default)
  static List<HistoryItem> getAllHistory() {
    if (_historyBox == null) return [];

    final allKeys = _historyBox!.keys.toList();
    allKeys.sort((a, b) => b.compareTo(a)); // Sort descending (newest first)

    final historyItems = <HistoryItem>[];

    for (final key in allKeys) {
      final historyJsonString = _historyBox!.get(key);
      if (historyJsonString != null) {
        try {
          final historyJson =
              jsonDecode(historyJsonString) as Map<String, dynamic>;
          final historyItem = HistoryItem.fromJson(historyJson);
          historyItems.add(historyItem);
        } catch (e) {
          log('📚 [HISTORY] Error parsing history item: $e', name: 'Service');
        }
      }
    }

    return historyItems;
  }

  // Get paginated history (for progressive loading)
  static PaginatedHistoryResult getHistoryPaginated({
    int offset = 0,
    int limit = 20,
  }) {
    if (_historyBox == null) {
      return PaginatedHistoryResult(items: [], hasMore: false, total: 0);
    }

    final allKeys = _historyBox!.keys.toList();
    allKeys.sort((a, b) => b.compareTo(a)); // Sort descending (newest first)

    final total = allKeys.length;
    final hasMore = offset + limit < total;

    final paginatedKeys = allKeys.skip(offset).take(limit).toList();
    final historyItems = <HistoryItem>[];

    for (final key in paginatedKeys) {
      final historyJsonString = _historyBox!.get(key);
      if (historyJsonString != null) {
        try {
          final historyJson =
              jsonDecode(historyJsonString) as Map<String, dynamic>;
          final historyItem = HistoryItem.fromJson(historyJson);
          historyItems.add(historyItem);
        } catch (e) {
          log('📚 [HISTORY] Error parsing history item: $e', name: 'Service');
        }
      }
    }

    return PaginatedHistoryResult(
      items: historyItems,
      hasMore: hasMore,
      total: total,
    );
  }

  // Get recent scan history (with optional limit for UI display)
  static List<HistoryItem> getRecentHistory({int? limit}) {
    final allItems = getAllHistory();
    
    if (limit != null && limit > 0) {
      return allItems.take(limit).toList();
    }
    
    return allItems;
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

          final dayKey = _getDayKey(historyItem.lastScannedAt);
          if (weekData.containsKey(dayKey)) {
            weekData[dayKey] =
                (weekData[dayKey] ?? 0.0) +
                historyItem.sugarInfo.totalSugarsInProduct;
          }
        } catch (e) {
          log('📚 [HISTORY] Error parsing history item for weekly data: $e', name: 'Service');
        }
      }
    }

    return weekData;
  }

  // Clear all history
  static Future<void> clearHistory() async {
    if (_historyBox != null) {
      await _historyBox!.clear();
      log('📚 [HISTORY] Cleared all history', name: 'Service');
    }
  }

  // Get history statistics
  static Map<String, int> getHistoryStats() {
    final totalItems = _historyBox?.length ?? 0;
    final uniqueProducts = getAllHistory().map((item) => item.product.code).toSet().length;
    
    return {
      'total_scans': totalItems,
      'unique_products': uniqueProducts,
    };
  }

  // Get unique products count (products scanned at least once)
  static int getUniqueProductsCount() {
    return getAllHistory().map((item) => item.product.code).toSet().length;
  }

  // Get total scan count across all products
  static int getTotalScanCount() {
    return getAllHistory().fold(0, (sum, item) => sum + item.scanCount);
  }

  static String _getDayKey(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  // Helper method to find existing product key by barcode
  static String? _findExistingProductKey(String barcode) {
    if (_historyBox == null) return null;

    // Iterate through all keys to find matching product
    for (final key in _historyBox!.keys) {
      final historyJsonString = _historyBox!.get(key);
      if (historyJsonString != null) {
        try {
          final historyJson = jsonDecode(historyJsonString) as Map<String, dynamic>;
          final historyItem = HistoryItem.fromJson(historyJson);
          
          // Check if this history item has the same product code
          if (historyItem.product.code == barcode) {
            return key;
          }
        } catch (e) {
          log('📚 [HISTORY] Error parsing history item for duplicate check: $e', name: 'Service');
        }
      }
    }
    
    return null; // No existing product found
  }

  // Helper method to get existing history item by key
  static HistoryItem? _getHistoryItem(String key) {
    if (_historyBox == null) return null;

    final historyJsonString = _historyBox!.get(key);
    if (historyJsonString != null) {
      try {
        final historyJson = jsonDecode(historyJsonString) as Map<String, dynamic>;
        return HistoryItem.fromJson(historyJson);
      } catch (e) {
        log('📚 [HISTORY] Error parsing history item: $e', name: 'Service');
      }
    }
    
    return null;
  }

  // Helper method to get day of week name
  static String _getDayOfWeek(DateTime date) {
    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[date.weekday - 1];
  }
}

// Paginated result model
class PaginatedHistoryResult {
  final List<HistoryItem> items;
  final bool hasMore;
  final int total;

  PaginatedHistoryResult({
    required this.items,
    required this.hasMore,
    required this.total,
  });
}

class HistoryItem {
  final Product product;
  final SugarInfo sugarInfo;
  final DateTime lastScannedAt;
  final int scanCount;
  final DateTime firstScannedAt;
  final List<DateTime> recentScans; // Last 20 scans
  final Map<String, int> dayOfWeekCounts; // Monday: 5, Tuesday: 2, etc.

  const HistoryItem({
    required this.product,
    required this.sugarInfo,
    required this.lastScannedAt,
    required this.scanCount,
    required this.firstScannedAt,
    required this.recentScans,
    required this.dayOfWeekCounts,
  });

  // Helper methods for pattern analysis
  String get scanPattern => _getScanPattern();
  String get frequencyPattern => _getFrequencyPattern();
  String get timeSinceLastScan => _getTimeSinceLastScan();

  String _getScanPattern() {
    if (dayOfWeekCounts.isEmpty) return "No pattern yet";
    
    final maxDay = dayOfWeekCounts.entries.reduce((a, b) => a.value > b.value ? a : b);
    final totalScans = dayOfWeekCounts.values.fold(0, (sum, count) => sum + count);
    
    if (maxDay.value > totalScans * 0.3) {
      return "Usually scanned on ${maxDay.key}s";
    }
    return "No clear daily pattern";
  }

  String _getFrequencyPattern() {
    final daysBetween = lastScannedAt.difference(firstScannedAt).inDays;
    if (daysBetween == 0) return "Scanned once";
    
    final avgScansPerDay = scanCount / daysBetween;
    
    if (avgScansPerDay > 0.5) {
      return "Frequently scanned (${avgScansPerDay.toStringAsFixed(1)} times/day)";
    } else if (avgScansPerDay > 0.1) {
      return "Occasionally scanned (${avgScansPerDay.toStringAsFixed(1)} times/day)";
    } else {
      return "Rarely scanned (${avgScansPerDay.toStringAsFixed(1)} times/day)";
    }
  }

  String _getTimeSinceLastScan() {
    final daysSince = DateTime.now().difference(lastScannedAt).inDays;
    
    if (daysSince == 0) {
      return "Scanned today";
    } else if (daysSince == 1) {
      return "Scanned yesterday";
    } else if (daysSince < 7) {
      return "Scanned $daysSince days ago";
    } else {
      return "Scanned ${(daysSince / 7).floor()} weeks ago";
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'sugarInfo': sugarInfo.toJson(),
      'lastScannedAt': lastScannedAt.toIso8601String(),
      'scanCount': scanCount,
      'firstScannedAt': firstScannedAt.toIso8601String(),
      'recentScans': recentScans.map((e) => e.toIso8601String()).toList(),
      'dayOfWeekCounts': dayOfWeekCounts,
    };
  }

  factory HistoryItem.fromJson(Map<String, dynamic> json) {
    return HistoryItem(
      product: Product.fromJson(json['product']),
      sugarInfo: SugarInfo.fromJson(json['sugarInfo']),
      lastScannedAt: DateTime.parse(json['lastScannedAt'] ?? json['scannedAt']), // Backward compatibility
      scanCount: json['scanCount'] ?? 1, // Backward compatibility
      firstScannedAt: DateTime.parse(json['firstScannedAt'] ?? json['scannedAt']), // Backward compatibility
      recentScans: (json['recentScans'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e))
          .toList() ?? [DateTime.parse(json['scannedAt'])], // Backward compatibility
      dayOfWeekCounts: Map<String, int>.from(json['dayOfWeekCounts'] ?? {}), // Backward compatibility
    );
  }

  // Create a copy with updated data
  HistoryItem copyWith({
    Product? product,
    SugarInfo? sugarInfo,
    DateTime? lastScannedAt,
    int? scanCount,
    DateTime? firstScannedAt,
    List<DateTime>? recentScans,
    Map<String, int>? dayOfWeekCounts,
  }) {
    return HistoryItem(
      product: product ?? this.product,
      sugarInfo: sugarInfo ?? this.sugarInfo,
      lastScannedAt: lastScannedAt ?? this.lastScannedAt,
      scanCount: scanCount ?? this.scanCount,
      firstScannedAt: firstScannedAt ?? this.firstScannedAt,
      recentScans: recentScans ?? this.recentScans,
      dayOfWeekCounts: dayOfWeekCounts ?? this.dayOfWeekCounts,
    );
  }
}
