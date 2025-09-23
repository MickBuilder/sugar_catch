import 'dart:convert';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:sugar_catch/features/scan/data/product_model.dart';

class CacheService {
  static const String _productBoxName = 'products';
  static const String _sugarInfoBoxName = 'sugar_info';
  static const String _recommendationsBoxName = 'recommendations';
  static const Duration _cacheExpiry = Duration(
    hours: 48,
  ); // Cache for 48 hours

  static Box<String>? _productBox;
  static Box<String>? _sugarInfoBox;
  static Box<String>? _recommendationsBox;

  static Future<void> init() async {
    _productBox = await Hive.openBox<String>(_productBoxName);
    _sugarInfoBox = await Hive.openBox<String>(_sugarInfoBoxName);
    _recommendationsBox = await Hive.openBox<String>(_recommendationsBoxName);
  }

  // Cache product data as JSON
  static Future<void> cacheProduct(String barcode, Product product) async {
    if (_productBox != null) {
      final productJson = product.toJson();
      final productJsonString = jsonEncode(productJson);
      await _productBox!.put(barcode, productJsonString);
      print('💾 [CACHE] Cached product for barcode: $barcode');
    }
  }

  // Cache sugar info data as JSON
  static Future<void> cacheSugarInfo(
    String barcode,
    SugarInfo sugarInfo,
  ) async {
    if (_sugarInfoBox != null) {
      final sugarInfoJson = sugarInfo.toJson();
      final sugarInfoJsonString = jsonEncode(sugarInfoJson);
      await _sugarInfoBox!.put(barcode, sugarInfoJsonString);
      print('💾 [CACHE] Cached sugar info for barcode: $barcode');
    }
  }

  // Cache recommendations data as JSON with timestamp
  static Future<void> cacheRecommendations(
    String barcode,
    List<Product> recommendations,
  ) async {
    if (_recommendationsBox != null) {
      final recommendationsJson = recommendations.map((p) => p.toJson()).toList();
      final cacheData = {
        'recommendations': recommendationsJson,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };
      final cacheJsonString = jsonEncode(cacheData);
      await _recommendationsBox!.put(barcode, cacheJsonString);
      print('💾 [CACHE] Cached ${recommendations.length} recommendations for barcode: $barcode');
    }
  }

  // Get cached product data
  static Product? getCachedProduct(String barcode) {
    if (_productBox != null) {
      final productJsonString = _productBox!.get(barcode);
      if (productJsonString != null) {
        try {
          final productJson =
              jsonDecode(productJsonString) as Map<String, dynamic>;
          final product = Product.fromJson(productJson);
          print('💾 [CACHE] Retrieved cached product for barcode: $barcode');
          return product;
        } catch (e) {
          print('💾 [CACHE] Error parsing cached product: $e');
          return null;
        }
      }
    }
    print('💾 [CACHE] No cached product found for barcode: $barcode');
    return null;
  }

  // Get cached sugar info data
  static SugarInfo? getCachedSugarInfo(String barcode) {
    if (_sugarInfoBox != null) {
      final sugarInfoJsonString = _sugarInfoBox!.get(barcode);
      if (sugarInfoJsonString != null) {
        try {
          final sugarInfoJson =
              jsonDecode(sugarInfoJsonString) as Map<String, dynamic>;
          final sugarInfo = SugarInfo.fromJson(sugarInfoJson);
          print('💾 [CACHE] Retrieved cached sugar info for barcode: $barcode');
          return sugarInfo;
        } catch (e) {
          print('💾 [CACHE] Error parsing cached sugar info: $e');
          return null;
        }
      }
    }
    print('💾 [CACHE] No cached sugar info found for barcode: $barcode');
    return null;
  }

  // Get cached recommendations data
  static List<Product>? getCachedRecommendations(String barcode) {
    if (_recommendationsBox != null) {
      final recommendationsJsonString = _recommendationsBox!.get(barcode);
      if (recommendationsJsonString != null) {
        try {
          final cacheData = jsonDecode(recommendationsJsonString) as Map<String, dynamic>;
          final timestamp = cacheData['timestamp'] as int;
          final now = DateTime.now().millisecondsSinceEpoch;
          
          // Check if cache is still valid (48 hours)
          if (now - timestamp < _cacheExpiry.inMilliseconds) {
            final recommendationsJson = cacheData['recommendations'] as List<dynamic>;
            final recommendations = recommendationsJson
                .map((json) => Product.fromJson(json as Map<String, dynamic>))
                .toList();
            print('💾 [CACHE] Retrieved ${recommendations.length} cached recommendations for barcode: $barcode');
            return recommendations;
          } else {
            print('💾 [CACHE] Cached recommendations expired for barcode: $barcode');
            // Remove expired cache
            _recommendationsBox!.delete(barcode);
            return null;
          }
        } catch (e) {
          print('💾 [CACHE] Error parsing cached recommendations: $e');
          return null;
        }
      }
    }
    print('💾 [CACHE] No cached recommendations found for barcode: $barcode');
    return null;
  }

  // Check if cache is valid (not expired)
  static bool isCacheValid(String barcode) {
    // For now, we'll use a simple approach - cache is valid for 24 hours
    // In a more sophisticated implementation, you could store timestamps
    return true; // Always return true for now, but you could implement expiry logic
  }

  // Clear cache for a specific barcode
  static Future<void> clearCache(String barcode) async {
    if (_productBox != null) {
      await _productBox!.delete(barcode);
    }
    if (_sugarInfoBox != null) {
      await _sugarInfoBox!.delete(barcode);
    }
    if (_recommendationsBox != null) {
      await _recommendationsBox!.delete(barcode);
    }
    print('💾 [CACHE] Cleared cache for barcode: $barcode');
  }

  // Clear all cache
  static Future<void> clearAllCache() async {
    if (_productBox != null) {
      await _productBox!.clear();
    }
    if (_sugarInfoBox != null) {
      await _sugarInfoBox!.clear();
    }
    if (_recommendationsBox != null) {
      await _recommendationsBox!.clear();
    }
    print('💾 [CACHE] Cleared all cache');
  }

  // Get cache statistics
  static Map<String, int> getCacheStats() {
    return {
      'products': _productBox?.length ?? 0,
      'sugar_info': _sugarInfoBox?.length ?? 0,
      'recommendations': _recommendationsBox?.length ?? 0,
    };
  }
}
