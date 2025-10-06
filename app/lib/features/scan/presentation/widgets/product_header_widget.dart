import 'package:flutter/material.dart';
import 'package:sweetr/core/utils/sugar_level_utils.dart';
import 'package:sweetr/features/scan/data/product_model.dart';
import 'package:sweetr/features/scan/presentation/widgets/sugar_level_bar_widget.dart';
import 'package:sweetr/features/scan/presentation/widgets/summary_metrics_row.dart';

class ProductHeaderWidget extends StatelessWidget {
  final Product product;
  final SugarInfo sugarInfo;

  const ProductHeaderWidget({
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
        children: [
          // Product Info Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side - Product info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product name
                    Text(
                      product.productName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Brand
                    if (product.brands != null) ...[
                      Text(
                        product.brands!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                    // Category tag
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _getCategoryTag(product),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Right side - Sugar Level Bar (Circular)
              SugarLevelBarWidget(
                sugarPer100g: sugarInfo.sugarsPer100g,
                productUnit: sugarInfo.productUnit,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Total Sugar Display
          _buildTotalSugarDisplay(),

          const SizedBox(height: 20),

          // Summary Metrics - EXACT Oasis Layout
          SummaryMetricsRow(
            product: product,
            hiddenSugarsCount: sugarInfo.hiddenSugarIngredients.length,
          ),
        ],
      ),
    );
  }

  // Helper method to get category tag
  String _getCategoryTag(Product product) {
    if (product.categoriesTags != null && product.categoriesTags!.isNotEmpty) {
      // Get the most specific category (last one in the list)
      final category = product.categoriesTags!.last;
      // Remove the 'en:' prefix if present
      return category.replaceAll('en:', '').replaceAll('fr:', '');
    }
    if (product.categories != null && product.categories!.isNotEmpty) {
      // Split by comma and take the first category
      final categories = product.categories!.split(',');
      return categories.first.trim();
    }
    return 'Food Product';
  }

  // Build total sugar display
  Widget _buildTotalSugarDisplay() {
    final totalSugar = sugarInfo.totalSugarsInProduct;
    final color = SugarLevelUtils.getDailySugarColor(totalSugar);
    final exceedsDailyLimit = totalSugar > 25.0; // WHO daily limit
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Main sugar info row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'In total',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              Text(
                '${totalSugar.toStringAsFixed(1)}g',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          
          // Warning message if exceeds daily limit
          if (exceedsDailyLimit) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  size: 14,
                  color: color,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Warning: This product exceeds the daily sugar limit. Consider consuming it over multiple days.',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
