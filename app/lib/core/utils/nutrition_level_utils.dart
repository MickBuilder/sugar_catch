import 'package:flutter/cupertino.dart';

/// Utilities for determining nutrition level colors and labels
/// Inspired by Yuka's nutrition assessment system
class NutritionLevelUtils {
  // ========== SUGAR LEVELS ==========
  // Per 100g thresholds (based on WHO recommendations)
  static const double _sugarLowThreshold = 9.0;
  static const double _sugarModerateThreshold = 18.0;
  static const double _sugarHighThreshold = 31.0;
  static const double _sugarVeryHighThreshold = 45.0;

  /// Get sugar level color based on amount per 100g
  static Color getSugarLevelColor(double sugarPer100g) {
    if (sugarPer100g <= _sugarLowThreshold) {
      return const Color(0xFF2E7D32); // Low sugar - Dark green (good)
    } else if (sugarPer100g <= _sugarModerateThreshold) {
      return const Color(0xFF8BC34A); // Low impact - Light green (okay)
    } else if (sugarPer100g <= _sugarHighThreshold) {
      return const Color(0xFFFF9800); // A bit too sweet - Orange (caution)
    } else if (sugarPer100g <= _sugarVeryHighThreshold) {
      return const Color(0xFFF44336); // Too sweet - Red (bad)
    } else {
      return const Color(0xFFB71C1C); // Dangerously sweet - Dark red (very bad)
    }
  }

  // ========== CALORIES LEVELS ==========
  // Energy thresholds in kJ per 100g (based on Yuka's assessment)
  // Typical ranges: Low < 700 kJ, Moderate < 1400 kJ, High < 2000 kJ, Very High < 2800 kJ
  static const double _energyLowThreshold = 700.0;
  static const double _energyModerateThreshold = 1400.0;
  static const double _energyHighThreshold = 2000.0;
  static const double _energyVeryHighThreshold = 2800.0;

  /// Get calories/energy level color based on kJ per 100g
  static Color getCaloriesLevelColor(double energyKjPer100g) {
    if (energyKjPer100g <= _energyLowThreshold) {
      return const Color(0xFF2E7D32); // Low calories - Dark green (good)
    } else if (energyKjPer100g <= _energyModerateThreshold) {
      return const Color(0xFF8BC34A); // Low impact - Light green (okay)
    } else if (energyKjPer100g <= _energyHighThreshold) {
      return const Color(0xFFFF9800); // Moderate calories - Orange (caution)
    } else if (energyKjPer100g <= _energyVeryHighThreshold) {
      return const Color(0xFFF44336); // High calories - Red (bad)
    } else {
      return const Color(0xFFB71C1C); // Very high calories - Dark red (very bad)
    }
  }

  // ========== SATURATED FAT LEVELS ==========
  // Per 100g thresholds (based on WHO recommendations: < 10g per 100g is ideal)
  static const double _saturatedFatLowThreshold = 3.0;
  static const double _saturatedFatModerateThreshold = 7.0;
  static const double _saturatedFatHighThreshold = 12.0;
  static const double _saturatedFatVeryHighThreshold = 20.0;

  /// Get saturated fat level color based on amount per 100g
  static Color getSaturatedFatLevelColor(double saturatedFatPer100g) {
    if (saturatedFatPer100g <= _saturatedFatLowThreshold) {
      return const Color(0xFF2E7D32); // Low saturated fat - Dark green (good)
    } else if (saturatedFatPer100g <= _saturatedFatModerateThreshold) {
      return const Color(0xFF8BC34A); // Low impact - Light green (okay)
    } else if (saturatedFatPer100g <= _saturatedFatHighThreshold) {
      return const Color(0xFFFF9800); // Moderate saturated fat - Orange (caution)
    } else if (saturatedFatPer100g <= _saturatedFatVeryHighThreshold) {
      return const Color(0xFFF44336); // High saturated fat - Red (bad)
    } else {
      return const Color(0xFFB71C1C); // Very high saturated fat - Dark red (very bad)
    }
  }
}

