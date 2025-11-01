/// Service for determining additive risk levels based on Yuka's methodology
/// Uses EFSA, IARC, and independent scientific studies
class AdditiveRiskService {
  /// Additive risk levels based on scientific research
  /// High-risk additives (red) - maximum score capped at 49 if present
  static const Set<String> _highRiskAdditives = {
    // Nitrites and nitrates (carcinogenic risk)
    'en:e249', 'en:e250', 'en:e251', 'en:e252', // Nitrites and nitrates
    // Artificial colors (behavioral issues, allergies)
    'en:e102', 'en:e104', 'en:e110', 'en:e122', 'en:e124', 'en:e129', // Tartrazine, Quinoline, Sunset Yellow, etc.
    // Artificial sweeteners with concerns
    'en:e951', 'en:e952', // Aspartame, Cyclamate
    // Sulfites (allergies)
    'en:e220', 'en:e221', 'en:e222', 'en:e223', 'en:e224', 'en:e225', 'en:e226', 'en:e227', 'en:e228',
    // Sodium benzoate (hyperactivity)
    'en:e211',
    // Butylated hydroxyanisole (BHA)
    'en:e320',
    // Butylated hydroxytoluene (BHT)
    'en:e321',
  };

  /// Moderate risk additives (orange)
  static const Set<String> _moderateRiskAdditives = {
    // Phosphates
    'en:e338', 'en:e339', 'en:e340', 'en:e341', 'en:e342', 'en:e343', 'en:e450', 'en:e451', 'en:e452',
    // Citric acid and derivatives (enamel erosion)
    'en:e330', 'en:e331', 'en:e332', 'en:e333',
    // Carrageenan
    'en:e407',
    // Modified starches
    'en:e1404', 'en:e1410', 'en:e1412', 'en:e1413', 'en:e1414', 'en:e1420', 'en:e1422', 'en:e1440', 'en:e1442', 'en:e1450',
  };

  /// Limited risk additives (yellow)
  static const Set<String> _limitedRiskAdditives = {
    // Natural preservatives
    'en:e200', 'en:e201', 'en:e202', 'en:e203', // Sorbates
    'en:e210', 'en:e212', 'en:e213', // Benzoates (excluding e211)
    // Natural antioxidants
    'en:e300', 'en:e301', 'en:e302', // Ascorbic acid
    'en:e306', 'en:e307', 'en:e308', 'en:e309', // Tocopherols
    // Gelling agents
    'en:e406', 'en:e415',
    // Emulsifiers (generally safe)
    'en:e322', 'en:e471',
  };

  /// Risk-free additives (green) - generally recognized as safe
  /// All additives not in the above categories are considered risk-free or unknown
  
  /// Get risk level for an additive tag
  /// Returns: 'high', 'moderate', 'limited', or 'risk-free'
  static String getRiskLevel(String additiveTag) {
    final normalizedTag = additiveTag.toLowerCase();
    
    if (_highRiskAdditives.contains(normalizedTag)) {
      return 'high';
    } else if (_moderateRiskAdditives.contains(normalizedTag)) {
      return 'moderate';
    } else if (_limitedRiskAdditives.contains(normalizedTag)) {
      return 'limited';
    }
    
    return 'risk-free';
  }

  /// Check if product contains any high-risk additives
  static bool hasHighRiskAdditive(List<String>? additivesTags) {
    if (additivesTags == null || additivesTags.isEmpty) {
      return false;
    }
    
    return additivesTags.any((tag) => getRiskLevel(tag) == 'high');
  }

  /// Calculate additive score component (0-100)
  /// Returns the score contribution from additives (30% weight in final score)
  /// Lower score = more/bad additives
  static double calculateAdditiveScore(List<String>? additivesTags) {
    if (additivesTags == null || additivesTags.isEmpty) {
      return 100.0; // No additives = perfect score for this component
    }

    int score = 100;
    
    for (final additive in additivesTags) {
      final risk = getRiskLevel(additive);
      
      switch (risk) {
        case 'high':
          score -= 15; // High penalty for high-risk
          break;
        case 'moderate':
          score -= 8; // Moderate penalty
          break;
        case 'limited':
          score -= 3; // Small penalty
          break;
        case 'risk-free':
          // No penalty for risk-free additives
          break;
      }
    }
    
    return score.clamp(0, 100).toDouble();
  }

  /// Get all high-risk additives in a product
  static List<String> getHighRiskAdditives(List<String>? additivesTags) {
    if (additivesTags == null || additivesTags.isEmpty) {
      return [];
    }
    
    return additivesTags.where((tag) => getRiskLevel(tag) == 'high').toList();
  }
}

