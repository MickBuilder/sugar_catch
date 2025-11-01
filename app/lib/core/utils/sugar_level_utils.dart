import 'package:flutter/material.dart';

class SugarLevelUtils {
  // Sugar level thresholds
  static const double _mlLowThreshold = 1.5;
  static const double _mlModerateThreshold = 3.0;
  static const double _mlHighThreshold = 7.0;
  static const double _mlVeryHighThreshold = 13.0;
  
  static const double _gLowThreshold = 9.0;
  static const double _gModerateThreshold = 18.0;
  static const double _gHighThreshold = 31.0;
  static const double _gVeryHighThreshold = 45.0;

  /// Get sugar level color based on amount and unit
  static Color getSugarLevelColor(double sugarPer100g, String productUnit) {
    final unit = productUnit.toLowerCase();
    // Logical color progression: Green → Yellow → Orange → Red → Dark Red
    List<Color> colors = [
      const Color(0xFF2E7D32),   // Low sugar - Dark green (good)
      const Color(0xFF8BC34A),   // Low impact - Light green (okay)
      const Color(0xFFFF9800),  // A bit too sweet - Orange (caution)
      const Color(0xFFF44336),  // Too sweet - Red (bad)
      const Color(0xFFB71C1C),  // Dangerously sweet - Dark red (very bad)
    ];
    List<double> thresholds;
    if (unit == 'ml') {
      thresholds = [_mlLowThreshold, _mlModerateThreshold, _mlHighThreshold, _mlVeryHighThreshold];
    } else {
      thresholds = [_gLowThreshold, _gModerateThreshold, _gHighThreshold, _gVeryHighThreshold];
    }
    for (int i = 0; i < thresholds.length; i++) {
      if (sugarPer100g <= thresholds[i]) {
        return colors[i];
      }
    }
    return colors.last;
  }

  /// Get sugar level text description
  static String getSugarLevelText(double sugarPer100g, String productUnit) {
    final unit = productUnit.toLowerCase();
    List<double> thresholds;
    // Use Yuka-style labels for better user understanding
    List<String> labels = ['Low sugar', 'Low impact', 'A bit too sweet', 'Too sweet', 'Dangerously sweet'];

    if (unit == 'ml') {
      thresholds = [_mlLowThreshold, _mlModerateThreshold, _mlHighThreshold, _mlVeryHighThreshold];
    } else {
      thresholds = [_gLowThreshold, _gModerateThreshold, _gHighThreshold, _gVeryHighThreshold];
    }

    for (int i = 0; i < thresholds.length; i++) {
      if (sugarPer100g <= thresholds[i]) {
        return labels[i];
      }
    }
    return labels.last;
  }

  /// Get maximum value for progress calculation
  static double getMaxValue(String productUnit) {
    return productUnit.toLowerCase() == 'ml' ? _mlVeryHighThreshold : _gVeryHighThreshold;
  }

  /// Get progress value (0.0 to 1.0)
  static double getProgressValue(double sugarPer100g, String productUnit) {
    final maxValue = getMaxValue(productUnit);
    return (sugarPer100g / maxValue).clamp(0.0, 1.0);
  }

  // Daily sugar thresholds (based on WHO recommendation of 25g/day)
  static const double _dailyLowThreshold = 15.0;    // Under 15g/day
  static const double _dailyModerateThreshold = 30.0; // 15-30g/day
  static const double _dailyHighThreshold = 50.0;    // 30-50g/day
  static const double _dailyVeryHighThreshold = 75.0; // 50-75g/day

  /// Get color for daily sugar totals
  static Color getDailySugarColor(double totalSugar) {
    List<Color> colors = [
      const Color(0xFF2E7D32),   // Low sugar - Dark green (good)
      const Color(0xFF8BC34A),   // Low impact - Light green (okay)
      const Color(0xFFFF9800),  // A bit too sweet - Orange (caution)
      const Color(0xFFF44336),  // Too sweet - Red (bad)
      const Color(0xFFB71C1C),  // Much too sweet - Dark red (very bad)
    ];
    
    List<double> thresholds = [
      _dailyLowThreshold,
      _dailyModerateThreshold,
      _dailyHighThreshold,
      _dailyVeryHighThreshold,
    ];
    
    for (int i = 0; i < thresholds.length; i++) {
      if (totalSugar <= thresholds[i]) {
        return colors[i];
      }
    }
    return colors.last;
  }

  /// Get text description for daily sugar totals
  static String getDailySugarText(double totalSugar) {
    List<String> labels = ['Low sugar', 'Low impact', 'A bit too sweet', 'Too sweet', 'Much too sweet'];
    
    List<double> thresholds = [
      _dailyLowThreshold,
      _dailyModerateThreshold,
      _dailyHighThreshold,
      _dailyVeryHighThreshold,
    ];
    
    for (int i = 0; i < thresholds.length; i++) {
      if (totalSugar <= thresholds[i]) {
        return labels[i];
      }
    }
    return labels.last;
  }
}
