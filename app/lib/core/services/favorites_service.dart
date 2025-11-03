import 'dart:developer';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:cleanfood/features/scan/data/product_model.dart';

class FavoritesService {
  static const String _favoritesBoxName = 'favorites';
  static Box<String>? _favoritesBox;

  static Future<void> init() async {
    _favoritesBox = await Hive.openBox<String>(_favoritesBoxName);
  }

  /// Add a product to favorites
  static Future<void> addFavorite(Product product) async {
    if (_favoritesBox != null) {
      await _favoritesBox!.put(product.code, product.code);
      log('⭐ [FAVORITES] Added favorite: ${product.productName} (${product.code})', name: 'Favorites');
    }
  }

  /// Remove a product from favorites
  static Future<void> removeFavorite(String barcode) async {
    if (_favoritesBox != null) {
      await _favoritesBox!.delete(barcode);
      log('⭐ [FAVORITES] Removed favorite: $barcode', name: 'Favorites');
    }
  }

  /// Check if a product is favorited
  static bool isFavorite(String barcode) {
    if (_favoritesBox == null) return false;
    return _favoritesBox!.containsKey(barcode);
  }

  /// Toggle favorite status
  static Future<void> toggleFavorite(Product product) async {
    if (isFavorite(product.code)) {
      await removeFavorite(product.code);
    } else {
      await addFavorite(product);
    }
  }

  /// Get all favorite barcodes
  static List<String> getAllFavorites() {
    if (_favoritesBox == null) return [];
    return _favoritesBox!.keys.cast<String>().toList();
  }
}

