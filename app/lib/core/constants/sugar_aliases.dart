class SugarAliases {
  static const List<String> aliases = [
    'fructose',
    'glucose',
    'sucrose',
    'maltose',
    'lactose',
    'dextrose',
    'corn syrup',
    'high fructose corn syrup',
    'agave nectar',
    'maple syrup',
    'honey',
    'brown rice syrup',
    'coconut sugar',
    'date syrup',
    'molasses',
    'barley malt',
    'brown sugar',
    'cane sugar',
    'raw sugar',
    'turbinado sugar',
    'demerara sugar',
    'muscovado sugar',
    'invert sugar',
    'caramel',
    'fruit juice concentrate',
  ];

  static List<String> findInIngredients(String ingredients) {
    final foundAliases = <String>[];
    final lowerIngredients = ingredients.toLowerCase();

    for (final alias in aliases) {
      if (lowerIngredients.contains(alias.toLowerCase())) {
        foundAliases.add(alias);
      }
    }

    return foundAliases;
  }

  static bool isHiddenSugar(String ingredientText) {
    final lowerText = ingredientText.toLowerCase();

    for (final alias in aliases) {
      if (lowerText.contains(alias.toLowerCase())) {
        return true;
      }
    }

    return false;
  }
}
