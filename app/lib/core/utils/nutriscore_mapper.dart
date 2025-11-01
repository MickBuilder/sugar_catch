/// Maps Nutri-Score grades to numerical scores (0-100)
/// Based on Yuka's refined correspondence table for nutritional quality
/// Reference: https://help.yuka.io/l/en/article/owuc9rbhqs
/// 
/// Yuka refines the Nutri-Score calculation to:
/// - Avoid threshold effects that could lead to significant rating differences between similar products
/// - Prevent products with Nutri-Score D or E from having a score higher than 49/100
class NutriScoreMapper {
  /// Convert Nutri-Score grade to numerical score (0-100)
  /// The Nutri-Score calculation is based on:
  /// - Sugar, sodium, saturated fat, calories (negative points)
  /// - Protein, fiber, fruits/vegetables content (positive points)
  /// 
  /// Yuka uses this to calculate 60% of the final score.
  /// The mapping is refined to avoid threshold effects and ensure D/E products don't exceed 49/100.
  static int gradeToScore(String? nutriscoreGrade) {
    if (nutriscoreGrade == null) {
      // If no Nutri-Score available, use middle score
      return 50;
    }
    
    switch (nutriscoreGrade.toUpperCase()) {
      case 'A':
        // Excellent nutritional quality - wide range to avoid threshold effects
        // A products can score from 75 to 100
        return 85;
      case 'B':
        // Good nutritional quality
        // B products typically score from 60 to 74
        return 67;
      case 'C':
        // Fair nutritional quality
        // C products typically score from 45 to 59
        return 52;
      case 'D':
        // Poor nutritional quality
        // D products are capped to ensure they don't exceed 49/100 when combined with additives/organic
        // Even with perfect additives (30 points) and organic (10 points), max would be:
        // 15 * 0.6 + 30 + 10 = 9 + 30 + 10 = 49 (exactly the cap)
        return 15;
      case 'E':
        // Very poor nutritional quality
        // E products are capped to ensure they don't exceed 49/100 when combined with additives/organic
        // Even with perfect additives (30 points) and organic (10 points), max would be:
        // 10 * 0.6 + 30 + 10 = 6 + 30 + 10 = 46 (below the cap)
        return 10;
      default:
        // Unknown grade - default to middle score
        return 50;
    }
  }

  /// Alternative: Use Nutri-Score numerical value if available
  /// Nutri-Score ranges from -15 (best) to 40 (worst)
  /// We need to convert this to a 0-100 scale where higher is better
  static int scoreToHealthScore(int? nutriscoreScore) {
    if (nutriscoreScore == null) {
      return 50; // Default middle score
    }
    
    // Nutri-Score: -15 (best) to 40 (worst)
    // Convert to 0-100 scale where higher is better
    // Formula: 100 - ((score - (-15)) / (40 - (-15)) * 100)
    // Simplified: 100 - ((score + 15) / 55 * 100)
    final normalized = 100 - ((nutriscoreScore + 15) / 55 * 100);
    return normalized.round().clamp(0, 100);
  }
}

