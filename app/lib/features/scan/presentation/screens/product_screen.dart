import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweetr/core/analytics/analytics_service.dart';
import 'package:sweetr/features/scan/data/product_model.dart';
import 'package:sweetr/features/scan/scan_provider.dart';
import 'package:sweetr/features/scan/presentation/widgets/recommendations_widget.dart';
import 'package:sweetr/features/scan/presentation/widgets/product_image_widget.dart';
import 'package:sweetr/features/scan/presentation/widgets/product_header_widget.dart';
import 'package:sweetr/features/scan/presentation/widgets/whats_inside_widget.dart';

class ProductScreen extends ConsumerWidget {
  final String barcode;

  const ProductScreen({super.key, required this.barcode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productByBarcodeProvider(barcode));

    // Debug logging
    log('📱 [PRODUCT_SCREEN] barcode: $barcode', name: 'Scan');
    log('📱 [PRODUCT_SCREEN] productAsync: $productAsync', name: 'Scan');

    // Track product view when data is available
    productAsync.whenData((data) {
      if (data != null) {
        _trackProductViewed(ref, data.product, data.sugarInfo);
      }
    });

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
            
            // Check if we can pop (go back to previous page)
            if (context.canPop()) {
              log('🔙 [PRODUCT_SCREEN] Going back to previous page', name: 'Scan');
              context.pop();
            } else {
              // If no previous page, go to home
              log('🏠 [PRODUCT_SCREEN] No previous page, going to home', name: 'Scan');
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
                                  log('Added to daily log!', name: 'Scan');
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

  // Analytics tracking methods
  Future<void> _trackProductViewed(WidgetRef ref, Product product, SugarInfo sugarInfo) async {
    try {
      log('📊 [ANALYTICS] Starting _trackProductViewed for: ${product.productName}', name: 'Scan');
      final analytics = await ref.read(analyticsServiceProvider.future);
      log('📊 [ANALYTICS] Analytics service obtained, tracking product viewed...', name: 'Scan');
      
      await analytics.trackProductViewed(
        product.code,
        product.productName,
        product.sugarsPer100g,
        product.categories?.split(',').first.trim() ?? 'Unknown',
      );
      
      log('📊 [ANALYTICS] Product viewed tracked successfully', name: 'Scan');
      
      // Track product analysis completion
      await _trackProductAnalysisCompleted(ref, product);
    } catch (e) {
      log('📊 [ANALYTICS] Error in _trackProductViewed: $e', name: 'Scan');
    }
  }

  Future<void> _trackProductAnalysisCompleted(WidgetRef ref, Product product) async {
    try {
      log('📊 [ANALYTICS] Starting _trackProductAnalysisCompleted for: ${product.productName}', name: 'Scan');
      final analytics = await ref.read(analyticsServiceProvider.future);
      
      // Count hidden sugars, sweeteners, and additives
      final hiddenSugarsCount = product.ingredientsTags?.where((tag) => 
        tag.toLowerCase().contains('sugar') || 
        tag.toLowerCase().contains('syrup') ||
        tag.toLowerCase().contains('honey') ||
        tag.toLowerCase().contains('molasses')
      ).length ?? 0;
      
      final sweetenersCount = product.additivesTags?.where((tag) => 
        tag.toLowerCase().contains('e95') || 
        tag.toLowerCase().contains('e96') ||
        tag.toLowerCase().contains('e420') ||
        tag.toLowerCase().contains('e421')
      ).length ?? 0;
      
      final additivesCount = product.additivesTags?.length ?? 0;
      
      log('📊 [ANALYTICS] Analysis counts - Hidden sugars: $hiddenSugarsCount, Sweeteners: $sweetenersCount, Additives: $additivesCount', name: 'Scan');
      
      await analytics.trackProductAnalysisCompleted(
        hiddenSugarsCount,
        sweetenersCount,
        additivesCount,
      );
      
      log('📊 [ANALYTICS] Product analysis completed tracked successfully', name: 'Scan');
    } catch (e) {
      log('📊 [ANALYTICS] Error in _trackProductAnalysisCompleted: $e', name: 'Scan');
    }
  }
}
