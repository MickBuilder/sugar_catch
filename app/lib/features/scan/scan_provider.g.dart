// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$openFoodFactsApiHash() => r'166643f837aa71ef5a3eaae64726c4f461eff8fa';

/// See also [openFoodFactsApi].
@ProviderFor(openFoodFactsApi)
final openFoodFactsApiProvider = AutoDisposeProvider<OpenFoodFactsApi>.internal(
  openFoodFactsApi,
  name: r'openFoodFactsApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$openFoodFactsApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OpenFoodFactsApiRef = AutoDisposeProviderRef<OpenFoodFactsApi>;
String _$productByBarcodeHash() => r'1f503ff69f137392842d75242f00220e37af53a3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [productByBarcode].
@ProviderFor(productByBarcode)
const productByBarcodeProvider = ProductByBarcodeFamily();

/// See also [productByBarcode].
class ProductByBarcodeFamily extends Family<AsyncValue<ScanState?>> {
  /// See also [productByBarcode].
  const ProductByBarcodeFamily();

  /// See also [productByBarcode].
  ProductByBarcodeProvider call(String barcode) {
    return ProductByBarcodeProvider(barcode);
  }

  @override
  ProductByBarcodeProvider getProviderOverride(
    covariant ProductByBarcodeProvider provider,
  ) {
    return call(provider.barcode);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productByBarcodeProvider';
}

/// See also [productByBarcode].
class ProductByBarcodeProvider extends AutoDisposeFutureProvider<ScanState?> {
  /// See also [productByBarcode].
  ProductByBarcodeProvider(String barcode)
    : this._internal(
        (ref) => productByBarcode(ref as ProductByBarcodeRef, barcode),
        from: productByBarcodeProvider,
        name: r'productByBarcodeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$productByBarcodeHash,
        dependencies: ProductByBarcodeFamily._dependencies,
        allTransitiveDependencies:
            ProductByBarcodeFamily._allTransitiveDependencies,
        barcode: barcode,
      );

  ProductByBarcodeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.barcode,
  }) : super.internal();

  final String barcode;

  @override
  Override overrideWith(
    FutureOr<ScanState?> Function(ProductByBarcodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductByBarcodeProvider._internal(
        (ref) => create(ref as ProductByBarcodeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        barcode: barcode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ScanState?> createElement() {
    return _ProductByBarcodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductByBarcodeProvider && other.barcode == barcode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, barcode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductByBarcodeRef on AutoDisposeFutureProviderRef<ScanState?> {
  /// The parameter `barcode` of this provider.
  String get barcode;
}

class _ProductByBarcodeProviderElement
    extends AutoDisposeFutureProviderElement<ScanState?>
    with ProductByBarcodeRef {
  _ProductByBarcodeProviderElement(super.provider);

  @override
  String get barcode => (origin as ProductByBarcodeProvider).barcode;
}

String _$scanNotifierHash() => r'3ba66d7766b8ad491ac7fa26c422a391b47b97f6';

/// See also [ScanNotifier].
@ProviderFor(ScanNotifier)
final scanNotifierProvider =
    NotifierProvider<ScanNotifier, ScanState?>.internal(
      ScanNotifier.new,
      name: r'scanNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$scanNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ScanNotifier = Notifier<ScanState?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
