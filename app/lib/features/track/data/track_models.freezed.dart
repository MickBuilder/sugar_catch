// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DailyLog _$DailyLogFromJson(Map<String, dynamic> json) {
  return _DailyLog.fromJson(json);
}

/// @nodoc
mixin _$DailyLog {
  DateTime get date => throw _privateConstructorUsedError;
  List<LogEntry> get entries => throw _privateConstructorUsedError;
  double get totalSugar => throw _privateConstructorUsedError;

  /// Serializes this DailyLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyLogCopyWith<DailyLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyLogCopyWith<$Res> {
  factory $DailyLogCopyWith(DailyLog value, $Res Function(DailyLog) then) =
      _$DailyLogCopyWithImpl<$Res, DailyLog>;
  @useResult
  $Res call({DateTime date, List<LogEntry> entries, double totalSugar});
}

/// @nodoc
class _$DailyLogCopyWithImpl<$Res, $Val extends DailyLog>
    implements $DailyLogCopyWith<$Res> {
  _$DailyLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? entries = null,
    Object? totalSugar = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            entries: null == entries
                ? _value.entries
                : entries // ignore: cast_nullable_to_non_nullable
                      as List<LogEntry>,
            totalSugar: null == totalSugar
                ? _value.totalSugar
                : totalSugar // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyLogImplCopyWith<$Res>
    implements $DailyLogCopyWith<$Res> {
  factory _$$DailyLogImplCopyWith(
    _$DailyLogImpl value,
    $Res Function(_$DailyLogImpl) then,
  ) = __$$DailyLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, List<LogEntry> entries, double totalSugar});
}

/// @nodoc
class __$$DailyLogImplCopyWithImpl<$Res>
    extends _$DailyLogCopyWithImpl<$Res, _$DailyLogImpl>
    implements _$$DailyLogImplCopyWith<$Res> {
  __$$DailyLogImplCopyWithImpl(
    _$DailyLogImpl _value,
    $Res Function(_$DailyLogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? entries = null,
    Object? totalSugar = null,
  }) {
    return _then(
      _$DailyLogImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        entries: null == entries
            ? _value._entries
            : entries // ignore: cast_nullable_to_non_nullable
                  as List<LogEntry>,
        totalSugar: null == totalSugar
            ? _value.totalSugar
            : totalSugar // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyLogImpl implements _DailyLog {
  const _$DailyLogImpl({
    required this.date,
    required final List<LogEntry> entries,
    this.totalSugar = 0.0,
  }) : _entries = entries;

  factory _$DailyLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyLogImplFromJson(json);

  @override
  final DateTime date;
  final List<LogEntry> _entries;
  @override
  List<LogEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  @JsonKey()
  final double totalSugar;

  @override
  String toString() {
    return 'DailyLog(date: $date, entries: $entries, totalSugar: $totalSugar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyLogImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            (identical(other.totalSugar, totalSugar) ||
                other.totalSugar == totalSugar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    const DeepCollectionEquality().hash(_entries),
    totalSugar,
  );

  /// Create a copy of DailyLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyLogImplCopyWith<_$DailyLogImpl> get copyWith =>
      __$$DailyLogImplCopyWithImpl<_$DailyLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyLogImplToJson(this);
  }
}

abstract class _DailyLog implements DailyLog {
  const factory _DailyLog({
    required final DateTime date,
    required final List<LogEntry> entries,
    final double totalSugar,
  }) = _$DailyLogImpl;

  factory _DailyLog.fromJson(Map<String, dynamic> json) =
      _$DailyLogImpl.fromJson;

  @override
  DateTime get date;
  @override
  List<LogEntry> get entries;
  @override
  double get totalSugar;

  /// Create a copy of DailyLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyLogImplCopyWith<_$DailyLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LogEntry _$LogEntryFromJson(Map<String, dynamic> json) {
  return _LogEntry.fromJson(json);
}

/// @nodoc
mixin _$LogEntry {
  String get id => throw _privateConstructorUsedError;
  Product get product => throw _privateConstructorUsedError;
  SugarInfo get sugarInfo => throw _privateConstructorUsedError;
  ServingSize get servingSize => throw _privateConstructorUsedError;
  DateTime get loggedAt => throw _privateConstructorUsedError;
  double get totalSugarAmount => throw _privateConstructorUsedError;

  /// Serializes this LogEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LogEntryCopyWith<LogEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogEntryCopyWith<$Res> {
  factory $LogEntryCopyWith(LogEntry value, $Res Function(LogEntry) then) =
      _$LogEntryCopyWithImpl<$Res, LogEntry>;
  @useResult
  $Res call({
    String id,
    Product product,
    SugarInfo sugarInfo,
    ServingSize servingSize,
    DateTime loggedAt,
    double totalSugarAmount,
  });

  $ProductCopyWith<$Res> get product;
  $SugarInfoCopyWith<$Res> get sugarInfo;
  $ServingSizeCopyWith<$Res> get servingSize;
}

/// @nodoc
class _$LogEntryCopyWithImpl<$Res, $Val extends LogEntry>
    implements $LogEntryCopyWith<$Res> {
  _$LogEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LogEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? sugarInfo = null,
    Object? servingSize = null,
    Object? loggedAt = null,
    Object? totalSugarAmount = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            product: null == product
                ? _value.product
                : product // ignore: cast_nullable_to_non_nullable
                      as Product,
            sugarInfo: null == sugarInfo
                ? _value.sugarInfo
                : sugarInfo // ignore: cast_nullable_to_non_nullable
                      as SugarInfo,
            servingSize: null == servingSize
                ? _value.servingSize
                : servingSize // ignore: cast_nullable_to_non_nullable
                      as ServingSize,
            loggedAt: null == loggedAt
                ? _value.loggedAt
                : loggedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            totalSugarAmount: null == totalSugarAmount
                ? _value.totalSugarAmount
                : totalSugarAmount // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }

  /// Create a copy of LogEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  /// Create a copy of LogEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SugarInfoCopyWith<$Res> get sugarInfo {
    return $SugarInfoCopyWith<$Res>(_value.sugarInfo, (value) {
      return _then(_value.copyWith(sugarInfo: value) as $Val);
    });
  }

  /// Create a copy of LogEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServingSizeCopyWith<$Res> get servingSize {
    return $ServingSizeCopyWith<$Res>(_value.servingSize, (value) {
      return _then(_value.copyWith(servingSize: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LogEntryImplCopyWith<$Res>
    implements $LogEntryCopyWith<$Res> {
  factory _$$LogEntryImplCopyWith(
    _$LogEntryImpl value,
    $Res Function(_$LogEntryImpl) then,
  ) = __$$LogEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    Product product,
    SugarInfo sugarInfo,
    ServingSize servingSize,
    DateTime loggedAt,
    double totalSugarAmount,
  });

  @override
  $ProductCopyWith<$Res> get product;
  @override
  $SugarInfoCopyWith<$Res> get sugarInfo;
  @override
  $ServingSizeCopyWith<$Res> get servingSize;
}

/// @nodoc
class __$$LogEntryImplCopyWithImpl<$Res>
    extends _$LogEntryCopyWithImpl<$Res, _$LogEntryImpl>
    implements _$$LogEntryImplCopyWith<$Res> {
  __$$LogEntryImplCopyWithImpl(
    _$LogEntryImpl _value,
    $Res Function(_$LogEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LogEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? sugarInfo = null,
    Object? servingSize = null,
    Object? loggedAt = null,
    Object? totalSugarAmount = null,
  }) {
    return _then(
      _$LogEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        product: null == product
            ? _value.product
            : product // ignore: cast_nullable_to_non_nullable
                  as Product,
        sugarInfo: null == sugarInfo
            ? _value.sugarInfo
            : sugarInfo // ignore: cast_nullable_to_non_nullable
                  as SugarInfo,
        servingSize: null == servingSize
            ? _value.servingSize
            : servingSize // ignore: cast_nullable_to_non_nullable
                  as ServingSize,
        loggedAt: null == loggedAt
            ? _value.loggedAt
            : loggedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        totalSugarAmount: null == totalSugarAmount
            ? _value.totalSugarAmount
            : totalSugarAmount // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LogEntryImpl implements _LogEntry {
  const _$LogEntryImpl({
    required this.id,
    required this.product,
    required this.sugarInfo,
    required this.servingSize,
    required this.loggedAt,
    required this.totalSugarAmount,
  });

  factory _$LogEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogEntryImplFromJson(json);

  @override
  final String id;
  @override
  final Product product;
  @override
  final SugarInfo sugarInfo;
  @override
  final ServingSize servingSize;
  @override
  final DateTime loggedAt;
  @override
  final double totalSugarAmount;

  @override
  String toString() {
    return 'LogEntry(id: $id, product: $product, sugarInfo: $sugarInfo, servingSize: $servingSize, loggedAt: $loggedAt, totalSugarAmount: $totalSugarAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.sugarInfo, sugarInfo) ||
                other.sugarInfo == sugarInfo) &&
            (identical(other.servingSize, servingSize) ||
                other.servingSize == servingSize) &&
            (identical(other.loggedAt, loggedAt) ||
                other.loggedAt == loggedAt) &&
            (identical(other.totalSugarAmount, totalSugarAmount) ||
                other.totalSugarAmount == totalSugarAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    product,
    sugarInfo,
    servingSize,
    loggedAt,
    totalSugarAmount,
  );

  /// Create a copy of LogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogEntryImplCopyWith<_$LogEntryImpl> get copyWith =>
      __$$LogEntryImplCopyWithImpl<_$LogEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogEntryImplToJson(this);
  }
}

abstract class _LogEntry implements LogEntry {
  const factory _LogEntry({
    required final String id,
    required final Product product,
    required final SugarInfo sugarInfo,
    required final ServingSize servingSize,
    required final DateTime loggedAt,
    required final double totalSugarAmount,
  }) = _$LogEntryImpl;

  factory _LogEntry.fromJson(Map<String, dynamic> json) =
      _$LogEntryImpl.fromJson;

  @override
  String get id;
  @override
  Product get product;
  @override
  SugarInfo get sugarInfo;
  @override
  ServingSize get servingSize;
  @override
  DateTime get loggedAt;
  @override
  double get totalSugarAmount;

  /// Create a copy of LogEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogEntryImplCopyWith<_$LogEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServingSize _$ServingSizeFromJson(Map<String, dynamic> json) {
  return _ServingSize.fromJson(json);
}

/// @nodoc
mixin _$ServingSize {
  double get quantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  double get sugarPerServing => throw _privateConstructorUsedError;

  /// Serializes this ServingSize to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServingSize
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServingSizeCopyWith<ServingSize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServingSizeCopyWith<$Res> {
  factory $ServingSizeCopyWith(
    ServingSize value,
    $Res Function(ServingSize) then,
  ) = _$ServingSizeCopyWithImpl<$Res, ServingSize>;
  @useResult
  $Res call({double quantity, String unit, double sugarPerServing});
}

/// @nodoc
class _$ServingSizeCopyWithImpl<$Res, $Val extends ServingSize>
    implements $ServingSizeCopyWith<$Res> {
  _$ServingSizeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServingSize
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? unit = null,
    Object? sugarPerServing = null,
  }) {
    return _then(
      _value.copyWith(
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as double,
            unit: null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String,
            sugarPerServing: null == sugarPerServing
                ? _value.sugarPerServing
                : sugarPerServing // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ServingSizeImplCopyWith<$Res>
    implements $ServingSizeCopyWith<$Res> {
  factory _$$ServingSizeImplCopyWith(
    _$ServingSizeImpl value,
    $Res Function(_$ServingSizeImpl) then,
  ) = __$$ServingSizeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double quantity, String unit, double sugarPerServing});
}

/// @nodoc
class __$$ServingSizeImplCopyWithImpl<$Res>
    extends _$ServingSizeCopyWithImpl<$Res, _$ServingSizeImpl>
    implements _$$ServingSizeImplCopyWith<$Res> {
  __$$ServingSizeImplCopyWithImpl(
    _$ServingSizeImpl _value,
    $Res Function(_$ServingSizeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServingSize
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? unit = null,
    Object? sugarPerServing = null,
  }) {
    return _then(
      _$ServingSizeImpl(
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as double,
        unit: null == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String,
        sugarPerServing: null == sugarPerServing
            ? _value.sugarPerServing
            : sugarPerServing // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ServingSizeImpl implements _ServingSize {
  const _$ServingSizeImpl({
    required this.quantity,
    required this.unit,
    required this.sugarPerServing,
  });

  factory _$ServingSizeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServingSizeImplFromJson(json);

  @override
  final double quantity;
  @override
  final String unit;
  @override
  final double sugarPerServing;

  @override
  String toString() {
    return 'ServingSize(quantity: $quantity, unit: $unit, sugarPerServing: $sugarPerServing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServingSizeImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.sugarPerServing, sugarPerServing) ||
                other.sugarPerServing == sugarPerServing));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, quantity, unit, sugarPerServing);

  /// Create a copy of ServingSize
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServingSizeImplCopyWith<_$ServingSizeImpl> get copyWith =>
      __$$ServingSizeImplCopyWithImpl<_$ServingSizeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServingSizeImplToJson(this);
  }
}

abstract class _ServingSize implements ServingSize {
  const factory _ServingSize({
    required final double quantity,
    required final String unit,
    required final double sugarPerServing,
  }) = _$ServingSizeImpl;

  factory _ServingSize.fromJson(Map<String, dynamic> json) =
      _$ServingSizeImpl.fromJson;

  @override
  double get quantity;
  @override
  String get unit;
  @override
  double get sugarPerServing;

  /// Create a copy of ServingSize
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServingSizeImplCopyWith<_$ServingSizeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
