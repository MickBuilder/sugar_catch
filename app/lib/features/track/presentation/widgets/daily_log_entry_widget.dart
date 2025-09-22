import 'package:flutter/cupertino.dart';
import 'package:sugar_catch/features/track/data/track_models.dart';

class DailyLogEntryWidget extends StatelessWidget {
  final LogEntry entry;
  final VoidCallback? onRemove;

  const DailyLogEntryWidget({
    super.key,
    required this.entry,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final formattedServingSize = ServingSizeCalculator.formatServingSize(entry.servingSize);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: CupertinoColors.separator,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          // Product info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.product.productName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CupertinoColors.label,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  formattedServingSize,
                  style: const TextStyle(
                    fontSize: 14,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ],
            ),
          ),
          
          // Sugar amount
          Text(
            '${entry.totalSugarAmount.toStringAsFixed(1)}g',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: CupertinoColors.label,
            ),
          ),
          
          // Remove button (if provided)
          if (onRemove != null) ...[
            const SizedBox(width: 12),
            CupertinoButton(
              onPressed: onRemove,
              padding: EdgeInsets.zero,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemRed.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  CupertinoIcons.xmark,
                  size: 12,
                  color: CupertinoColors.systemRed,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
