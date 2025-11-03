import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:cleanfood/core/analytics/analytics_service.dart';
import 'package:cleanfood/core/services/favorites_service.dart';
import 'package:cleanfood/features/scan/data/product_model.dart';
import 'package:cleanfood/features/scan/scan_provider.dart';
import 'package:cleanfood/features/scan/presentation/widgets/product_header_section.dart';
import 'package:cleanfood/features/scan/presentation/widgets/additives_section.dart';
import 'package:cleanfood/features/scan/presentation/widgets/allergy_diet_section.dart';
import 'package:cleanfood/features/scan/presentation/widgets/ingredients_section.dart';

class ProductScreen extends ConsumerStatefulWidget {
  final String barcode;

  const ProductScreen({super.key, required this.barcode});

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  void _loadFavoriteStatus() {
    _isFavorite = FavoritesService.isFavorite(widget.barcode);
  }

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(productByBarcodeProvider(widget.barcode));

    // Track product view when data is available
    productAsync.whenData((data) {
      if (data != null) {
        _trackProductViewed(ref, data.product, data.sugarInfo);
      }
    });

    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light gray background
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: null,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            HapticFeedback.selectionClick();
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/home');
            }
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: CupertinoColors.black, size: 20),
              SizedBox(width: 4),
              Text(
                'Back',
                style: TextStyle(
                  fontSize: 17,
                  color: CupertinoColors.black,
                ),
              ),
            ],
          ),
        ),
        middle: const Text(
          'Nutrition Details',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: CupertinoColors.black,
          ),
        ),
        trailing: productAsync.when(
          data: (scanState) => scanState == null
              ? const SizedBox.shrink()
              : _buildFavoriteButton(scanState.product),
          loading: () => const SizedBox.shrink(),
          error: (error, stackTrace) => const SizedBox.shrink(),
        ),
      ),
      child: productAsync.when(
        data: (scanState) => scanState == null
            ? const Center(child: Text('Product not found'))
            : _buildProductContent(context, scanState),
        loading: () =>
            const Center(child: CupertinoActivityIndicator(radius: 20)),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HugeIcon(
                icon: HugeIcons.strokeRoundedAlert02,
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
                onPressed: () => ref.refresh(productByBarcodeProvider(widget.barcode)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteButton(Product product) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () async {
        HapticFeedback.selectionClick();
        await FavoritesService.toggleFavorite(product);
        setState(() {
          _isFavorite = FavoritesService.isFavorite(widget.barcode);
        });
        HapticFeedback.mediumImpact();
      },
      child: HugeIcon(
        icon: HugeIcons.strokeRoundedBookmark01,
        color: _isFavorite 
            ? CupertinoColors.systemGreen
            : CupertinoColors.black,
        size: 24,
      ),
    );
  }

  Widget _buildProductContent(BuildContext context, ScanState data) {
    final product = data.product;
    final sugarInfo = data.sugarInfo;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section (Image + Name + Score + Summary Icons)
          ProductHeaderSection(
            product: product,
            sugarInfo: sugarInfo,
          ),

          const SizedBox(height: 12),

          // Additives Section
          AdditivesSection(product: product),

          const SizedBox(height: 12),

          // Allergy & Diet info Section
          AllergyDietSection(product: product),

          const SizedBox(height: 12),

          // Ingredients Section
          IngredientsSection(product: product),

          const SizedBox(height: 100), // Space for bottom padding
        ],
      ),
    );
  }

  // Analytics tracking methods
  Future<void> _trackProductViewed(WidgetRef ref, Product product, SugarInfo sugarInfo) async {
    try {
      final analytics = await ref.read(analyticsServiceProvider.future);
      await analytics.trackProductViewed(
        product.code,
        product.productName,
        product.sugarsPer100g,
        product.categories?.split(',').first.trim() ?? 'Unknown',
      );
      await _trackProductAnalysisCompleted(ref, product);
    } catch (e) {
      log('Analytics error: $e', name: 'Scan');
    }
  }

  Future<void> _trackProductAnalysisCompleted(WidgetRef ref, Product product) async {
    try {
      final analytics = await ref.read(analyticsServiceProvider.future);
      final hiddenSugarsCount = product.ingredientsTags?.where((tag) => 
        tag.toLowerCase().contains('sugar') || 
        tag.toLowerCase().contains('syrup')
      ).length ?? 0;
      
      final sweetenersCount = product.ingredientsSweetenersN ?? 0;
      final additivesCount = product.additivesTags?.length ?? 0;
      
      await analytics.trackProductAnalysisCompleted(
        hiddenSugarsCount,
        sweetenersCount,
        additivesCount,
      );
    } catch (e) {
      log('Analytics error: $e', name: 'Scan');
    }
  }
}
