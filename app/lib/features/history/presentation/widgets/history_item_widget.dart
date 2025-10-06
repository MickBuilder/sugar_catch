import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweetr/core/services/history_service.dart';
import 'package:sweetr/core/utils/sugar_level_utils.dart';

class HistoryItemWidget extends ConsumerWidget {
  final HistoryItem item;

  const HistoryItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeAgo = _getTimeAgo(item.lastScannedAt);
    final product = item.product;
    final sugarInfo = item.sugarInfo;
    final productUnit = product.productQuantityUnit?.toLowerCase() ?? 'g';

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => _navigateToProduct(context, ref),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: CupertinoColors.separator, width: 0.5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image or fallback icon
            Expanded(
              flex: 2,
              child: Container(
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
                            return const Icon(
                              CupertinoIcons.square_stack_3d_down_right,
                              color: CupertinoColors.systemGrey,
                              size: 32,
                            );
                          },
                        ),
                      )
                    : const Icon(
                        CupertinoIcons.square_stack_3d_down_right,
                        color: CupertinoColors.systemGrey,
                        size: 32,
                      ),
              ),
            ),
            const SizedBox(width: 12),

            // Product info
            Expanded(
              flex: 3,
              child: SizedBox(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product name
                    Text(
                      product.productName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.label,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // Sugar per 100g/ml info
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '${sugarInfo.sugarsPer100g.toStringAsFixed(1)}g',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: CupertinoColors.label,
                            ),
                          ),
                          TextSpan(
                            text: ' per 100$productUnit',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: CupertinoColors.label,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),

                    // Bottom row with total sugar and time ago
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Total sugar alert-style indicator
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _getSugarAlertColor(
                              sugarInfo.totalSugarsInProduct,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${sugarInfo.totalSugarsInProduct.toStringAsFixed(1)}g total',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: CupertinoColors.white,
                            ),
                          ),
                        ),

                        // Time ago
                        Text(
                          timeAgo,
                          style: const TextStyle(
                            fontSize: 12,
                            color: CupertinoColors.systemGrey2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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

  String _getTimeAgo(DateTime lastScannedAt) {
    final now = DateTime.now();
    final difference = now.difference(lastScannedAt);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${(difference.inDays / 7).floor()}w ago';
    }
  }

  Color _getSugarAlertColor(double totalSugar) {
    return SugarLevelUtils.getDailySugarColor(totalSugar);
  }
}
