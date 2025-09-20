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
String _$scanNotifierHash() => r'1ad32d2bf6d80dbfedff9456964365ef9db33140';

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
