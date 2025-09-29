import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sweetr/features/scan/data/product_model.dart';
import 'package:sweetr/core/constants/sugar_aliases.dart';
import 'package:sweetr/core/services/cache_service.dart';

class OpenFoodFactsApi {
  static const String baseUrl = 'https://world.openfoodfacts.org';

  Future<Product?> fetchProduct(String barcode) async {
    log('🌐 [API] Starting fetchProduct for barcode: $barcode', name: 'Scan');

    // Check cache first
    final cachedProduct = CacheService.getCachedProduct(barcode);
    if (cachedProduct != null && CacheService.isCacheValid(barcode)) {
      log('💾 [API] Using cached product for barcode: $barcode', name: 'Scan');
      return cachedProduct;
    }

    try {
      final url = '$baseUrl/api/v0/product/$barcode.json';
      log('🌐 [API] Making HTTP request to: $url', name: 'Scan');

      final response = await http.get(
        Uri.parse(url),
        headers: {'User-Agent': 'Sweetr/1.0.0'},
      );

      log('🌐 [API] HTTP response status: ${response.statusCode}', name: 'Scan');
      log('🌐 [API] Response body length: ${response.body.length}', name: 'Scan');

      if (response.statusCode == 200) {
        log('🌐 [API] Parsing JSON response...', name: 'Scan');
        final data = json.decode(response.body);
        log('🌐 [API] API status: ${data['status']}', name: 'Scan');

        if (data['status'] == 1 && data['product'] != null) {
          log('🌐 [API] Product found, parsing product data...', name: 'Scan');
          final product = _parseProduct(data['product'], barcode);
          log('🌐 [API] Product created: ${product.productName}', name: 'Scan');

          // Cache the product
          await CacheService.cacheProduct(barcode, product);

          return product;
        } else {
          log('🌐 [API] Product not found (status != 1 or product is null)', name: 'API');
        }
      } else {
        log('🌐 [API] HTTP error: ${response.statusCode}', name: 'API');
      }
      return null;
    } catch (e, stackTrace) {
      log('❌ [API] Exception in fetchProduct: $e', name: 'API');
      log('❌ [API] Stack trace: $stackTrace', name: 'API');
      return null;
    }
  }

  Product _parseProduct(Map<String, dynamic> productData, String barcode) {
    log('🌐 [API] _parseProduct called with barcode: $barcode', name: 'Scan');
    log('🌐 [API] productData keys: ${productData.keys.toList()}', name: 'Scan');

    final nutriments = productData['nutriments'] as Map<String, dynamic>? ?? {};

    log('🌐 [API] nutriments: $nutriments', name: 'Scan');

    final sugarsPer100g = _parseDouble(nutriments['sugars_100g']) ?? 0.0;
    final sugarsServing = _parseDouble(nutriments['sugars_serving']);

    log('🌐 [API] sugarsPer100g: $sugarsPer100g', name: 'Scan');
    log('🌐 [API] sugarsServing: $sugarsServing', name: 'Scan');

    // Extract image URL from selected_images
    String? imageUrl;
    final selectedImages =
        productData['selected_images'] as Map<String, dynamic>?;
    if (selectedImages != null) {
      final front = selectedImages['front'] as Map<String, dynamic>?;
      if (front != null) {
        final display = front['display'] as Map<String, dynamic>?;
        if (display != null) {
          // Try to get English image first, fallback to any available
          imageUrl =
              display['en'] as String? ??
              display['fr'] as String? ??
              display.values.first as String?;
        }
      }
    }

    log('🌐 [API] imageUrl: $imageUrl', name: 'Scan');

    // Parse ingredients array
    List<Ingredient>? ingredientsList;
    final ingredientsArray = productData['ingredients'] as List<dynamic>?;
    if (ingredientsArray != null) {
      ingredientsList = ingredientsArray
          .map(
            (ingredient) =>
                Ingredient.fromJson(ingredient as Map<String, dynamic>),
          )
          .toList();
      log('🌐 [API] Parsed ${ingredientsList.length} ingredients', name: 'Scan');
    }

    // Parse categories
    final categories = productData['categories']?.toString();
    final categoriesHierarchy = (productData['categories_hierarchy'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList();
    final categoriesTags = (productData['categories_tags'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList();

    // Parse ingredients tags
    final ingredientsTags = (productData['ingredients_tags'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList();

    // Parse new fields for Oasis layout
    final additivesTags = (productData['additives_tags'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList();
    final allergensTags = (productData['allergens_tags'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList();
    final tracesTags = (productData['traces_tags'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList();
    final ingredientsSweetenersN = productData['ingredients_sweeteners_n'] as int?;

    log('🌐 [API] categories: $categories', name: 'Scan');
    log('🌐 [API] categoriesHierarchy: $categoriesHierarchy', name: 'Scan');
    log('🌐 [API] categoriesTags: $categoriesTags', name: 'Scan');
    log('🌐 [API] ingredientsTags: $ingredientsTags', name: 'Scan');
    log('🌐 [API] additivesTags: $additivesTags', name: 'Scan');
    log('🌐 [API] allergensTags: $allergensTags', name: 'Scan');
    log('🌐 [API] tracesTags: $tracesTags', name: 'Scan');

    final product = Product(
      code: barcode,
      productName: productData['product_name']?.toString() ?? 'Unknown Product',
      productNameEn: productData['product_name_en']?.toString(),
      brands: productData['brands']?.toString(),
      sugarsPer100g: sugarsPer100g,
      sugarsServing: sugarsServing,
      servingSize: productData['serving_size']?.toString(),
      servingQuantity: productData['serving_quantity']?.toString(),
      quantity: productData['quantity']?.toString(),
      productQuantity: productData['product_quantity']?.toString(),
      productQuantityUnit: productData['product_quantity_unit']?.toString(),
      ingredientsList: ingredientsList,
      ingredientsTags: ingredientsTags,
      imageUrl: imageUrl,
      imageFrontUrl: productData['image_front_url']?.toString(),
      categories: categories,
      categoriesHierarchy: categoriesHierarchy,
      categoriesTags: categoriesTags,
      additivesTags: additivesTags,
      allergensTags: allergensTags,
      tracesTags: tracesTags,
      ingredientsSweetenersN: ingredientsSweetenersN,
      nutriments: nutriments,
    );

    log('🌐 [API] Created Product: ${product.toString()}', name: 'Scan');
    return product;
  }

  Future<SugarInfo> extractSugarInfo(Product product) async {
    log(
      '🌐 [API] extractSugarInfo called for product: ${product.productName}',
     name: 'Scan');

    // Check cache first
    final cachedSugarInfo = CacheService.getCachedSugarInfo(product.code);
    if (cachedSugarInfo != null && CacheService.isCacheValid(product.code)) {
      log(
        '💾 [API] Using cached sugar info for product: ${product.productName}',
       name: 'Scan');
      return cachedSugarInfo;
    }

    log(
      '🌐 [API] product.ingredientsTags: ${product.ingredientsTags?.length ?? 0} tags',
     name: 'Scan');

    List<Ingredient> hiddenSugarIngredients = [];

    if (product.ingredientsTags != null) {
      // Check each ingredient tag for hidden sugars
      for (final ingredientTag in product.ingredientsTags!) {
        log('🌐 [API] Checking ingredient tag: $ingredientTag', name: 'Scan');

        // Check if this ingredient tag is a hidden sugar
        if (SugarAliases.isHiddenSugar(ingredientTag)) {
          log('🌐 [API] Found hidden sugar tag: $ingredientTag', name: 'Scan');
          
          // Try to find the corresponding ingredient in the ingredients list
          if (product.ingredientsList != null) {
            for (final ingredient in product.ingredientsList!) {
              final ingredientText = ingredient.textEn?.isNotEmpty == true
                  ? ingredient.textEn!
                  : ingredient.text;
              
              // Check if this ingredient text matches the tag (case-insensitive)
              if (ingredientText.toLowerCase().contains(ingredientTag.toLowerCase().replaceAll('en:', ''))) {
                hiddenSugarIngredients.add(ingredient);
                break; // Found the matching ingredient, move to next tag
              }
            }
          }
        }
      }
    }

    log(
      '🌐 [API] found ${hiddenSugarIngredients.length} hidden sugar ingredients',
     name: 'Scan');

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
        log(
          '🌐 [API] Calculated total sugars: ${totalSugarsInProduct.toStringAsFixed(2)}g (${product.sugarsPer100g}g per 100$productUnit * $totalAmount$productUnit = ${product.sugarsPer100g}g * ${(totalAmount / 100).toStringAsFixed(1)})', name: 'Scan'
        );
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

    log('🌐 [API] Created SugarInfo: ${sugarInfo.toString}', name: 'Scan');
    return sugarInfo;
  }

  double? _parseDouble(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}
