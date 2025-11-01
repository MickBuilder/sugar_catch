/// Stub class for backward compatibility during pivot to healthy food scanner
/// TODO: Replace with general ingredient analysis
class SugarAliases {
  // Stub method - returns false for all ingredients during pivot
  // This disables sugar-specific detection
  static bool isHiddenSugar(String ingredientTag) {
    return false;
  }
}

