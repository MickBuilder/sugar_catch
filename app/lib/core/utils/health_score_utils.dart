import 'package:flutter/cupertino.dart';
import 'package:cleanfood/features/scan/data/product_model.dart';
import 'package:cleanfood/core/utils/nutriscore_mapper.dart';
import 'package:cleanfood/core/services/additive_risk_service.dart';

/// Health score calculator using Yuka's methodology
/// Reference: https://help.yuka.io/l/en/article/ijzgfvi1jq-how-are-food-products-scored
/// 
/// Scoring formula:
/// - Nutritional quality (Nutri-Score): 60% of final score
/// - Presence of additives: 30% of final score
/// - Organic dimension: 10% of final score
/// - Maximum score capped at 49/100 if high-risk additive is present
class HealthScoreUtils {
  /// Calculate health score (0-100) for a product using Yuka's scoring system
  static int calculateHealthScore(Product product) {
    // Check for high-risk additives first - if present, cap at 49
    final hasHighRisk = AdditiveRiskService.hasHighRiskAdditive(product.additivesTags);
    if (hasHighRisk) {
      return 49;
    }

    // 1. Nutritional Quality (60% of score)
    // Use Nutri-Score grade or numerical score
    int nutritionalScore;
    if (product.nutriscoreGrade != null) {
      nutritionalScore = NutriScoreMapper.gradeToScore(product.nutriscoreGrade);
    } else if (product.nutriscoreScore != null) {
      nutritionalScore = NutriScoreMapper.scoreToHealthScore(product.nutriscoreScore);
    } else {
      // If no Nutri-Score available, use default
      nutritionalScore = 50;
    }
    
    final nutritionalComponent = (nutritionalScore * 0.6).round();

    // 2. Additives (30% of score)
    final additiveScore = AdditiveRiskService.calculateAdditiveScore(product.additivesTags);
    final additiveComponent = (additiveScore * 0.3).round();

    // 3. Organic dimension (10% of score)
    final isOrganic = _isOrganicProduct(product);
    final organicComponent = isOrganic ? 10 : 0;

    // Final score
    final finalScore = nutritionalComponent + additiveComponent + organicComponent;
    
    return finalScore.clamp(0, 100);
  }

  /// Check if product is organic based on labels
  static bool _isOrganicProduct(Product product) {
    final labelsTags = product.labelsTags ?? [];
    final labels = product.labels?.toLowerCase() ?? '';
    
    // Check for common organic labels
    final organicKeywords = [
      'organic',
      'bio',
      'ecocert',
      'usda organic',
      'eu organic',
      'ab', // French organic label
      'krav', // Swedish organic label
    ];
    
    // Check labels tags
    for (final tag in labelsTags) {
      final lowerTag = tag.toLowerCase();
      if (organicKeywords.any((keyword) => lowerTag.contains(keyword))) {
        return true;
      }
    }
    
    // Check labels string
    for (final keyword in organicKeywords) {
      if (labels.contains(keyword)) {
        return true;
      }
    }
    
    return false;
  }

  /// Get health score color based on score
  static Color getHealthScoreColor(int score) {
    if (score >= 75) {
      // Excellent - Dark green
      return const Color(0xFF2E7D32); // Dark green
    } else if (score >= 50) {
      // Good - Green
      return const Color(0xFF8BC34A); // Light green
    } else if (score >= 25) {
      // Poor - Orange
      return const Color(0xFFFF9800); // Orange
    } else {
      // Bad - Red
      return const Color(0xFFF44336); // Red
    }
  }

  /// Get health score rating text
  static String getHealthScoreRating(int score) {
    if (score >= 75) {
      return 'Excellent';
    } else if (score >= 50) {
      return 'Good';
    } else if (score >= 25) {
      return 'Poor';
    } else {
      return 'Bad';
    }
  }

  /// Get health score background color for pill
  static Color getHealthScoreBackgroundColor(int score) {
    if (score >= 75) {
      // Excellent - Light dark green background
      return const Color(0xFF2E7D32).withValues(alpha: 0.15);
    } else if (score >= 50) {
      // Good - Light green background
      return const Color(0xFF8BC34A).withValues(alpha: 0.15);
    } else if (score >= 25) {
      // Poor - Light orange background
      return const Color(0xFFFF9800).withValues(alpha: 0.15);
    } else {
      // Bad - Light red background
      return const Color(0xFFF44336).withValues(alpha: 0.15);
    }
  }
}

