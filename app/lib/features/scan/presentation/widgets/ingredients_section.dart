import 'package:flutter/cupertino.dart';
import 'package:cleanfood/features/scan/data/product_model.dart';

class IngredientsSection extends StatelessWidget {
  final Product product;

  const IngredientsSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ingredients',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.label,
            ),
          ),
          const SizedBox(height: 12),
          
          _buildIngredientsList(),
        ],
      ),
    );
  }

  Widget _buildIngredientsList() {
    // Always use ingredientsText, never ingredientsTextEn
    final ingredientsText = product.ingredientsText;
    
    if (ingredientsText == null || ingredientsText.isEmpty) {
      return const Text(
        'No ingredient information available',
        style: TextStyle(
          fontSize: 14,
          color: CupertinoColors.systemGrey,
        ),
      );
    }
    
    // Display the exact text content without any formatting
    return Text(
      ingredientsText,
      style: const TextStyle(
        fontSize: 15,
        height: 1.5,
        color: CupertinoColors.label,
      ),
    );
  }
}

