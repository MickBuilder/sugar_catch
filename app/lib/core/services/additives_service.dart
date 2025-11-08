import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AdditivesService {
  static const String _additivesApiUrl = 'https://world.openfoodfacts.org/facets/additives.json';
  static Map<String, String>? _additivesCache;
  static DateTime? _lastFetch;

  // Cache validity: 1 month
  static const Duration _cacheValidity = Duration(days: 30);

  /// Fetches additives data from OpenFoodFacts API and caches it
  static Future<Map<String, String>> _fetchAdditivesData() async {
    try {
      log('🌐 [AdditivesService] Fetching additives data from API...', name: 'Service');
      final response = await http.get(Uri.parse(_additivesApiUrl));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final tags = data['tags'] as List<dynamic>;
        
        final additivesMap = <String, String>{};
        for (final tag in tags) {
          final id = tag['id'] as String;
          final name = tag['name'] as String;
          additivesMap[id] = name;
        }
        
        _additivesCache = additivesMap;
        _lastFetch = DateTime.now();
        
        log('🌐 [AdditivesService] Fetched ${additivesMap.length} additives', name: 'Service');
        return additivesMap;
      } else {
        log('❌ [AdditivesService] Failed to fetch additives: ${response.statusCode}', name: 'Service');
        return _additivesCache ?? {};
      }
    } catch (e) {
      log('❌ [AdditivesService] Error fetching additives: $e', name: 'Service');
      return _additivesCache ?? {};
    }
  }

  /// Gets the official name for an E-code or additive tag
  static Future<String> getAdditiveName(String tag) async {
    // Ensure service is initialized (lazy loading)
    await _ensureInitialized();
    
    // Check if cache is valid
    if (_additivesCache == null || 
        _lastFetch == null || 
        DateTime.now().difference(_lastFetch!) > _cacheValidity) {
      await _fetchAdditivesData();
    }
    
    String parentTag = tag.substring(0,7);

    if (_additivesCache!.containsKey(parentTag)) {
      return _extractNameFromFullName(_additivesCache![parentTag]!);
    }

    return tag.substring(3).toUpperCase();
  }

  /// Extracts just the name part from "E-code - Name" format
  static String _extractNameFromFullName(String fullName) {
    // Handle format like "E330 - Citric acid" -> "Citric acid"
    if (fullName.contains(' - ')) {
      final parts = fullName.split(' - ');
      if (parts.length >= 2) {
        return parts.sublist(1).join(' - '); // Join in case name contains " - "
      }
    }
    return fullName;
  }

  /// Gets multiple additive names at once
  static Future<List<String>> getAdditiveNames(List<String> tags) async {
    // Ensure service is initialized (lazy loading)
    await _ensureInitialized();
    
    final names = <String>[];
    for (final tag in tags) {
      final name = await getAdditiveName(tag);
      if (name.isNotEmpty) {
        names.add(name);
      }
    }
    return names;
  }

  /// Checks if a tag is a sweetener based on the E-code
  static bool isSweetenerTag(String tag) {    
    // Sweetener E-code prefixes
    const sweetenerPrefixes = [
      'e420', 'e421', 'e950', 'e951', 'e952', 'e953', 'e954', 'e955', 'e957', 'e959',
      'e960', 'e961', 'e962', 'e964', 'e965', 'e966', 'e967', 'e968', 'e969'
    ];

    String eCode = tag.substring(3);
    return sweetenerPrefixes.any((prefix) => eCode.contains(prefix));
  }

  static bool _isInitialized = false;

  /// Initializes the service by pre-fetching additives data
  /// This is now called lazily when first needed, not at app startup
  static Future<void> init() async {
    if (_isInitialized) return;
    
    try {
      log('🚀 [AdditivesService] Initializing additives service...', name: 'Service');
      
      // Check if cache is still valid
      if (_additivesCache != null && 
          _lastFetch != null && 
          DateTime.now().difference(_lastFetch!) < _cacheValidity) {
        log('✅ [AdditivesService] Using cached additives data (${_additivesCache!.length} additives)', name: 'Service');
        _isInitialized = true;
        return;
      }
      
      // Pre-fetch additives data in background
      await _fetchAdditivesData();
      _isInitialized = true;
      log('✅ [AdditivesService] Initialization complete', name: 'Service');
    } catch (e) {
      log('⚠️ [AdditivesService] Initialization failed, will fetch on first use: $e', name: 'Service');
      // Don't throw - allow app to continue, will fetch when needed
    }
  }
  
  /// Ensures the service is initialized before use
  static Future<void> _ensureInitialized() async {
    if (!_isInitialized) {
      await init();
    }
  }

  /// Clears the cache (useful for testing or forced refresh)
  static void clearCache() {
    _additivesCache = null;
    _lastFetch = null;
    log('🧹 [AdditivesService] Cache cleared', name: 'Service');
  }
}
