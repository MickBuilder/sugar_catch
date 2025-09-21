import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sugar_catch/features/scan/data/openfoodfacts_api.dart';
import 'package:sugar_catch/features/scan/data/product_model.dart';
import 'package:sugar_catch/core/services/history_service.dart';
import 'package:sugar_catch/core/services/cache_service.dart';

part 'scan_provider.g.dart';

@riverpod
OpenFoodFactsApi openFoodFactsApi(Ref ref) {
  return OpenFoodFactsApi();
}

// New provider for fetching product data by barcode
@riverpod
Future<ScanState?> productByBarcode(Ref ref, String barcode) async {
  print('🔍 [PRODUCT_PROVIDER] Fetching product for barcode: $barcode');
  
  try {
    // First, try to get from cache
    final cachedProduct = CacheService.getCachedProduct(barcode);
    final cachedSugarInfo = CacheService.getCachedSugarInfo(barcode);
    
    if (cachedProduct != null && cachedSugarInfo != null) {
      print('✅ [PRODUCT_PROVIDER] Found cached data for barcode: $barcode');
      return ScanState(product: cachedProduct, sugarInfo: cachedSugarInfo);
    }
    
    // If not in cache, fetch from API
    print('🌐 [PRODUCT_PROVIDER] Fetching from API for barcode: $barcode');
    final api = ref.read(openFoodFactsApiProvider);
    final product = await api.fetchProduct(barcode);
    
    if (product != null) {
      final sugarInfo = await api.extractSugarInfo(product);
      
      // Cache the data for future use
      await CacheService.cacheProduct(barcode, product);
      await CacheService.cacheSugarInfo(barcode, sugarInfo);
      
      print('✅ [PRODUCT_PROVIDER] Successfully fetched and cached product: ${product.productName}');
      return ScanState(product: product, sugarInfo: sugarInfo);
    } else {
      print('❌ [PRODUCT_PROVIDER] Product not found for barcode: $barcode');
      return null;
    }
  } catch (error) {
    print('❌ [PRODUCT_PROVIDER] Error fetching product: $error');
    rethrow;
  }
}

// COMPLETELY NEW APPROACH - Use StateNotifier instead of AsyncNotifier
// FIXED: Use keepAlive to prevent provider disposal during navigation
@Riverpod(keepAlive: true)
class ScanNotifier extends _$ScanNotifier {
  @override
  ScanState? build() {
    return null;
  }

  Future<void> scanBarcode(String barcode) async {
    print('🔍 [SCAN_PROVIDER] Starting barcode scan: $barcode');
    print('🔍 [SCAN_PROVIDER] Current state: $state');

    try {
      print('🔍 [SCAN_PROVIDER] Getting API instance...');
      final api = ref.read(openFoodFactsApiProvider);

      print('🔍 [SCAN_PROVIDER] Calling fetchProduct for barcode: $barcode');
      final product = await api.fetchProduct(barcode);
      print(
        '🔍 [SCAN_PROVIDER] API response received: ${product != null ? "Product found" : "Product not found"}',
      );

      if (product != null) {
        print('🔍 [SCAN_PROVIDER] Extracting sugar info...');
        final sugarInfo = await api.extractSugarInfo(product);
        print(
          '🔍 [SCAN_PROVIDER] Sugar info extracted: SugarsPer100g=${sugarInfo.sugarsPer100g}, TotalSugars=${sugarInfo.totalSugarsInProduct}${sugarInfo.productUnit}, HiddenIngredients=${sugarInfo.hiddenSugarIngredients.length}',
        );

        // Add to history
        await HistoryService.addToHistory(product, sugarInfo);

        // Create the ScanState
        final newScanState = ScanState(product: product, sugarInfo: sugarInfo);
        print(
          '🔍 [SCAN_PROVIDER] Creating new ScanState: ${newScanState.product.productName}',
        );
        print('🔍 [SCAN_PROVIDER] ScanState object: $newScanState');

        // DIRECT STATE ASSIGNMENT - This should work!
        print('🔍 [SCAN_PROVIDER] Setting state directly...');
        state = newScanState;

        // Verify the state was set
        print('✅ [SCAN_PROVIDER] State set successfully');
        print('🔍 [SCAN_PROVIDER] State after setting: $state');
        print('🔍 [SCAN_PROVIDER] State is null: ${state == null}');
      } else {
        print('❌ [SCAN_PROVIDER] Product not found, setting null state');
        state = null;
      }
    } catch (error, stackTrace) {
      print('❌ [SCAN_PROVIDER] Error occurred: $error');
      print('❌ [SCAN_PROVIDER] Stack trace: $stackTrace');
      state = null;
    }
  }

  void clearProduct() {
    state = null;
  }

  void setProductData(Product product, SugarInfo sugarInfo) {
    state = ScanState(product: product, sugarInfo: sugarInfo);
  }
}

class ScanState {
  const ScanState({required this.product, required this.sugarInfo});

  final Product product;
  final SugarInfo sugarInfo;
}
