import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sugar_catch/features/scan/data/product_model.dart';
import 'package:sugar_catch/core/constants/sugar_aliases.dart';
import 'package:sugar_catch/core/services/cache_service.dart';

class OpenFoodFactsApi {
  static const String baseUrl = 'https://world.openfoodfacts.org';

  Future<Product?> fetchProduct(String barcode) async {
    print('🌐 [API] Starting fetchProduct for barcode: $barcode');
    
    // Check cache first
    final cachedProduct = CacheService.getCachedProduct(barcode);
    if (cachedProduct != null && CacheService.isCacheValid(barcode)) {
      print('💾 [API] Using cached product for barcode: $barcode');
      return cachedProduct;
    }
    
    try {
      final url = '$baseUrl/api/v0/product/$barcode.json';
      print('🌐 [API] Making HTTP request to: $url');
      
      final response = await http.get(
        Uri.parse(url),
        headers: {'User-Agent': 'SugarCatch/1.0.0'},
      );
      
      print('🌐 [API] HTTP response status: ${response.statusCode}');
      print('🌐 [API] Response body length: ${response.body.length}');

      if (response.statusCode == 200) {
        print('🌐 [API] Parsing JSON response...');
        final data = json.decode(response.body);
        print('🌐 [API] API status: ${data['status']}');

        if (data['status'] == 1 && data['product'] != null) {
          print('🌐 [API] Product found, parsing product data...');
          final product = _parseProduct(data['product'], barcode);
          print('🌐 [API] Product created: ${product.productName}');
          
          // Cache the product
          await CacheService.cacheProduct(barcode, product);
          
          return product;
        } else {
          print('🌐 [API] Product not found (status != 1 or product is null)');
        }
      } else {
        print('🌐 [API] HTTP error: ${response.statusCode}');
      }
      return null;
    } catch (e, stackTrace) {
      print('❌ [API] Exception in fetchProduct: $e');
      print('❌ [API] Stack trace: $stackTrace');
      return null;
    }
  }

  Product _parseProduct(Map<String, dynamic> productData, String barcode) {
    print('🌐 [API] _parseProduct called with barcode: $barcode');
    print('🌐 [API] productData keys: ${productData.keys.toList()}');
    
    final nutriments = productData['nutriments'] as Map<String, dynamic>? ?? {};
    
    print('🌐 [API] nutriments: $nutriments');

    final sugarsPer100g = _parseDouble(nutriments['sugars_100g']) ?? 0.0;
    final sugarsServing = _parseDouble(nutriments['sugars_serving']);
    
    print('🌐 [API] sugarsPer100g: $sugarsPer100g');
    print('🌐 [API] sugarsServing: $sugarsServing');

    // Extract image URL from selected_images
    String? imageUrl;
    final selectedImages = productData['selected_images'] as Map<String, dynamic>?;
    if (selectedImages != null) {
      final front = selectedImages['front'] as Map<String, dynamic>?;
      if (front != null) {
        final display = front['display'] as Map<String, dynamic>?;
        if (display != null) {
          // Try to get English image first, fallback to any available
          imageUrl = display['en'] as String? ?? 
                    display['fr'] as String? ?? 
                    display.values.first as String?;
        }
      }
    }
    
    print('🌐 [API] imageUrl: $imageUrl');

    // Parse ingredients array
    List<Ingredient>? ingredientsList;
    final ingredientsArray = productData['ingredients'] as List<dynamic>?;
    if (ingredientsArray != null) {
      ingredientsList = ingredientsArray
          .map((ingredient) => Ingredient.fromJson(ingredient as Map<String, dynamic>))
          .toList();
      print('🌐 [API] Parsed ${ingredientsList.length} ingredients');
    }

    final product = Product(
      code: barcode,
      productName: productData['product_name'] as String? ?? 'Unknown Product',
      productNameEn: productData['product_name_en'] as String?,
      brands: productData['brands'] as String?,
      sugarsPer100g: sugarsPer100g,
      sugarsServing: sugarsServing,
      servingSize: productData['serving_size'] as String?,
      servingQuantity: productData['serving_quantity'] as String?,
      quantity: productData['quantity'] as String?,
      productQuantity: productData['product_quantity'] as String?,
      productQuantityUnit: productData['product_quantity_unit'] as String?,
      ingredientsList: ingredientsList,
      imageUrl: imageUrl,
      imageFrontUrl: productData['image_front_url'] as String?,
      nutriments: nutriments,
    );
    
    print('🌐 [API] Created Product: ${product.toString()}');
    return product;
  }

  Future<SugarInfo> extractSugarInfo(Product product) async {
    print('🌐 [API] extractSugarInfo called for product: ${product.productName}');
    
    // Check cache first
    final cachedSugarInfo = CacheService.getCachedSugarInfo(product.code);
    if (cachedSugarInfo != null && CacheService.isCacheValid(product.code)) {
      print('💾 [API] Using cached sugar info for product: ${product.productName}');
      return cachedSugarInfo;
    }
    
    print('🌐 [API] product.ingredientsList: ${product.ingredientsList?.length ?? 0} ingredients');
    
    List<Ingredient> hiddenSugarIngredients = [];
    
    if (product.ingredientsList != null) {
      // Check each ingredient for hidden sugars
      for (final ingredient in product.ingredientsList!) {
        final ingredientText = ingredient.textEn?.isNotEmpty == true 
            ? ingredient.textEn! 
            : ingredient.text;
        
        print('🌐 [API] Checking ingredient: $ingredientText');
        
        // Check if this ingredient is a hidden sugar
        if (SugarAliases.isHiddenSugar(ingredientText)) {
          print('🌐 [API] Found hidden sugar: $ingredientText');
          hiddenSugarIngredients.add(ingredient);
        }
      }
    }
    
    print('🌐 [API] found ${hiddenSugarIngredients.length} hidden sugar ingredients');

    // Calculate total sugar amount in the product
    double totalSugarsInProduct = 0.0;
    final productUnit = product.productQuantityUnit ?? 'g';
    
    if (product.productQuantity != null) {
      // Use product_quantity directly (no regex needed)
      final totalAmount = double.tryParse(product.productQuantity!);
      if (totalAmount != null) {
        // Calculate total sugar: sugars per 100g * (total amount / 100)
        // Example: 12.5g per 100ml, product is 500ml → 12.5g * (500/100) = 12.5g * 5 = 62.5g
        totalSugarsInProduct = product.sugarsPer100g * (totalAmount / 100);
        print('🌐 [API] Calculated total sugars: ${totalSugarsInProduct.toStringAsFixed(2)}g (${product.sugarsPer100g}g per 100${productUnit} * ${totalAmount}${productUnit} = ${product.sugarsPer100g}g * ${(totalAmount / 100).toStringAsFixed(1)})');
      }
    }

    final sugarInfo = SugarInfo(
      sugarsPer100g: product.sugarsPer100g,
      totalSugarsInProduct: totalSugarsInProduct,
      productUnit: productUnit,
      hiddenSugarIngredients: hiddenSugarIngredients,
    );
    
    // Cache the sugar info
    await CacheService.cacheSugarInfo(product.code, sugarInfo);
    
    print('🌐 [API] Created SugarInfo: ${sugarInfo.toString()}');
    return sugarInfo;
  }

  double? _parseDouble(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}