import 'package:flutter/material.dart';
import 'package:sweetr/features/scan/data/product_model.dart';

class SummaryMetricsRow extends StatelessWidget {
  final Product product;
  final int hiddenSugarsCount;

  const SummaryMetricsRow({
    super.key,
    required this.product,
    required this.hiddenSugarsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMetricRow(
          icon: Icons.local_drink, // Honey/sugar icon
          label: 'Hidden sugars',
          value: hiddenSugarsCount.toString(),
          color: hiddenSugarsCount > 0 ? Colors.red : Colors.green,
        ),
        const SizedBox(height: 12),
        _buildMetricRow(
          icon: Icons.cake, // Sweetener icon
          label: 'Sweeteners',
          value: (product.ingredientsSweetenersN ?? 0).toString(),
          color: (product.ingredientsSweetenersN ?? 0) > 0
              ? Colors.orange
              : Colors.green,
        ),
        const SizedBox(height: 12),
        _buildMetricRow(
          icon: Icons.warning,
          label: 'Additives',
          value: (product.additivesTags?.length ?? 0).toString(),
          color: (product.additivesTags?.length ?? 0) > 0
              ? Colors.red
              : Colors.green,
        ),
        const SizedBox(height: 12),
        _buildMetricRow(
          icon: Icons.warning_amber,
          label: 'Allergens',
          value: (product.allergensTags?.length ?? 0).toString(),
          color: (product.allergensTags?.length ?? 0) > 0
              ? Colors.orange
              : Colors.green,
        ),
      ],
    );
  }

  Widget _buildMetricRow({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ],
        ),
      ],
    );
  }
}
