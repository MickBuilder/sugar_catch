import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugar_catch/core/services/additives_service.dart';
import 'package:sugar_catch/features/scan/data/product_model.dart';
import 'package:sugar_catch/features/scan/data/sugar_risk_assessment.dart';
import 'package:sugar_catch/features/scan/presentation/widgets/sugar_ingredient_card.dart';

class WhatsInsideWidget extends StatelessWidget {
  final Product product;
  final SugarInfo sugarInfo;

  const WhatsInsideWidget({
    super.key,
    required this.product,
    required this.sugarInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Row(
            children: [
              const Text(
                "What's inside",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.info_outline,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Hidden Sugar Sub-section
          if (sugarInfo.hiddenSugarIngredients.isNotEmpty) ...[
            _buildHiddenSugarSubsection(sugarInfo.hiddenSugarIngredients),
            const SizedBox(height: 16),
          ],

          // Sweeteners Sub-section
          if (_getSweetenerTags(product).isNotEmpty) ...[
            _buildSweetenersSubsection(_getSweetenerTags(product)),
            const SizedBox(height: 16),
          ],

          // ALL ingredients cards
          if (product.ingredientsList != null &&
              product.ingredientsList!.isNotEmpty) ...[
            ...product.ingredientsList!.map((ingredient) {
              // Calculate daily limit multiplier for sugar ingredients
              final isSugarIngredient = _isSugarIngredient(ingredient);
              final multiplier = isSugarIngredient
                  ? SugarRiskAssessment.calculateDailyLimitMultiplier(
                      ingredient,
                      sugarInfo.sugarsPer100g,
                    )
                  : 1;

              return SugarIngredientCard(
                ingredient: ingredient,
                dailyLimitMultiplier: multiplier.toDouble(),
                isSugarIngredient: isSugarIngredient,
              );
            }).toList(),
          ] else ...[
            // No ingredients found
            _buildNoIngredientsPlaceholder(),
          ],
        ],
      ),
    );
  }

  // Helper method to check if an ingredient is a sugar ingredient
  bool _isSugarIngredient(Ingredient ingredient) {
    final ingredientText = (ingredient.textEn ?? ingredient.text).toLowerCase();
    final sugarKeywords = [
      'sugar',
      'sucrose',
      'fructose',
      'glucose',
      'dextrose',
      'maltose',
      'lactose',
      'honey',
      'syrup',
      'molasses',
      'agave',
      'maple',
      'coconut sugar',
      'brown sugar',
      'cane sugar',
      'beet sugar',
      'corn syrup',
      'high fructose corn syrup',
      'hfcs',
      'maltodextrin',
      'fruit juice concentrate',
      'date syrup',
      'rice syrup',
      'invert sugar',
      'caramel',
      'treacle',
      'golden syrup',
      'blackstrap molasses',
    ];

    return sugarKeywords.any((keyword) => ingredientText.contains(keyword));
  }

  // Helper method to get sweetener tags from additives_tags
  List<String> _getSweetenerTags(Product product) {
    if (product.additivesTags == null) return [];
    
    return product.additivesTags!.where((tag) {
      return AdditivesService.isSweetenerTag(tag);
    }).toList();
  }

  // Helper method to build hidden sugar sub-section
  Widget _buildHiddenSugarSubsection(List<Ingredient> hiddenSugarIngredients) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sub-section title
        Text(
          'Hidden sugar',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 12),
        // Hidden sugar tags
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: hiddenSugarIngredients.map((ingredient) {
            final ingredientName = ingredient.textEn ?? ingredient.text;
            return _buildHiddenSugarTag(ingredientName);
          }).toList(),
        ),
      ],
    );
  }

  // Helper method to build individual hidden sugar tag
  Widget _buildHiddenSugarTag(String ingredientName) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.red[50]!,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red[200]!, width: 1),
      ),
      child: Text(
        ingredientName,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.red[700]!,
        ),
      ),
    );
  }

  // Helper method to build sweeteners sub-section
  Widget _buildSweetenersSubsection(List<String> sweetenerTags) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sub-section title
        Text(
          'Sweeteners',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 12),
        // Sweetener tags with async mapping
        FutureBuilder<List<String>>(
          future: AdditivesService.getAdditiveNames(sweetenerTags),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 40,
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              );
            }
            
            final sweetenerNames = snapshot.data ?? [];
            return Wrap(
              spacing: 8,
              runSpacing: 8,
              children: sweetenerNames.map((sweetenerName) => _buildSweetenerTag(sweetenerName)).toList(),
            );
          },
        ),
      ],
    );
  }

  // Helper method to build individual sweetener tag
  Widget _buildSweetenerTag(String ingredientName) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.orange[50]!,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange[200]!, width: 1),
      ),
      child: Text(
        ingredientName,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.orange[700]!,
        ),
      ),
    );
  }

  // Helper method to build no ingredients placeholder
  Widget _buildNoIngredientsPlaceholder() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.help_outline,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'No Ingredients Listed',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Ingredient information is not available for this product.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.grey[600],
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
