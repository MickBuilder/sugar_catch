// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$progressStatisticsHash() =>
    r'4eb6cd40eec2bab41ce00815936a82692a0c3c3e';

/// See also [progressStatistics].
@ProviderFor(progressStatistics)
final progressStatisticsProvider =
    AutoDisposeProvider<ProgressStatistics>.internal(
      progressStatistics,
      name: r'progressStatisticsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$progressStatisticsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProgressStatisticsRef = AutoDisposeProviderRef<ProgressStatistics>;
String _$achievementsHash() => r'd76643bb7748ca71cf0c5748764847c1dcf7376a';

/// See also [achievements].
@ProviderFor(achievements)
final achievementsProvider = AutoDisposeProvider<List<Achievement>>.internal(
  achievements,
  name: r'achievementsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$achievementsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AchievementsRef = AutoDisposeProviderRef<List<Achievement>>;
String _$consumptionDataHash() => r'b868142ad945d4c86532f064fe6c3eece4ec2bf4';

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

/// See also [consumptionData].
@ProviderFor(consumptionData)
const consumptionDataProvider = ConsumptionDataFamily();

/// See also [consumptionData].
class ConsumptionDataFamily extends Family<List<ConsumptionDataPoint>> {
  /// See also [consumptionData].
  const ConsumptionDataFamily();

  /// See also [consumptionData].
  ConsumptionDataProvider call(String period) {
    return ConsumptionDataProvider(period);
  }

  @override
  ConsumptionDataProvider getProviderOverride(
    covariant ConsumptionDataProvider provider,
  ) {
    return call(provider.period);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'consumptionDataProvider';
}

/// See also [consumptionData].
class ConsumptionDataProvider
    extends AutoDisposeProvider<List<ConsumptionDataPoint>> {
  /// See also [consumptionData].
  ConsumptionDataProvider(String period)
    : this._internal(
        (ref) => consumptionData(ref as ConsumptionDataRef, period),
        from: consumptionDataProvider,
        name: r'consumptionDataProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$consumptionDataHash,
        dependencies: ConsumptionDataFamily._dependencies,
        allTransitiveDependencies:
            ConsumptionDataFamily._allTransitiveDependencies,
        period: period,
      );

  ConsumptionDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.period,
  }) : super.internal();

  final String period;

  @override
  Override overrideWith(
    List<ConsumptionDataPoint> Function(ConsumptionDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConsumptionDataProvider._internal(
        (ref) => create(ref as ConsumptionDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        period: period,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<ConsumptionDataPoint>> createElement() {
    return _ConsumptionDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConsumptionDataProvider && other.period == period;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConsumptionDataRef on AutoDisposeProviderRef<List<ConsumptionDataPoint>> {
  /// The parameter `period` of this provider.
  String get period;
}

class _ConsumptionDataProviderElement
    extends AutoDisposeProviderElement<List<ConsumptionDataPoint>>
    with ConsumptionDataRef {
  _ConsumptionDataProviderElement(super.provider);

  @override
  String get period => (origin as ConsumptionDataProvider).period;
}

String _$progressNotifierHash() => r'd98952a864f0986030d19da0484c736c999ae394';

/// See also [ProgressNotifier].
@ProviderFor(ProgressNotifier)
final progressNotifierProvider =
    AutoDisposeNotifierProvider<ProgressNotifier, ProgressData>.internal(
      ProgressNotifier.new,
      name: r'progressNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$progressNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProgressNotifier = AutoDisposeNotifier<ProgressData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
