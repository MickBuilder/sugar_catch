import 'dart:developer';
import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweetr/features/scan/data/openfoodfacts_api.dart';
import 'package:sweetr/features/scan/data/product_model.dart';
import 'package:sweetr/core/services/history_service.dart';
import 'package:sweetr/core/services/cache_service.dart';

part 'scan_provider.g.dart';

@riverpod
OpenFoodFactsApi openFoodFactsApi(Ref ref) {
  return OpenFoodFactsApi();
}

// New provider for fetching product data by barcode
@riverpod
Future<ScanState?> productByBarcode(Ref ref, String barcode) async {
  log('🔍 [PRODUCT_PROVIDER] Fetching product for barcode: $barcode', name: 'Scan');
  
  try {
    // First, try to get from cache
    final cachedProduct = CacheService.getCachedProduct(barcode);
    final cachedSugarInfo = CacheService.getCachedSugarInfo(barcode);
    
    if (cachedProduct != null && cachedSugarInfo != null) {
      log('✅ [PRODUCT_PROVIDER] Found cached data for barcode: $barcode', name: 'Scan');
      return ScanState(product: cachedProduct, sugarInfo: cachedSugarInfo);
    }
    
    // If not in cache, fetch from API
    log('🌐 [PRODUCT_PROVIDER] Fetching from API for barcode: $barcode', name: 'Scan');
    final api = ref.read(openFoodFactsApiProvider);
    final product = await api.fetchProduct(barcode);
    
    if (product != null) {
      final sugarInfo = await api.extractSugarInfo(product);
      
      // Cache the data for future use
      await CacheService.cacheProduct(barcode, product);
      await CacheService.cacheSugarInfo(barcode, sugarInfo);
      
      log('✅ [PRODUCT_PROVIDER] Successfully fetched and cached product: ${product.productName}', name: 'Scan');
      return ScanState(product: product, sugarInfo: sugarInfo);
    } else {
      log('❌ [PRODUCT_PROVIDER] Product not found for barcode: $barcode', name: 'Scan');
      return null;
    }
  } catch (error) {
    log('❌ [PRODUCT_PROVIDER] Error fetching product: $error', name: 'Scan');
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
    log('🔍 [SCAN_PROVIDER] Starting barcode scan: $barcode', name: 'Scan');
    log('🔍 [SCAN_PROVIDER] Current state: $state', name: 'Scan');

    try {
      log('🔍 [SCAN_PROVIDER] Getting API instance...', name: 'Scan');
      final api = ref.read(openFoodFactsApiProvider);

      log('🔍 [SCAN_PROVIDER] Calling fetchProduct for barcode: $barcode', name: 'Scan');
      final product = await api.fetchProduct(barcode);
      log(
        '🔍 [SCAN_PROVIDER] API response received: ${product != null ? "Product found" : "Product not found"}', name: 'Scan');

      if (product != null) {
        log('🔍 [SCAN_PROVIDER] Extracting sugar info...', name: 'Scan');
        final sugarInfo = await api.extractSugarInfo(product);
        log(
          '🔍 [SCAN_PROVIDER] Sugar info extracted: SugarsPer100g=${sugarInfo.sugarsPer100g}, TotalSugars=${sugarInfo.totalSugarsInProduct}${sugarInfo.productUnit}, HiddenIngredients=${sugarInfo.hiddenSugarIngredients.length}', name: 'Scan');

        // Add to history
        await HistoryService.addToHistory(product, sugarInfo);

        // Create the ScanState
        final newScanState = ScanState(product: product, sugarInfo: sugarInfo);
        log(
          '🔍 [SCAN_PROVIDER] Creating new ScanState: ${newScanState.product.productName}', name: 'Scan');
        log('🔍 [SCAN_PROVIDER] ScanState object: $newScanState', name: 'Scan');

        // DIRECT STATE ASSIGNMENT - This should work!
        log('🔍 [SCAN_PROVIDER] Setting state directly...', name: 'Scan');
        state = newScanState;

        // Verify the state was set
        log('✅ [SCAN_PROVIDER] State set successfully', name: 'Scan');
        log('🔍 [SCAN_PROVIDER] State after setting: $state', name: 'Scan');
        log('🔍 [SCAN_PROVIDER] State is null: ${state == null}', name: 'Scan');
      } else {
        log('❌ [SCAN_PROVIDER] Product not found, setting null state', name: 'Scan');
        state = null;
      }
    } catch (error, stackTrace) {
      log('❌ [SCAN_PROVIDER] Error occurred: $error', name: 'Scan');
      log('❌ [SCAN_PROVIDER] Stack trace: $stackTrace', name: 'Scan');
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
