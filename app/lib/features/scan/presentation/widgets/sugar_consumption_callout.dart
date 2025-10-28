import 'package:flutter/material.dart';
import 'package:sweetr/core/utils/sugar_level_utils.dart';

class SugarConsumptionCallout extends StatelessWidget {
  final double totalSugarsInProduct;
  final double productQuantity;
  final String productUnit;

  const SugarConsumptionCallout({
    super.key,
    required this.totalSugarsInProduct,
    required this.productQuantity,
    required this.productUnit,
  });

  @override
  Widget build(BuildContext context) {
    final advice = _generateConsumptionAdvice();
    final color = _getCalloutColor();
    final icon = _getCalloutIcon();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with icon and title
          Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: color,
              ),
              const SizedBox(width: 8),
              Text(
                _getCalloutTitle(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Total sugar amount
          Text(
            '${totalSugarsInProduct.toStringAsFixed(1)}g total sugar',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          
          // Consumption advice
          Text(
            advice,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  String _generateConsumptionAdvice() {
    const dailyLimit = 25.0; // WHO recommendation
    final daysWorth = totalSugarsInProduct / dailyLimit;
    
    if (daysWorth > 2.0) {
      final portions = (daysWorth / 0.75).ceil();
      return "This product contains ${daysWorth.toStringAsFixed(1)} days worth of sugar! Consider splitting it into $portions portions or sharing with others.";
    } else if (daysWorth > 1.0) {
      return "This exceeds your daily sugar limit. Consider splitting into 2 portions to stay within healthy limits.";
    } else if (daysWorth > 0.5) {
      final percentage = (daysWorth * 100).round();
      return "This is about $percentage% of your daily sugar limit. Enjoy in moderation or consider splitting into 2 servings.";
    } else {
      return "Well within healthy limits! You can enjoy this as part of a balanced diet.";
    }
  }

  Color _getCalloutColor() {
    // Use the daily sugar color method for consistency
    return SugarLevelUtils.getDailySugarColor(totalSugarsInProduct);
  }

  IconData _getCalloutIcon() {
    const dailyLimit = 25.0;
    final daysWorth = totalSugarsInProduct / dailyLimit;
    
    if (daysWorth > 1.0) return Icons.warning;
    if (daysWorth > 0.5) return Icons.info;
    return Icons.check_circle;
  }

  String _getCalloutTitle() {
    const dailyLimit = 25.0;
    final daysWorth = totalSugarsInProduct / dailyLimit;
    
    if (daysWorth > 1.0) return "Sugar Alert";
    if (daysWorth > 0.5) return "Consumption Tip";
    return "Good Choice";
  }
}

