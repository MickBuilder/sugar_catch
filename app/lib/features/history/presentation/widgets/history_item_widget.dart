import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:cleanfood/core/services/history_service.dart';
import 'package:cleanfood/core/utils/health_score_utils.dart';

class HistoryItemWidget extends ConsumerWidget {
  final HistoryItem item;

  const HistoryItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = item.product;
    final healthScore = HealthScoreUtils.calculateHealthScore(product);
    final scoreColor = HealthScoreUtils.getHealthScoreColor(healthScore);
    final scoreRating = HealthScoreUtils.getHealthScoreRating(healthScore);
    final scoreBgColor = HealthScoreUtils.getHealthScoreBackgroundColor(healthScore);

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => _navigateToProduct(context, ref),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Square product image on the left
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(8),
              ),
              child: product.imageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return HugeIcon(
                            icon: HugeIcons.strokeRoundedPackage01,
                            color: CupertinoColors.systemGrey,
                            size: 32,
                          );
                        },
                      ),
                    )
                  : HugeIcon(
                      icon: HugeIcons.strokeRoundedPackage01,
                      color: CupertinoColors.systemGrey,
                      size: 32,
                    ),
            ),
            const SizedBox(width: 16),

            // Product name and health score on the right
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product name
                  Text(
                    product.productName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // Health score pill and rating
                  Row(
                    children: [
                      // Health score pill (rounded rectangle)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: scoreBgColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          '$healthScore/100',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: scoreColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      
                      // Rating text
                      Text(
                        scoreRating,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: scoreColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(width: 12),
            
            // Timestamp on the right
            Text(
              _formatTimeAgo(item.lastScannedAt),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToProduct(BuildContext context, WidgetRef ref) {
    // Navigate to product screen with barcode in URL
    context.push('/product/${item.product.code}');
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    // Show minutes even for very recent scans (matches image: "0m ago")
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      final weeks = (difference.inDays / 7).floor();
      return '${weeks}w ago';
    }
  }
}
