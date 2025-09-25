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
    if (productUnit.toLowerCase() == 'ml') {
      if (sugarPer100g <= _mlLowThreshold) {
        return Colors.green[700]!; // Dark green
      } else if (sugarPer100g <= _mlModerateThreshold) {
        return Colors.green[500]!; // Light green
      } else if (sugarPer100g <= _mlHighThreshold) {
        return Colors.orange[600]!; // Orange
      } else if (sugarPer100g <= _mlVeryHighThreshold) {
        return Colors.red[600]!; // Red
      } else {
        return Colors.red[800]!; // Dark red
      }
    } else {
      // For g: 0, 9, 18, 31, 45
      if (sugarPer100g <= _gLowThreshold) {
        return Colors.green[700]!; // Dark green
      } else if (sugarPer100g <= _gModerateThreshold) {
        return Colors.green[500]!; // Light green
      } else if (sugarPer100g <= _gHighThreshold) {
        return Colors.orange[600]!; // Orange
      } else if (sugarPer100g <= _gVeryHighThreshold) {
        return Colors.red[600]!; // Red
      } else {
        return Colors.red[800]!; // Dark red
      }
    }
  }

  /// Get sugar level text description
  static String getSugarLevelText(double sugarPer100g, String productUnit) {
    if (productUnit.toLowerCase() == 'ml') {
      if (sugarPer100g <= _mlLowThreshold) return 'Very Low';
      if (sugarPer100g <= _mlModerateThreshold) return 'Low';
      if (sugarPer100g <= _mlHighThreshold) return 'Moderate';
      if (sugarPer100g <= _mlVeryHighThreshold) return 'High';
      return 'Very High';
    } else {
      if (sugarPer100g <= _gLowThreshold) return 'Very Low';
      if (sugarPer100g <= _gModerateThreshold) return 'Low';
      if (sugarPer100g <= _gHighThreshold) return 'Moderate';
      if (sugarPer100g <= _gVeryHighThreshold) return 'High';
      return 'Very High';
    }
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
}
