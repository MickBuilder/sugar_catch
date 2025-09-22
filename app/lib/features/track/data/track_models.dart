import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugar_catch/features/scan/data/product_model.dart';

part 'track_models.freezed.dart';
part 'track_models.g.dart';

@freezed
class DailyLog with _$DailyLog {
  const factory DailyLog({
    required DateTime date,
    required List<LogEntry> entries,
    @Default(0.0) double totalSugar,
  }) = _DailyLog;

  factory DailyLog.fromJson(Map<String, dynamic> json) =>
      _$DailyLogFromJson(json);
}

@freezed
class LogEntry with _$LogEntry {
  const factory LogEntry({
    required String id,
    required Product product,
    required SugarInfo sugarInfo,
    required ServingSize servingSize,
    required DateTime loggedAt,
    required double totalSugarAmount,
  }) = _LogEntry;

  factory LogEntry.fromJson(Map<String, dynamic> json) =>
      _$LogEntryFromJson(json);
}

@freezed
class ServingSize with _$ServingSize {
  const factory ServingSize({
    required double quantity,
    required String unit,
    required double sugarPerServing,
  }) = _ServingSize;

  factory ServingSize.fromJson(Map<String, dynamic> json) =>
      _$ServingSizeFromJson(json);
}

// Helper class for serving size calculations
class ServingSizeCalculator {
  static ServingSize calculateServingSize({
    required Product product,
    required SugarInfo sugarInfo,
    required double quantity,
  }) {
    // Use product unit if available, otherwise default to 'g'
    final unit = product.productQuantityUnit?.toLowerCase() ?? 'g';
    
    // Calculate sugar per serving: (sugar per 100g * quantity) / 100
    final sugarPerServing = (sugarInfo.sugarsPer100g * quantity) / 100;
    
    return ServingSize(
      quantity: quantity,
      unit: unit,
      sugarPerServing: sugarPerServing,
    );
  }
  
  static String formatServingSize(ServingSize servingSize) {
    if (servingSize.quantity == 1.0) {
      return '1 ${servingSize.unit}';
    } else if (servingSize.quantity == servingSize.quantity.toInt().toDouble()) {
      return '${servingSize.quantity.toInt()} ${servingSize.unit}';
    } else {
      return '${servingSize.quantity.toStringAsFixed(1)} ${servingSize.unit}';
    }
  }
}
