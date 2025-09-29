// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recentHistoryHash() => r'a84adfc4acb36ef19ed7348a582d2f1cfc756705';

/// See also [recentHistory].
@ProviderFor(recentHistory)
final recentHistoryProvider = AutoDisposeProvider<List<HistoryItem>>.internal(
  recentHistory,
  name: r'recentHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recentHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RecentHistoryRef = AutoDisposeProviderRef<List<HistoryItem>>;
String _$logsForLastDaysHash() => r'e9f32437c7ce2816222e2589198261e9783821c3';

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

/// See also [logsForLastDays].
@ProviderFor(logsForLastDays)
const logsForLastDaysProvider = LogsForLastDaysFamily();

/// See also [logsForLastDays].
class LogsForLastDaysFamily extends Family<List<DailyLog>> {
  /// See also [logsForLastDays].
  const LogsForLastDaysFamily();

  /// See also [logsForLastDays].
  LogsForLastDaysProvider call(int days) {
    return LogsForLastDaysProvider(days);
  }

  @override
  LogsForLastDaysProvider getProviderOverride(
    covariant LogsForLastDaysProvider provider,
  ) {
    return call(provider.days);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'logsForLastDaysProvider';
}

/// See also [logsForLastDays].
class LogsForLastDaysProvider extends AutoDisposeProvider<List<DailyLog>> {
  /// See also [logsForLastDays].
  LogsForLastDaysProvider(int days)
    : this._internal(
        (ref) => logsForLastDays(ref as LogsForLastDaysRef, days),
        from: logsForLastDaysProvider,
        name: r'logsForLastDaysProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$logsForLastDaysHash,
        dependencies: LogsForLastDaysFamily._dependencies,
        allTransitiveDependencies:
            LogsForLastDaysFamily._allTransitiveDependencies,
        days: days,
      );

  LogsForLastDaysProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.days,
  }) : super.internal();

  final int days;

  @override
  Override overrideWith(
    List<DailyLog> Function(LogsForLastDaysRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LogsForLastDaysProvider._internal(
        (ref) => create(ref as LogsForLastDaysRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        days: days,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<DailyLog>> createElement() {
    return _LogsForLastDaysProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LogsForLastDaysProvider && other.days == days;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, days.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LogsForLastDaysRef on AutoDisposeProviderRef<List<DailyLog>> {
  /// The parameter `days` of this provider.
  int get days;
}

class _LogsForLastDaysProviderElement
    extends AutoDisposeProviderElement<List<DailyLog>>
    with LogsForLastDaysRef {
  _LogsForLastDaysProviderElement(super.provider);

  @override
  int get days => (origin as LogsForLastDaysProvider).days;
}

String _$weeklySugarTotalHash() => r'cf32c9e9ae547bad1903ff85f865bf673d9f59ee';

/// See also [weeklySugarTotal].
@ProviderFor(weeklySugarTotal)
final weeklySugarTotalProvider = AutoDisposeProvider<double>.internal(
  weeklySugarTotal,
  name: r'weeklySugarTotalProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weeklySugarTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WeeklySugarTotalRef = AutoDisposeProviderRef<double>;
String _$averageDailySugarHash() => r'591288c62757faa21ad6dff2509ae63c7d5ba882';

/// See also [averageDailySugar].
@ProviderFor(averageDailySugar)
const averageDailySugarProvider = AverageDailySugarFamily();

/// See also [averageDailySugar].
class AverageDailySugarFamily extends Family<double> {
  /// See also [averageDailySugar].
  const AverageDailySugarFamily();

  /// See also [averageDailySugar].
  AverageDailySugarProvider call(int days) {
    return AverageDailySugarProvider(days);
  }

  @override
  AverageDailySugarProvider getProviderOverride(
    covariant AverageDailySugarProvider provider,
  ) {
    return call(provider.days);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'averageDailySugarProvider';
}

/// See also [averageDailySugar].
class AverageDailySugarProvider extends AutoDisposeProvider<double> {
  /// See also [averageDailySugar].
  AverageDailySugarProvider(int days)
    : this._internal(
        (ref) => averageDailySugar(ref as AverageDailySugarRef, days),
        from: averageDailySugarProvider,
        name: r'averageDailySugarProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$averageDailySugarHash,
        dependencies: AverageDailySugarFamily._dependencies,
        allTransitiveDependencies:
            AverageDailySugarFamily._allTransitiveDependencies,
        days: days,
      );

  AverageDailySugarProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.days,
  }) : super.internal();

  final int days;

  @override
  Override overrideWith(double Function(AverageDailySugarRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: AverageDailySugarProvider._internal(
        (ref) => create(ref as AverageDailySugarRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        days: days,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<double> createElement() {
    return _AverageDailySugarProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AverageDailySugarProvider && other.days == days;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, days.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AverageDailySugarRef on AutoDisposeProviderRef<double> {
  /// The parameter `days` of this provider.
  int get days;
}

class _AverageDailySugarProviderElement
    extends AutoDisposeProviderElement<double>
    with AverageDailySugarRef {
  _AverageDailySugarProviderElement(super.provider);

  @override
  int get days => (origin as AverageDailySugarProvider).days;
}

String _$trackNotifierHash() => r'6a8fcce89ed6561784a3196d9b8982f2efa458b9';

/// See also [TrackNotifier].
@ProviderFor(TrackNotifier)
final trackNotifierProvider =
    AutoDisposeNotifierProvider<TrackNotifier, DailyLog>.internal(
      TrackNotifier.new,
      name: r'trackNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$trackNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TrackNotifier = AutoDisposeNotifier<DailyLog>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
