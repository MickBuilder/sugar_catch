import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sugar_catch/features/scan/data/openfoodfacts_api.dart';
import 'package:sugar_catch/features/scan/data/product_model.dart';
import 'package:sugar_catch/core/services/history_service.dart';

part 'scan_provider.g.dart';

@riverpod
OpenFoodFactsApi openFoodFactsApi(Ref ref) {
  return OpenFoodFactsApi();
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
}

class ScanState {
  const ScanState({required this.product, required this.sugarInfo});

  final Product product;
  final SugarInfo sugarInfo;
}
