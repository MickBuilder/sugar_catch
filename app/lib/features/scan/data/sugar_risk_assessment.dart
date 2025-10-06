import 'package:flutter/material.dart';
import 'package:sweetr/core/utils/sugar_level_utils.dart';
import 'package:sweetr/features/scan/data/product_model.dart';

class SugarRiskAssessment {
  static const double dailySugarLimit = 25.0; // WHO recommendation (25g per day)
  
  /// Calculate how many times the daily limit this ingredient represents
  static int calculateDailyLimitMultiplier(Ingredient ingredient, double totalSugarsPer100g) {
    // Estimate the sugar contribution of this ingredient
    // This is a simplified calculation - in reality, we'd need more detailed data
    final estimatedSugarContribution = _estimateIngredientSugarContribution(ingredient, totalSugarsPer100g);
    
    if (estimatedSugarContribution <= 0) return 1;
    
    final multiplier = (estimatedSugarContribution / dailySugarLimit).ceil();
    return multiplier.clamp(1, 10); // Cap at 10x for display
  }
  
  /// Estimate how much sugar this ingredient contributes per 100g
  static double _estimateIngredientSugarContribution(Ingredient ingredient, double totalSugarsPer100g) {
    // If we have percentage data, use it
    if (ingredient.percentEstimate != null) {
      // Assume this ingredient is mostly sugar if it's a known sugar
      final sugarContent = _getIngredientSugarContent(ingredient.textEn ?? ingredient.text);
      return (ingredient.percentEstimate! / 100) * totalSugarsPer100g * sugarContent;
    }
    
    // Fallback: estimate based on ingredient type
    final sugarContent = _getIngredientSugarContent(ingredient.textEn ?? ingredient.text);
    if (sugarContent > 0.8) {
      // High sugar ingredient - estimate 5-15% of total sugar
      return totalSugarsPer100g * 0.1; // 10% of total sugar
    }
    
    return 0;
  }
  
  /// Get the estimated sugar content of an ingredient (0.0 to 1.0)
  static double _getIngredientSugarContent(String ingredientName) {
    final name = ingredientName.toLowerCase();
    
    // Pure sugars
    if (name.contains('sugar') && !name.contains('substitute')) return 1.0;
    if (name.contains('syrup')) return 0.8;
    if (name.contains('honey')) return 0.8;
    if (name.contains('molasses')) return 0.7;
    if (name.contains('dextrose') || name.contains('fructose') || name.contains('glucose')) return 1.0;
    if (name.contains('sucrose') || name.contains('lactose') || name.contains('maltose')) return 1.0;
    
    // Natural sweeteners
    if (name.contains('agave')) return 0.8;
    if (name.contains('maple')) return 0.7;
    if (name.contains('coconut sugar')) return 0.9;
    if (name.contains('brown rice syrup')) return 0.8;
    
    return 0.0;
  }
  
  /// Get sugar level description
  static String getSugarLevel(double sugarPer100g, String unit) {
    return SugarLevelUtils.getSugarLevelText(sugarPer100g, unit);
  }
  
  /// Get sugar level color (returns Color object instead of string)
  static Color getSugarLevelColor(double sugarPer100g, String unit) {
    return SugarLevelUtils.getSugarLevelColor(sugarPer100g, unit);
  }
}
