import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sugar_catch/features/scan/data/product_model.dart';
import 'package:sugar_catch/core/services/cache_service.dart';

class RecommendationsService {
  // Sugar thresholds to determine when to show recommendations
  static const double _highSugarThresholdGrams = 9.0; // For solid foods (g)
  static const double _highSugarThresholdMl = 1.5; // For beverages (ml)

  /// Get low-sugar alternatives for a product
  /// Only shows recommendations if the current product has high sugar content
  static Future<List<Product>> getLowSugarAlternatives(Product product) async {
    print('🔍 [RecommendationsService] Getting recommendations for: ${product.productName}');
    print('🔍 [RecommendationsService] Sugar content: ${product.sugarsPer100g}g/100${product.productQuantityUnit ?? 'g'}');
    
    // Check if we have cached recommendations
    final cachedRecommendations = CacheService.getCachedRecommendations(product.code);
    if (cachedRecommendations != null) {
      print('🔍 [RecommendationsService] Using cached recommendations: ${cachedRecommendations.length} products');
      return cachedRecommendations;
    }
    
    // Check if product has high sugar content
    if (!_shouldShowRecommendations(product)) {
      print('🔍 [RecommendationsService] Product has low sugar content, no recommendations needed');
      return [];
    }

    // Get categories for search (multiple categories for better results)
    final categories = _getSearchCategories(product);
    if (categories.isEmpty) {
      print('⚠️ [RecommendationsService] No categories found, cannot search for alternatives');
      return [];
    }

    print('🔍 [RecommendationsService] Searching for alternatives in categories: $categories');
    
    // Search for similar products with low sugar content (below threshold)
    final alternatives = await _searchLowSugarAlternatives(categories, product.productQuantityUnit ?? 'g');
    
    // Filter and sort results
    final filteredAlternatives = _filterAndSortAlternatives(alternatives);
    
    print('🔍 [RecommendationsService] Found ${filteredAlternatives.length} low-sugar alternatives');
    
    // Cache the recommendations
    if (filteredAlternatives.isNotEmpty) {
      await CacheService.cacheRecommendations(product.code, filteredAlternatives);
    }
    
    return filteredAlternatives;
  }

  /// Determine if recommendations should be shown based on sugar content
  static bool _shouldShowRecommendations(Product product) {
    final unit = product.productQuantityUnit?.toLowerCase() ?? 'g';
    final sugarContent = product.sugarsPer100g;
    
    if (unit == 'ml') {
      return sugarContent >= _highSugarThresholdMl;
    } else {
      return sugarContent >= _highSugarThresholdGrams;
    }
  }

  /// Get categories from hierarchy only (most specific categories)
  static List<String> _getSearchCategories(Product product) {
    print('🔍 [RecommendationsService] Getting search categories for: ${product.productName}');
    print('🔍 [RecommendationsService] categoriesHierarchy: ${product.categoriesHierarchy}');
    
    final categories = <String>[];
    
    // Only use categories hierarchy (get last 2-3 most specific categories)
    if (product.categoriesHierarchy != null && product.categoriesHierarchy!.isNotEmpty) {
      final hierarchy = product.categoriesHierarchy!;
      // Get the most specific categories (last 2-3 in hierarchy)
      final startIndex = hierarchy.length > 3 ? hierarchy.length - 3 : 0;
      for (int i = startIndex; i < hierarchy.length; i++) {
        final cleanCategory = hierarchy[i].replaceFirst(RegExp(r'^[a-z]{2}:'), '');
        if (cleanCategory.isNotEmpty) {
          categories.add(cleanCategory);
        }
      }
      print('🔍 [RecommendationsService] Using hierarchy categories: $categories');
      return categories;
    }
    
    print('⚠️ [RecommendationsService] No categories hierarchy found');
    return [];
  }

  /// Search for low-sugar alternatives using OpenFoodFacts search API with advanced filtering
  static Future<List<Product>> _searchLowSugarAlternatives(List<String> categories, String unit) async {
    try {
      final searchUrl = _buildAdvancedSearchUrl(categories, unit);
      print('🌐 [RecommendationsService] Advanced search URL: $searchUrl');
      
      final response = await http.get(Uri.parse(searchUrl));
      print('🌐 [RecommendationsService] API response status: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final products = data['products'] as List<dynamic>? ?? [];
        print('🌐 [RecommendationsService] Found ${products.length} products from API');
        
        // Debug: Print first product structure
        if (products.isNotEmpty) {
          print('🌐 [RecommendationsService] First product keys: ${(products.first as Map<String, dynamic>).keys.toList()}');
        }
        
        // Convert to Product objects (API already filtered by sugar content)
        final recommendations = products
            .map((productData) => _convertToProduct(productData))
            .toList();
        
        print('🌐 [RecommendationsService] ${recommendations.length} low-sugar alternatives found');
        return recommendations;
      } else {
        print('❌ [RecommendationsService] API error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('❌ [RecommendationsService] Error searching alternatives: $e');
      return [];
    }
  }

  /// Build search URL with categories hierarchy and sugar filtering
  static String _buildAdvancedSearchUrl(List<String> categories, String unit) {
    final baseUrl = 'https://world.openfoodfacts.org/api/v0/search';
    final threshold = unit.toLowerCase() == 'ml' ? _highSugarThresholdMl : _highSugarThresholdGrams;
    
    final params = <String, String>{
      'page_size': '20',
      'sort_by': 'nutriscore_score', 
      'categories_tags_en': categories.join(','), 
      'sugars_100g': '<=${threshold.toString()}',
      'fields': 'code,product_name,brands,image_url,nutriments,categories_tags,ingredients_tags,selected_images,product_quantity_unit',  // Optimize response
    };
    
    final uri = Uri.parse(baseUrl).replace(queryParameters: params);
    return uri.toString();
  }

  /// Convert OpenFoodFacts API product to Product
  static Product _convertToProduct(Map<String, dynamic> productData) {
    // For search API, the product data is directly in the response, not nested under 'product'
    print('🔍 [RecommendationsService] Converting product data: ${productData.keys.toList()}');
    
    // Extract basic information
    final name = productData['product_name'] ?? productData['product_name_en'] ?? 'Unknown Product';
    final brand = productData['brands'] ?? 'Unknown Brand';
    final barcode = productData['code'] ?? '';
    
    print('🔍 [RecommendationsService] Product: $name, Brand: $brand, Barcode: $barcode');
    
    // Extract image URL with multiple fallbacks
    String imageUrl = '';
    
    // Try selected_images first
    final selectedImages = productData['selected_images'] as Map<String, dynamic>?;
    if (selectedImages != null) {
      final frontImage = selectedImages['front'] as Map<String, dynamic>?;
      if (frontImage != null) {
        final displayImage = frontImage['display'] as Map<String, dynamic>?;
        if (displayImage != null) {
          imageUrl = displayImage.values.first as String? ?? '';
        }
      }
    }
    
    // Fallback to image_url if selected_images is empty
    if (imageUrl.isEmpty) {
      imageUrl = productData['image_url'] as String? ?? '';
    }
    
    print('🔍 [RecommendationsService] Image URL: $imageUrl');
    
    // Extract nutrition information
    final nutriments = productData['nutriments'] as Map<String, dynamic>? ?? {};
    final sugarsPer100gRaw = nutriments['sugars_100g'];
    print('🔍 [RecommendationsService] Raw sugar value: $sugarsPer100gRaw (type: ${sugarsPer100gRaw.runtimeType})');
    final sugarsPer100g = _parseDouble(sugarsPer100gRaw) ?? 0.0;
    final productQuantityUnit = productData['product_quantity_unit'] ?? 'g';
    
    print('🔍 [RecommendationsService] Sugar: ${sugarsPer100g}g/100${productQuantityUnit}');
    
    // Extract categories and ingredients tags
    final categoriesHierarchy = (productData['categories_hierarchy'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList();
    final categoriesTags = (productData['categories_tags'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList();
    final ingredientsTags = (productData['ingredients_tags'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList();
    
    print('🔍 [RecommendationsService] Categories: $categoriesTags');
    print('🔍 [RecommendationsService] Ingredients tags: ${ingredientsTags?.length ?? 0} tags');
    
    return Product(
      code: barcode,
      productName: name,
      brands: brand,
      sugarsPer100g: sugarsPer100g,
      productQuantityUnit: productQuantityUnit,
      imageUrl: imageUrl,
      categoriesHierarchy: categoriesHierarchy,
      categoriesTags: categoriesTags,
      ingredientsTags: ingredientsTags,
      nutriments: nutriments,
    );
  }

  /// Parse double value from various types (int, double, string)
  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      return double.tryParse(value);
    }
    return null;
  }

  /// Sort alternatives by sugar content (API already filtered)
  static List<Product> _filterAndSortAlternatives(
    List<Product> alternatives,
  ) {
    // Sort by lowest sugar content first
    alternatives.sort((a, b) => a.sugarsPer100g.compareTo(b.sugarsPer100g));
    
    // Return top 5 recommendations
    return alternatives.take(5).toList();
  }
}