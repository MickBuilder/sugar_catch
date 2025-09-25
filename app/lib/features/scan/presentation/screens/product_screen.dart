import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sugar_catch/features/scan/scan_provider.dart';
import 'package:sugar_catch/features/scan/presentation/widgets/recommendations_widget.dart';
import 'package:sugar_catch/features/scan/presentation/widgets/product_image_widget.dart';
import 'package:sugar_catch/features/scan/presentation/widgets/product_header_widget.dart';
import 'package:sugar_catch/features/scan/presentation/widgets/whats_inside_widget.dart';

class ProductScreen extends ConsumerWidget {
  final String barcode;

  const ProductScreen({super.key, required this.barcode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productByBarcodeProvider(barcode));

    // Debug logging
    print('📱 [PRODUCT_SCREEN] barcode: $barcode');
    print('📱 [PRODUCT_SCREEN] productAsync: $productAsync');

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        border: null,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // Haptic feedback for back navigation
            HapticFeedback.selectionClick();
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/home');
            }
          },
          child: const Icon(CupertinoIcons.back, color: CupertinoColors.label),
        ),
        middle: const Text(
          'Nutrition Facts',
          style: TextStyle(
            color: CupertinoColors.label,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // Haptic feedback for close navigation
            HapticFeedback.selectionClick();
            context.go('/scan');
          },
          child: const Icon(CupertinoIcons.xmark, color: CupertinoColors.label),
        ),
      ),
      child: productAsync.when(
        data: (scanState) => scanState == null
            ? const Center(child: Text('Product not found'))
            : Column(
                children: [
                  Expanded(child: _buildProductContent(context, scanState)),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: CupertinoColors.systemBackground,
                      border: Border(
                        top: BorderSide(
                          color: CupertinoColors.separator,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: SafeArea(
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            // Home button
                            Expanded(
                              child: CupertinoButton(
                                onPressed: () {
                                  // Haptic feedback for home navigation
                                  HapticFeedback.selectionClick();
                                  context.go('/home');
                                },
                                color: CupertinoColors.systemGrey6,
                                borderRadius: BorderRadius.circular(12),
                                child: const Text(
                                  'Home',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: CupertinoColors.label,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Add to Daily Log button
                            Expanded(
                              child: CupertinoButton(
                                onPressed: () {
                                  // Haptic feedback for log entry
                                  HapticFeedback.mediumImpact();
                                  // TODO: Add to daily log functionality
                                  print('Added to daily log!');
                                },
                                color: CupertinoColors.systemGreen,
                                borderRadius: BorderRadius.circular(12),
                                child: const Text(
                                  'Add to Daily Log',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: CupertinoColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        loading: () =>
            const Center(child: CupertinoActivityIndicator(radius: 20)),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.exclamationmark_triangle,
                size: 48,
                color: CupertinoColors.systemRed,
              ),
              const SizedBox(height: 16),
              const Text(
                'Failed to load product',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.label,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: CupertinoColors.systemGrey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              CupertinoButton(
                onPressed: () => ref.refresh(productByBarcodeProvider(barcode)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductContent(BuildContext context, ScanState data) {
    final product = data.product;
    final sugarInfo = data.sugarInfo;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ProductImageWidget(imageUrl: product.imageUrl),
          if (product.imageUrl != null) const SizedBox(height: 16),

          // Product Header (Info + Summary)
          ProductHeaderWidget(
            product: product,
            sugarInfo: sugarInfo,
          ),

          const SizedBox(height: 20),

          // What's Inside Section
          WhatsInsideWidget(
            product: product,
            sugarInfo: sugarInfo,
          ),

          const SizedBox(height: 20),

          // Recommendations Section
          RecommendationsWidget(product: product),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

}
