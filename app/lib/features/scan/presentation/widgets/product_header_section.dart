import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:cleanfood/features/scan/data/product_model.dart';
import 'package:cleanfood/core/utils/health_score_utils.dart';
import 'package:cleanfood/core/utils/nutrition_level_utils.dart';
import 'package:cleanfood/core/utils/sugar_level_utils.dart';
import 'package:cleanfood/core/services/additive_risk_service.dart';

class ProductHeaderSection extends StatelessWidget {
  final Product product;
  final SugarInfo sugarInfo;

  const ProductHeaderSection({
    super.key,
    required this.product,
    required this.sugarInfo,
  });

  @override
  Widget build(BuildContext context) {
    final healthScore = HealthScoreUtils.calculateHealthScore(product);
    final scoreColor = HealthScoreUtils.getHealthScoreColor(healthScore);
    final scoreRating = HealthScoreUtils.getHealthScoreRating(healthScore);
    final scoreBgColor = HealthScoreUtils.getHealthScoreBackgroundColor(healthScore);
    
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image and Name Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image (larger, vertical)
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: product.imageUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          product.imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return HugeIcon(
                              icon: HugeIcons.strokeRoundedPackage01,
                              size: 40,
                              color: CupertinoColors.systemGrey,
                            );
                          },
                        ),
                      )
                    : HugeIcon(
                        icon: HugeIcons.strokeRoundedPackage01,
                        size: 40,
                        color: CupertinoColors.systemGrey,
                      ),
              ),
              const SizedBox(width: 16),
              
              // Product Name (expanded to right)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Brand Name (if available)
                    if (product.brands != null && product.brands!.isNotEmpty)
                      Text(
                        product.brands!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: CupertinoColors.systemGrey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (product.brands != null && product.brands!.isNotEmpty)
                      const SizedBox(height: 6),
                    
                    // Product Name (large, bold)
                    Text(
                      product.productName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    
                    // Health Score Pill with Rating
                    Row(
                      children: [
                        // Health score pill (rounded rectangle)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: scoreBgColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            '$healthScore/100',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: scoreColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        
                        // Rating text
                        Text(
                          scoreRating,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: scoreColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Summary Icons Row (Scrollable)
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _buildSummaryIcons(product, healthScore),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSummaryIcons(Product product, int healthScore) {
    final icons = <Widget>[];
    
    // Additives
    final hasAdditives = product.additivesTags?.isNotEmpty ?? false;
    final additivesColor = _getAdditivesColor(product);
    icons.add(
      Padding(
        padding: const EdgeInsets.only(right: 0),
        child: _buildSummaryIconWithValue(
          HugeIcons.strokeRoundedDroplet,
          'Additives',
          hasAdditives ? '${product.additivesTags?.length ?? 0}' : 'No additives',
          additivesColor,
        ),
      ),
    );
    
    // Seed oil
    final hasSeedOil = _hasSeedOil(product);
    icons.add(
      Padding(
        padding: const EdgeInsets.only(right: 0),
        child: _buildSummaryIconWithValue(
          HugeIcons.strokeRoundedDroplet,
          'Seed oil',
          hasSeedOil ? 'Yes' : 'No',
          hasSeedOil ? CupertinoColors.systemRed : CupertinoColors.systemGreen,
        ),
      ),
    );
    
    // Palm oil
    final hasPalmOil = _hasPalmOil(product);
    icons.add(
      Padding(
        padding: const EdgeInsets.only(right: 0),
        child: _buildSummaryIconWithValue(
          HugeIcons.strokeRoundedLeaf01,
          'Palm oil',
          hasPalmOil ? 'Yes' : 'No',
          hasPalmOil ? CupertinoColors.systemRed : CupertinoColors.systemGreen,
        ),
      ),
    );
    
    // Ingredients count (from ingredients_text)
    final ingredientsCount = _getIngredientsCount(product);
    icons.add(
      Padding(
        padding: const EdgeInsets.only(right: 0),
        child: _buildSummaryIconWithValue(
          HugeIcons.strokeRoundedClipboard,
          'Ingredients',
          ingredientsCount.toString(),
          CupertinoColors.systemGrey,
        ),
      ),
    );
    
    // Add Nutri-Score 2023 components
    final nutriscoreIcons = _buildNutriscoreIcons(product, healthScore);
    icons.addAll(nutriscoreIcons);
    
    return icons;
  }

  List<Widget> _buildNutriscoreIcons(Product product, int healthScore) {
    final icons = <Widget>[];
    final nutriscoreData = product.nutriscoreData;
    
    if (nutriscoreData == null) return icons;
    
    // Get 2023 data
    final nutriscore2023 = nutriscoreData['2023'] as Map<String, dynamic>?;
    if (nutriscore2023 == null) return icons;
    
    final data = nutriscore2023['data'] as Map<String, dynamic>?;
    if (data == null) return icons;
    
    final components = data['components'] as Map<String, dynamic>?;
    if (components == null) return icons;
    
    // Only show these fixed components: sugar, calories (energy), salt
    const allowedComponents = {'sugars', 'energy', 'salt'};
    
    // Determine if score is good or bad
    // A or B = good (show positive), C/D/E = bad (show negative)
    final grade = product.nutriscoreGrade?.toUpperCase() ?? '';
    final isGoodScore = grade == 'A' || grade == 'B';
    
    // Show negative components if bad score, positive if good
    if (!isGoodScore) {
      // Show negative components (only allowed ones)
      final negative = components['negative'] as List<dynamic>?;
      if (negative != null) {
        for (final component in negative) {
          final compData = component as Map<String, dynamic>;
          final id = compData['id'] as String?;
          final value = compData['value'];
          final points = compData['points'] as int? ?? 0;
          
          // Only show if it's one of the allowed components
          if (points > 0 && id != null && value != null && allowedComponents.contains(id)) {
            icons.add(
              Padding(
                padding: const EdgeInsets.only(right: 0),
                child: _buildNutriscoreComponentIcon(id, value, points, false),
              ),
            );
          }
        }
      }
    } else {
      // Show positive components (only allowed ones)
      final positive = components['positive'] as List<dynamic>?;
      if (positive != null) {
        for (final component in positive) {
          final compData = component as Map<String, dynamic>;
          final id = compData['id'] as String?;
          final value = compData['value'];
          final points = compData['points'] as int? ?? 0;
          
          // Only show if it's one of the allowed components
          if (points > 0 && id != null && value != null && allowedComponents.contains(id)) {
            icons.add(
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: _buildNutriscoreComponentIcon(id, value, points, true),
              ),
            );
          }
        }
      }
    }
    
    return icons;
  }

  Widget _buildNutriscoreComponentIcon(String id, dynamic value, int points, bool isPositive) {
    dynamic icon;
    Color color;
    String name;
    String displayValue;
    
    // Format value
    double? numericValue;
    if (value is double) {
      numericValue = value;
    } else if (value is int) {
      numericValue = value.toDouble();
    }
    
    // Map component ID to name, icon, and color
    switch (id) {
      case 'energy':
        name = 'Calories';
        icon = HugeIcons.strokeRoundedBatteriesEnergy;
        // Use nutrition level utils for color (energy is in kJ)
        if (numericValue != null && numericValue > 0) {
          color = NutritionLevelUtils.getCaloriesLevelColor(numericValue);
        } else {
          color = isPositive ? CupertinoColors.systemGreen : CupertinoColors.systemRed;
        }
        if (numericValue != null && numericValue == 0) {
          displayValue = '0 Cal';
        } else {
          displayValue = numericValue != null ? '${numericValue.toStringAsFixed(0)} Cal' : 'N/A';
        }
        break;
      case 'sugars':
        name = 'Sugar';
        icon = HugeIcons.strokeRoundedCube;
        // Use sugar level utils for color (sugar is in g per 100g)
        // Default to 'g' unit for per 100g values
        if (numericValue != null && numericValue > 0) {
          color = SugarLevelUtils.getSugarLevelColor(numericValue, 'g');
        } else {
          color = const Color(0xFF2E7D32); // No sugar = dark green (good)
        }
        if (numericValue != null && numericValue == 0) {
          displayValue = 'No sugar';
        } else {
          displayValue = numericValue != null ? '${numericValue.toStringAsFixed(1)}g' : 'N/A';
        }
        break;
      case 'saturated_fat':
        name = 'Saturated fat';
        icon = HugeIcons.strokeRoundedDroplet;
        // Use nutrition level utils for color (saturated fat is in g per 100g)
        if (numericValue != null && numericValue > 0) {
          color = NutritionLevelUtils.getSaturatedFatLevelColor(numericValue);
        } else {
          color = CupertinoColors.systemGreen; // No saturated fat = green
        }
        if (numericValue != null && numericValue == 0) {
          displayValue = 'No saturated fat';
        } else {
          displayValue = numericValue != null ? '${numericValue.toStringAsFixed(1)}g' : 'N/A';
        }
        break;
      case 'salt':
        name = 'Salt';
        icon = HugeIcons.strokeRoundedDroplet;
        color = isPositive ? CupertinoColors.systemGreen : CupertinoColors.systemRed;
        if (numericValue != null && numericValue == 0) {
          displayValue = 'No salt';
        } else {
          displayValue = numericValue != null ? '${numericValue.toStringAsFixed(1)}g' : 'N/A';
        }
        break;
      case 'fiber':
        name = 'Fiber';
        icon = HugeIcons.strokeRoundedLeaf01;
        color = CupertinoColors.systemGreen;
        displayValue = numericValue != null ? '${numericValue.toStringAsFixed(1)}g' : 'N/A';
        break;
      case 'fruits_vegetables_legumes':
        name = 'Fruits/Veg';
        icon = HugeIcons.strokeRoundedApple01;
        color = CupertinoColors.systemGreen;
        displayValue = numericValue != null ? '${numericValue.toStringAsFixed(0)}%' : 'N/A';
        break;
      default:
        name = id;
        icon = HugeIcons.strokeRoundedCircle;
        color = isPositive ? CupertinoColors.systemGreen : CupertinoColors.systemRed;
        displayValue = numericValue != null ? '${numericValue.toStringAsFixed(1)}g' : 'N/A';
    }
    
    return _buildSummaryIconWithValue(icon, name, displayValue, color);
  }

  Widget _buildSummaryIconWithValue(dynamic icon, String name, String value, Color color) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          // Icon (half size: 24x24)
          Container(
            width: 32,
            height: 32,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: icon is IconData
                ? Icon(
                    icon,
                    color: color,
                    size: 12,
                  )
                : HugeIcon(
                    icon: icon as dynamic,
                    color: color,
                    size: 12,
                  ),
          ),
          const SizedBox(height: 4),
          // Name
          Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: CupertinoColors.black,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          // Value
          Text(
            value,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: CupertinoColors.systemGrey,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }


  bool _hasSeedOil(Product product) {
    final ingredients = product.ingredientsTags ?? [];
    return ingredients.any((tag) =>
        tag.toLowerCase().contains('sunflower') ||
        tag.toLowerCase().contains('canola') ||
        tag.toLowerCase().contains('soybean') ||
        tag.toLowerCase().contains('corn-oil') ||
        tag.toLowerCase().contains('cottonseed') ||
        tag.toLowerCase().contains('safflower') ||
        tag.toLowerCase().contains('rapeseed'));
  }

  bool _hasPalmOil(Product product) {
    final ingredients = product.ingredientsList ?? [];
    return ingredients.any((ingredient) =>
        ingredient.fromPalmOil == 'yes' ||
        ingredient.text.toLowerCase().contains('palm'));
  }

  /// Get the highest risk level color for additives
  /// Returns: red (high), orange (moderate), yellow (limited), green (risk-free/no additives)
  Color _getAdditivesColor(Product product) {
    final additives = product.additivesTags;
    
    if (additives == null || additives.isEmpty) {
      return CupertinoColors.systemGreen; // No additives = green
    }
    
    // Get the highest risk level from all additives
    String highestRisk = 'risk-free';
    
    for (final additive in additives) {
      final risk = AdditiveRiskService.getRiskLevel(additive);
      
      // Determine if this risk is higher than current highest
      if (risk == 'high') {
        highestRisk = 'high';
        break; // High is the highest, so we can stop
      } else if (risk == 'moderate' && highestRisk != 'high') {
        highestRisk = 'moderate';
      } else if (risk == 'limited' && highestRisk == 'risk-free') {
        highestRisk = 'limited';
      }
    }
    
    // Map risk level to color
    switch (highestRisk) {
      case 'high':
        return CupertinoColors.systemRed;
      case 'moderate':
        return CupertinoColors.systemOrange;
      case 'limited':
        return const Color(0xFFFFC107); // Yellow/amber color
      case 'risk-free':
      default:
        return CupertinoColors.systemGreen;
    }
  }

  /// Get ingredients count from ingredients_text field
  /// Counts the number of ingredients by splitting on commas
  int _getIngredientsCount(Product product) {
    // First priority: Use ingredients_text_en or ingredients_text
    String? ingredientsText;
    if (product.ingredientsTextEn != null && product.ingredientsTextEn!.isNotEmpty) {
      ingredientsText = product.ingredientsTextEn!;
    } else if (product.ingredientsText != null && product.ingredientsText!.isNotEmpty) {
      ingredientsText = product.ingredientsText!;
    }
    
    if (ingredientsText != null && ingredientsText.isNotEmpty) {
      // Split by comma and filter out empty strings
      final ingredients = ingredientsText
          .split(',')
          .map((ing) => ing.trim())
          .where((ing) => ing.isNotEmpty)
          .toList();
      return ingredients.length;
    }
    
    // Fallback: Use ingredientsList count if ingredients_text is not available
    return product.ingredientsList?.length ?? 0;
  }
}

