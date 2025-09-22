// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProgressStatistics _$ProgressStatisticsFromJson(Map<String, dynamic> json) {
  return _ProgressStatistics.fromJson(json);
}

/// @nodoc
mixin _$ProgressStatistics {
  int get currentStreak => throw _privateConstructorUsedError;
  int get bestStreak => throw _privateConstructorUsedError;
  double get averageDailyIntake => throw _privateConstructorUsedError;
  double get totalSugarIntake => throw _privateConstructorUsedError;
  double get lastPeriodChange => throw _privateConstructorUsedError;
  String get lastPeriodLabel => throw _privateConstructorUsedError;

  /// Serializes this ProgressStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProgressStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgressStatisticsCopyWith<ProgressStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressStatisticsCopyWith<$Res> {
  factory $ProgressStatisticsCopyWith(
    ProgressStatistics value,
    $Res Function(ProgressStatistics) then,
  ) = _$ProgressStatisticsCopyWithImpl<$Res, ProgressStatistics>;
  @useResult
  $Res call({
    int currentStreak,
    int bestStreak,
    double averageDailyIntake,
    double totalSugarIntake,
    double lastPeriodChange,
    String lastPeriodLabel,
  });
}

/// @nodoc
class _$ProgressStatisticsCopyWithImpl<$Res, $Val extends ProgressStatistics>
    implements $ProgressStatisticsCopyWith<$Res> {
  _$ProgressStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgressStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStreak = null,
    Object? bestStreak = null,
    Object? averageDailyIntake = null,
    Object? totalSugarIntake = null,
    Object? lastPeriodChange = null,
    Object? lastPeriodLabel = null,
  }) {
    return _then(
      _value.copyWith(
            currentStreak: null == currentStreak
                ? _value.currentStreak
                : currentStreak // ignore: cast_nullable_to_non_nullable
                      as int,
            bestStreak: null == bestStreak
                ? _value.bestStreak
                : bestStreak // ignore: cast_nullable_to_non_nullable
                      as int,
            averageDailyIntake: null == averageDailyIntake
                ? _value.averageDailyIntake
                : averageDailyIntake // ignore: cast_nullable_to_non_nullable
                      as double,
            totalSugarIntake: null == totalSugarIntake
                ? _value.totalSugarIntake
                : totalSugarIntake // ignore: cast_nullable_to_non_nullable
                      as double,
            lastPeriodChange: null == lastPeriodChange
                ? _value.lastPeriodChange
                : lastPeriodChange // ignore: cast_nullable_to_non_nullable
                      as double,
            lastPeriodLabel: null == lastPeriodLabel
                ? _value.lastPeriodLabel
                : lastPeriodLabel // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProgressStatisticsImplCopyWith<$Res>
    implements $ProgressStatisticsCopyWith<$Res> {
  factory _$$ProgressStatisticsImplCopyWith(
    _$ProgressStatisticsImpl value,
    $Res Function(_$ProgressStatisticsImpl) then,
  ) = __$$ProgressStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int currentStreak,
    int bestStreak,
    double averageDailyIntake,
    double totalSugarIntake,
    double lastPeriodChange,
    String lastPeriodLabel,
  });
}

/// @nodoc
class __$$ProgressStatisticsImplCopyWithImpl<$Res>
    extends _$ProgressStatisticsCopyWithImpl<$Res, _$ProgressStatisticsImpl>
    implements _$$ProgressStatisticsImplCopyWith<$Res> {
  __$$ProgressStatisticsImplCopyWithImpl(
    _$ProgressStatisticsImpl _value,
    $Res Function(_$ProgressStatisticsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProgressStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStreak = null,
    Object? bestStreak = null,
    Object? averageDailyIntake = null,
    Object? totalSugarIntake = null,
    Object? lastPeriodChange = null,
    Object? lastPeriodLabel = null,
  }) {
    return _then(
      _$ProgressStatisticsImpl(
        currentStreak: null == currentStreak
            ? _value.currentStreak
            : currentStreak // ignore: cast_nullable_to_non_nullable
                  as int,
        bestStreak: null == bestStreak
            ? _value.bestStreak
            : bestStreak // ignore: cast_nullable_to_non_nullable
                  as int,
        averageDailyIntake: null == averageDailyIntake
            ? _value.averageDailyIntake
            : averageDailyIntake // ignore: cast_nullable_to_non_nullable
                  as double,
        totalSugarIntake: null == totalSugarIntake
            ? _value.totalSugarIntake
            : totalSugarIntake // ignore: cast_nullable_to_non_nullable
                  as double,
        lastPeriodChange: null == lastPeriodChange
            ? _value.lastPeriodChange
            : lastPeriodChange // ignore: cast_nullable_to_non_nullable
                  as double,
        lastPeriodLabel: null == lastPeriodLabel
            ? _value.lastPeriodLabel
            : lastPeriodLabel // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgressStatisticsImpl implements _ProgressStatistics {
  const _$ProgressStatisticsImpl({
    required this.currentStreak,
    required this.bestStreak,
    required this.averageDailyIntake,
    required this.totalSugarIntake,
    required this.lastPeriodChange,
    required this.lastPeriodLabel,
  });

  factory _$ProgressStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressStatisticsImplFromJson(json);

  @override
  final int currentStreak;
  @override
  final int bestStreak;
  @override
  final double averageDailyIntake;
  @override
  final double totalSugarIntake;
  @override
  final double lastPeriodChange;
  @override
  final String lastPeriodLabel;

  @override
  String toString() {
    return 'ProgressStatistics(currentStreak: $currentStreak, bestStreak: $bestStreak, averageDailyIntake: $averageDailyIntake, totalSugarIntake: $totalSugarIntake, lastPeriodChange: $lastPeriodChange, lastPeriodLabel: $lastPeriodLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressStatisticsImpl &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.bestStreak, bestStreak) ||
                other.bestStreak == bestStreak) &&
            (identical(other.averageDailyIntake, averageDailyIntake) ||
                other.averageDailyIntake == averageDailyIntake) &&
            (identical(other.totalSugarIntake, totalSugarIntake) ||
                other.totalSugarIntake == totalSugarIntake) &&
            (identical(other.lastPeriodChange, lastPeriodChange) ||
                other.lastPeriodChange == lastPeriodChange) &&
            (identical(other.lastPeriodLabel, lastPeriodLabel) ||
                other.lastPeriodLabel == lastPeriodLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentStreak,
    bestStreak,
    averageDailyIntake,
    totalSugarIntake,
    lastPeriodChange,
    lastPeriodLabel,
  );

  /// Create a copy of ProgressStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressStatisticsImplCopyWith<_$ProgressStatisticsImpl> get copyWith =>
      __$$ProgressStatisticsImplCopyWithImpl<_$ProgressStatisticsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressStatisticsImplToJson(this);
  }
}

abstract class _ProgressStatistics implements ProgressStatistics {
  const factory _ProgressStatistics({
    required final int currentStreak,
    required final int bestStreak,
    required final double averageDailyIntake,
    required final double totalSugarIntake,
    required final double lastPeriodChange,
    required final String lastPeriodLabel,
  }) = _$ProgressStatisticsImpl;

  factory _ProgressStatistics.fromJson(Map<String, dynamic> json) =
      _$ProgressStatisticsImpl.fromJson;

  @override
  int get currentStreak;
  @override
  int get bestStreak;
  @override
  double get averageDailyIntake;
  @override
  double get totalSugarIntake;
  @override
  double get lastPeriodChange;
  @override
  String get lastPeriodLabel;

  /// Create a copy of ProgressStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgressStatisticsImplCopyWith<_$ProgressStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Achievement _$AchievementFromJson(Map<String, dynamic> json) {
  return _Achievement.fromJson(json);
}

/// @nodoc
mixin _$Achievement {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get iconPath => throw _privateConstructorUsedError;
  bool get isUnlocked => throw _privateConstructorUsedError;
  DateTime? get unlockedAt => throw _privateConstructorUsedError;
  AchievementType get type => throw _privateConstructorUsedError;
  Map<String, dynamic> get criteria => throw _privateConstructorUsedError;

  /// Serializes this Achievement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementCopyWith<Achievement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementCopyWith<$Res> {
  factory $AchievementCopyWith(
    Achievement value,
    $Res Function(Achievement) then,
  ) = _$AchievementCopyWithImpl<$Res, Achievement>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String iconPath,
    bool isUnlocked,
    DateTime? unlockedAt,
    AchievementType type,
    Map<String, dynamic> criteria,
  });

  $AchievementTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$AchievementCopyWithImpl<$Res, $Val extends Achievement>
    implements $AchievementCopyWith<$Res> {
  _$AchievementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? iconPath = null,
    Object? isUnlocked = null,
    Object? unlockedAt = freezed,
    Object? type = null,
    Object? criteria = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            iconPath: null == iconPath
                ? _value.iconPath
                : iconPath // ignore: cast_nullable_to_non_nullable
                      as String,
            isUnlocked: null == isUnlocked
                ? _value.isUnlocked
                : isUnlocked // ignore: cast_nullable_to_non_nullable
                      as bool,
            unlockedAt: freezed == unlockedAt
                ? _value.unlockedAt
                : unlockedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as AchievementType,
            criteria: null == criteria
                ? _value.criteria
                : criteria // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AchievementTypeCopyWith<$Res> get type {
    return $AchievementTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AchievementImplCopyWith<$Res>
    implements $AchievementCopyWith<$Res> {
  factory _$$AchievementImplCopyWith(
    _$AchievementImpl value,
    $Res Function(_$AchievementImpl) then,
  ) = __$$AchievementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String iconPath,
    bool isUnlocked,
    DateTime? unlockedAt,
    AchievementType type,
    Map<String, dynamic> criteria,
  });

  @override
  $AchievementTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$$AchievementImplCopyWithImpl<$Res>
    extends _$AchievementCopyWithImpl<$Res, _$AchievementImpl>
    implements _$$AchievementImplCopyWith<$Res> {
  __$$AchievementImplCopyWithImpl(
    _$AchievementImpl _value,
    $Res Function(_$AchievementImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? iconPath = null,
    Object? isUnlocked = null,
    Object? unlockedAt = freezed,
    Object? type = null,
    Object? criteria = null,
  }) {
    return _then(
      _$AchievementImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        iconPath: null == iconPath
            ? _value.iconPath
            : iconPath // ignore: cast_nullable_to_non_nullable
                  as String,
        isUnlocked: null == isUnlocked
            ? _value.isUnlocked
            : isUnlocked // ignore: cast_nullable_to_non_nullable
                  as bool,
        unlockedAt: freezed == unlockedAt
            ? _value.unlockedAt
            : unlockedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as AchievementType,
        criteria: null == criteria
            ? _value._criteria
            : criteria // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AchievementImpl implements _Achievement {
  const _$AchievementImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.isUnlocked,
    required this.unlockedAt,
    required this.type,
    required final Map<String, dynamic> criteria,
  }) : _criteria = criteria;

  factory _$AchievementImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchievementImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String iconPath;
  @override
  final bool isUnlocked;
  @override
  final DateTime? unlockedAt;
  @override
  final AchievementType type;
  final Map<String, dynamic> _criteria;
  @override
  Map<String, dynamic> get criteria {
    if (_criteria is EqualUnmodifiableMapView) return _criteria;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_criteria);
  }

  @override
  String toString() {
    return 'Achievement(id: $id, title: $title, description: $description, iconPath: $iconPath, isUnlocked: $isUnlocked, unlockedAt: $unlockedAt, type: $type, criteria: $criteria)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath) &&
            (identical(other.isUnlocked, isUnlocked) ||
                other.isUnlocked == isUnlocked) &&
            (identical(other.unlockedAt, unlockedAt) ||
                other.unlockedAt == unlockedAt) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._criteria, _criteria));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    iconPath,
    isUnlocked,
    unlockedAt,
    type,
    const DeepCollectionEquality().hash(_criteria),
  );

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementImplCopyWith<_$AchievementImpl> get copyWith =>
      __$$AchievementImplCopyWithImpl<_$AchievementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementImplToJson(this);
  }
}

abstract class _Achievement implements Achievement {
  const factory _Achievement({
    required final String id,
    required final String title,
    required final String description,
    required final String iconPath,
    required final bool isUnlocked,
    required final DateTime? unlockedAt,
    required final AchievementType type,
    required final Map<String, dynamic> criteria,
  }) = _$AchievementImpl;

  factory _Achievement.fromJson(Map<String, dynamic> json) =
      _$AchievementImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get iconPath;
  @override
  bool get isUnlocked;
  @override
  DateTime? get unlockedAt;
  @override
  AchievementType get type;
  @override
  Map<String, dynamic> get criteria;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementImplCopyWith<_$AchievementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AchievementType _$AchievementTypeFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'sugarFreeWeek':
      return _SugarFreeWeek.fromJson(json);
    case 'itemsScanned':
      return _ItemsScanned.fromJson(json);
    case 'streak':
      return _Streak.fromJson(json);
    case 'lowSugarDay':
      return _LowSugarDay.fromJson(json);
    case 'goalReached':
      return _GoalReached.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'AchievementType',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$AchievementType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sugarFreeWeek,
    required TResult Function(int count) itemsScanned,
    required TResult Function(int days) streak,
    required TResult Function() lowSugarDay,
    required TResult Function() goalReached,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sugarFreeWeek,
    TResult? Function(int count)? itemsScanned,
    TResult? Function(int days)? streak,
    TResult? Function()? lowSugarDay,
    TResult? Function()? goalReached,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sugarFreeWeek,
    TResult Function(int count)? itemsScanned,
    TResult Function(int days)? streak,
    TResult Function()? lowSugarDay,
    TResult Function()? goalReached,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SugarFreeWeek value) sugarFreeWeek,
    required TResult Function(_ItemsScanned value) itemsScanned,
    required TResult Function(_Streak value) streak,
    required TResult Function(_LowSugarDay value) lowSugarDay,
    required TResult Function(_GoalReached value) goalReached,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SugarFreeWeek value)? sugarFreeWeek,
    TResult? Function(_ItemsScanned value)? itemsScanned,
    TResult? Function(_Streak value)? streak,
    TResult? Function(_LowSugarDay value)? lowSugarDay,
    TResult? Function(_GoalReached value)? goalReached,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SugarFreeWeek value)? sugarFreeWeek,
    TResult Function(_ItemsScanned value)? itemsScanned,
    TResult Function(_Streak value)? streak,
    TResult Function(_LowSugarDay value)? lowSugarDay,
    TResult Function(_GoalReached value)? goalReached,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this AchievementType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementTypeCopyWith<$Res> {
  factory $AchievementTypeCopyWith(
    AchievementType value,
    $Res Function(AchievementType) then,
  ) = _$AchievementTypeCopyWithImpl<$Res, AchievementType>;
}

/// @nodoc
class _$AchievementTypeCopyWithImpl<$Res, $Val extends AchievementType>
    implements $AchievementTypeCopyWith<$Res> {
  _$AchievementTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AchievementType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SugarFreeWeekImplCopyWith<$Res> {
  factory _$$SugarFreeWeekImplCopyWith(
    _$SugarFreeWeekImpl value,
    $Res Function(_$SugarFreeWeekImpl) then,
  ) = __$$SugarFreeWeekImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SugarFreeWeekImplCopyWithImpl<$Res>
    extends _$AchievementTypeCopyWithImpl<$Res, _$SugarFreeWeekImpl>
    implements _$$SugarFreeWeekImplCopyWith<$Res> {
  __$$SugarFreeWeekImplCopyWithImpl(
    _$SugarFreeWeekImpl _value,
    $Res Function(_$SugarFreeWeekImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AchievementType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$SugarFreeWeekImpl implements _SugarFreeWeek {
  const _$SugarFreeWeekImpl({final String? $type})
    : $type = $type ?? 'sugarFreeWeek';

  factory _$SugarFreeWeekImpl.fromJson(Map<String, dynamic> json) =>
      _$$SugarFreeWeekImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AchievementType.sugarFreeWeek()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SugarFreeWeekImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sugarFreeWeek,
    required TResult Function(int count) itemsScanned,
    required TResult Function(int days) streak,
    required TResult Function() lowSugarDay,
    required TResult Function() goalReached,
  }) {
    return sugarFreeWeek();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sugarFreeWeek,
    TResult? Function(int count)? itemsScanned,
    TResult? Function(int days)? streak,
    TResult? Function()? lowSugarDay,
    TResult? Function()? goalReached,
  }) {
    return sugarFreeWeek?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sugarFreeWeek,
    TResult Function(int count)? itemsScanned,
    TResult Function(int days)? streak,
    TResult Function()? lowSugarDay,
    TResult Function()? goalReached,
    required TResult orElse(),
  }) {
    if (sugarFreeWeek != null) {
      return sugarFreeWeek();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SugarFreeWeek value) sugarFreeWeek,
    required TResult Function(_ItemsScanned value) itemsScanned,
    required TResult Function(_Streak value) streak,
    required TResult Function(_LowSugarDay value) lowSugarDay,
    required TResult Function(_GoalReached value) goalReached,
  }) {
    return sugarFreeWeek(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SugarFreeWeek value)? sugarFreeWeek,
    TResult? Function(_ItemsScanned value)? itemsScanned,
    TResult? Function(_Streak value)? streak,
    TResult? Function(_LowSugarDay value)? lowSugarDay,
    TResult? Function(_GoalReached value)? goalReached,
  }) {
    return sugarFreeWeek?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SugarFreeWeek value)? sugarFreeWeek,
    TResult Function(_ItemsScanned value)? itemsScanned,
    TResult Function(_Streak value)? streak,
    TResult Function(_LowSugarDay value)? lowSugarDay,
    TResult Function(_GoalReached value)? goalReached,
    required TResult orElse(),
  }) {
    if (sugarFreeWeek != null) {
      return sugarFreeWeek(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SugarFreeWeekImplToJson(this);
  }
}

abstract class _SugarFreeWeek implements AchievementType {
  const factory _SugarFreeWeek() = _$SugarFreeWeekImpl;

  factory _SugarFreeWeek.fromJson(Map<String, dynamic> json) =
      _$SugarFreeWeekImpl.fromJson;
}

/// @nodoc
abstract class _$$ItemsScannedImplCopyWith<$Res> {
  factory _$$ItemsScannedImplCopyWith(
    _$ItemsScannedImpl value,
    $Res Function(_$ItemsScannedImpl) then,
  ) = __$$ItemsScannedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$ItemsScannedImplCopyWithImpl<$Res>
    extends _$AchievementTypeCopyWithImpl<$Res, _$ItemsScannedImpl>
    implements _$$ItemsScannedImplCopyWith<$Res> {
  __$$ItemsScannedImplCopyWithImpl(
    _$ItemsScannedImpl _value,
    $Res Function(_$ItemsScannedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AchievementType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? count = null}) {
    return _then(
      _$ItemsScannedImpl(
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemsScannedImpl implements _ItemsScanned {
  const _$ItemsScannedImpl({required this.count, final String? $type})
    : $type = $type ?? 'itemsScanned';

  factory _$ItemsScannedImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemsScannedImplFromJson(json);

  @override
  final int count;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AchievementType.itemsScanned(count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemsScannedImpl &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count);

  /// Create a copy of AchievementType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemsScannedImplCopyWith<_$ItemsScannedImpl> get copyWith =>
      __$$ItemsScannedImplCopyWithImpl<_$ItemsScannedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sugarFreeWeek,
    required TResult Function(int count) itemsScanned,
    required TResult Function(int days) streak,
    required TResult Function() lowSugarDay,
    required TResult Function() goalReached,
  }) {
    return itemsScanned(count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sugarFreeWeek,
    TResult? Function(int count)? itemsScanned,
    TResult? Function(int days)? streak,
    TResult? Function()? lowSugarDay,
    TResult? Function()? goalReached,
  }) {
    return itemsScanned?.call(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sugarFreeWeek,
    TResult Function(int count)? itemsScanned,
    TResult Function(int days)? streak,
    TResult Function()? lowSugarDay,
    TResult Function()? goalReached,
    required TResult orElse(),
  }) {
    if (itemsScanned != null) {
      return itemsScanned(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SugarFreeWeek value) sugarFreeWeek,
    required TResult Function(_ItemsScanned value) itemsScanned,
    required TResult Function(_Streak value) streak,
    required TResult Function(_LowSugarDay value) lowSugarDay,
    required TResult Function(_GoalReached value) goalReached,
  }) {
    return itemsScanned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SugarFreeWeek value)? sugarFreeWeek,
    TResult? Function(_ItemsScanned value)? itemsScanned,
    TResult? Function(_Streak value)? streak,
    TResult? Function(_LowSugarDay value)? lowSugarDay,
    TResult? Function(_GoalReached value)? goalReached,
  }) {
    return itemsScanned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SugarFreeWeek value)? sugarFreeWeek,
    TResult Function(_ItemsScanned value)? itemsScanned,
    TResult Function(_Streak value)? streak,
    TResult Function(_LowSugarDay value)? lowSugarDay,
    TResult Function(_GoalReached value)? goalReached,
    required TResult orElse(),
  }) {
    if (itemsScanned != null) {
      return itemsScanned(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemsScannedImplToJson(this);
  }
}

abstract class _ItemsScanned implements AchievementType {
  const factory _ItemsScanned({required final int count}) = _$ItemsScannedImpl;

  factory _ItemsScanned.fromJson(Map<String, dynamic> json) =
      _$ItemsScannedImpl.fromJson;

  int get count;

  /// Create a copy of AchievementType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemsScannedImplCopyWith<_$ItemsScannedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StreakImplCopyWith<$Res> {
  factory _$$StreakImplCopyWith(
    _$StreakImpl value,
    $Res Function(_$StreakImpl) then,
  ) = __$$StreakImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int days});
}

/// @nodoc
class __$$StreakImplCopyWithImpl<$Res>
    extends _$AchievementTypeCopyWithImpl<$Res, _$StreakImpl>
    implements _$$StreakImplCopyWith<$Res> {
  __$$StreakImplCopyWithImpl(
    _$StreakImpl _value,
    $Res Function(_$StreakImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AchievementType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? days = null}) {
    return _then(
      _$StreakImpl(
        days: null == days
            ? _value.days
            : days // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StreakImpl implements _Streak {
  const _$StreakImpl({required this.days, final String? $type})
    : $type = $type ?? 'streak';

  factory _$StreakImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreakImplFromJson(json);

  @override
  final int days;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AchievementType.streak(days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakImpl &&
            (identical(other.days, days) || other.days == days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, days);

  /// Create a copy of AchievementType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakImplCopyWith<_$StreakImpl> get copyWith =>
      __$$StreakImplCopyWithImpl<_$StreakImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sugarFreeWeek,
    required TResult Function(int count) itemsScanned,
    required TResult Function(int days) streak,
    required TResult Function() lowSugarDay,
    required TResult Function() goalReached,
  }) {
    return streak(days);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sugarFreeWeek,
    TResult? Function(int count)? itemsScanned,
    TResult? Function(int days)? streak,
    TResult? Function()? lowSugarDay,
    TResult? Function()? goalReached,
  }) {
    return streak?.call(days);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sugarFreeWeek,
    TResult Function(int count)? itemsScanned,
    TResult Function(int days)? streak,
    TResult Function()? lowSugarDay,
    TResult Function()? goalReached,
    required TResult orElse(),
  }) {
    if (streak != null) {
      return streak(days);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SugarFreeWeek value) sugarFreeWeek,
    required TResult Function(_ItemsScanned value) itemsScanned,
    required TResult Function(_Streak value) streak,
    required TResult Function(_LowSugarDay value) lowSugarDay,
    required TResult Function(_GoalReached value) goalReached,
  }) {
    return streak(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SugarFreeWeek value)? sugarFreeWeek,
    TResult? Function(_ItemsScanned value)? itemsScanned,
    TResult? Function(_Streak value)? streak,
    TResult? Function(_LowSugarDay value)? lowSugarDay,
    TResult? Function(_GoalReached value)? goalReached,
  }) {
    return streak?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SugarFreeWeek value)? sugarFreeWeek,
    TResult Function(_ItemsScanned value)? itemsScanned,
    TResult Function(_Streak value)? streak,
    TResult Function(_LowSugarDay value)? lowSugarDay,
    TResult Function(_GoalReached value)? goalReached,
    required TResult orElse(),
  }) {
    if (streak != null) {
      return streak(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StreakImplToJson(this);
  }
}

abstract class _Streak implements AchievementType {
  const factory _Streak({required final int days}) = _$StreakImpl;

  factory _Streak.fromJson(Map<String, dynamic> json) = _$StreakImpl.fromJson;

  int get days;

  /// Create a copy of AchievementType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreakImplCopyWith<_$StreakImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LowSugarDayImplCopyWith<$Res> {
  factory _$$LowSugarDayImplCopyWith(
    _$LowSugarDayImpl value,
    $Res Function(_$LowSugarDayImpl) then,
  ) = __$$LowSugarDayImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LowSugarDayImplCopyWithImpl<$Res>
    extends _$AchievementTypeCopyWithImpl<$Res, _$LowSugarDayImpl>
    implements _$$LowSugarDayImplCopyWith<$Res> {
  __$$LowSugarDayImplCopyWithImpl(
    _$LowSugarDayImpl _value,
    $Res Function(_$LowSugarDayImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AchievementType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$LowSugarDayImpl implements _LowSugarDay {
  const _$LowSugarDayImpl({final String? $type})
    : $type = $type ?? 'lowSugarDay';

  factory _$LowSugarDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$LowSugarDayImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AchievementType.lowSugarDay()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LowSugarDayImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sugarFreeWeek,
    required TResult Function(int count) itemsScanned,
    required TResult Function(int days) streak,
    required TResult Function() lowSugarDay,
    required TResult Function() goalReached,
  }) {
    return lowSugarDay();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sugarFreeWeek,
    TResult? Function(int count)? itemsScanned,
    TResult? Function(int days)? streak,
    TResult? Function()? lowSugarDay,
    TResult? Function()? goalReached,
  }) {
    return lowSugarDay?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sugarFreeWeek,
    TResult Function(int count)? itemsScanned,
    TResult Function(int days)? streak,
    TResult Function()? lowSugarDay,
    TResult Function()? goalReached,
    required TResult orElse(),
  }) {
    if (lowSugarDay != null) {
      return lowSugarDay();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SugarFreeWeek value) sugarFreeWeek,
    required TResult Function(_ItemsScanned value) itemsScanned,
    required TResult Function(_Streak value) streak,
    required TResult Function(_LowSugarDay value) lowSugarDay,
    required TResult Function(_GoalReached value) goalReached,
  }) {
    return lowSugarDay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SugarFreeWeek value)? sugarFreeWeek,
    TResult? Function(_ItemsScanned value)? itemsScanned,
    TResult? Function(_Streak value)? streak,
    TResult? Function(_LowSugarDay value)? lowSugarDay,
    TResult? Function(_GoalReached value)? goalReached,
  }) {
    return lowSugarDay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SugarFreeWeek value)? sugarFreeWeek,
    TResult Function(_ItemsScanned value)? itemsScanned,
    TResult Function(_Streak value)? streak,
    TResult Function(_LowSugarDay value)? lowSugarDay,
    TResult Function(_GoalReached value)? goalReached,
    required TResult orElse(),
  }) {
    if (lowSugarDay != null) {
      return lowSugarDay(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LowSugarDayImplToJson(this);
  }
}

abstract class _LowSugarDay implements AchievementType {
  const factory _LowSugarDay() = _$LowSugarDayImpl;

  factory _LowSugarDay.fromJson(Map<String, dynamic> json) =
      _$LowSugarDayImpl.fromJson;
}

/// @nodoc
abstract class _$$GoalReachedImplCopyWith<$Res> {
  factory _$$GoalReachedImplCopyWith(
    _$GoalReachedImpl value,
    $Res Function(_$GoalReachedImpl) then,
  ) = __$$GoalReachedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoalReachedImplCopyWithImpl<$Res>
    extends _$AchievementTypeCopyWithImpl<$Res, _$GoalReachedImpl>
    implements _$$GoalReachedImplCopyWith<$Res> {
  __$$GoalReachedImplCopyWithImpl(
    _$GoalReachedImpl _value,
    $Res Function(_$GoalReachedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AchievementType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$GoalReachedImpl implements _GoalReached {
  const _$GoalReachedImpl({final String? $type})
    : $type = $type ?? 'goalReached';

  factory _$GoalReachedImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalReachedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AchievementType.goalReached()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoalReachedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sugarFreeWeek,
    required TResult Function(int count) itemsScanned,
    required TResult Function(int days) streak,
    required TResult Function() lowSugarDay,
    required TResult Function() goalReached,
  }) {
    return goalReached();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sugarFreeWeek,
    TResult? Function(int count)? itemsScanned,
    TResult? Function(int days)? streak,
    TResult? Function()? lowSugarDay,
    TResult? Function()? goalReached,
  }) {
    return goalReached?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sugarFreeWeek,
    TResult Function(int count)? itemsScanned,
    TResult Function(int days)? streak,
    TResult Function()? lowSugarDay,
    TResult Function()? goalReached,
    required TResult orElse(),
  }) {
    if (goalReached != null) {
      return goalReached();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SugarFreeWeek value) sugarFreeWeek,
    required TResult Function(_ItemsScanned value) itemsScanned,
    required TResult Function(_Streak value) streak,
    required TResult Function(_LowSugarDay value) lowSugarDay,
    required TResult Function(_GoalReached value) goalReached,
  }) {
    return goalReached(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SugarFreeWeek value)? sugarFreeWeek,
    TResult? Function(_ItemsScanned value)? itemsScanned,
    TResult? Function(_Streak value)? streak,
    TResult? Function(_LowSugarDay value)? lowSugarDay,
    TResult? Function(_GoalReached value)? goalReached,
  }) {
    return goalReached?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SugarFreeWeek value)? sugarFreeWeek,
    TResult Function(_ItemsScanned value)? itemsScanned,
    TResult Function(_Streak value)? streak,
    TResult Function(_LowSugarDay value)? lowSugarDay,
    TResult Function(_GoalReached value)? goalReached,
    required TResult orElse(),
  }) {
    if (goalReached != null) {
      return goalReached(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalReachedImplToJson(this);
  }
}

abstract class _GoalReached implements AchievementType {
  const factory _GoalReached() = _$GoalReachedImpl;

  factory _GoalReached.fromJson(Map<String, dynamic> json) =
      _$GoalReachedImpl.fromJson;
}

ConsumptionDataPoint _$ConsumptionDataPointFromJson(Map<String, dynamic> json) {
  return _ConsumptionDataPoint.fromJson(json);
}

/// @nodoc
mixin _$ConsumptionDataPoint {
  DateTime get date => throw _privateConstructorUsedError;
  double get sugarAmount => throw _privateConstructorUsedError;
  String get periodLabel => throw _privateConstructorUsedError;

  /// Serializes this ConsumptionDataPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsumptionDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsumptionDataPointCopyWith<ConsumptionDataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumptionDataPointCopyWith<$Res> {
  factory $ConsumptionDataPointCopyWith(
    ConsumptionDataPoint value,
    $Res Function(ConsumptionDataPoint) then,
  ) = _$ConsumptionDataPointCopyWithImpl<$Res, ConsumptionDataPoint>;
  @useResult
  $Res call({DateTime date, double sugarAmount, String periodLabel});
}

/// @nodoc
class _$ConsumptionDataPointCopyWithImpl<
  $Res,
  $Val extends ConsumptionDataPoint
>
    implements $ConsumptionDataPointCopyWith<$Res> {
  _$ConsumptionDataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsumptionDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? sugarAmount = null,
    Object? periodLabel = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            sugarAmount: null == sugarAmount
                ? _value.sugarAmount
                : sugarAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            periodLabel: null == periodLabel
                ? _value.periodLabel
                : periodLabel // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConsumptionDataPointImplCopyWith<$Res>
    implements $ConsumptionDataPointCopyWith<$Res> {
  factory _$$ConsumptionDataPointImplCopyWith(
    _$ConsumptionDataPointImpl value,
    $Res Function(_$ConsumptionDataPointImpl) then,
  ) = __$$ConsumptionDataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double sugarAmount, String periodLabel});
}

/// @nodoc
class __$$ConsumptionDataPointImplCopyWithImpl<$Res>
    extends _$ConsumptionDataPointCopyWithImpl<$Res, _$ConsumptionDataPointImpl>
    implements _$$ConsumptionDataPointImplCopyWith<$Res> {
  __$$ConsumptionDataPointImplCopyWithImpl(
    _$ConsumptionDataPointImpl _value,
    $Res Function(_$ConsumptionDataPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConsumptionDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? sugarAmount = null,
    Object? periodLabel = null,
  }) {
    return _then(
      _$ConsumptionDataPointImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        sugarAmount: null == sugarAmount
            ? _value.sugarAmount
            : sugarAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        periodLabel: null == periodLabel
            ? _value.periodLabel
            : periodLabel // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsumptionDataPointImpl implements _ConsumptionDataPoint {
  const _$ConsumptionDataPointImpl({
    required this.date,
    required this.sugarAmount,
    required this.periodLabel,
  });

  factory _$ConsumptionDataPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsumptionDataPointImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double sugarAmount;
  @override
  final String periodLabel;

  @override
  String toString() {
    return 'ConsumptionDataPoint(date: $date, sugarAmount: $sugarAmount, periodLabel: $periodLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsumptionDataPointImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.sugarAmount, sugarAmount) ||
                other.sugarAmount == sugarAmount) &&
            (identical(other.periodLabel, periodLabel) ||
                other.periodLabel == periodLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, sugarAmount, periodLabel);

  /// Create a copy of ConsumptionDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsumptionDataPointImplCopyWith<_$ConsumptionDataPointImpl>
  get copyWith =>
      __$$ConsumptionDataPointImplCopyWithImpl<_$ConsumptionDataPointImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsumptionDataPointImplToJson(this);
  }
}

abstract class _ConsumptionDataPoint implements ConsumptionDataPoint {
  const factory _ConsumptionDataPoint({
    required final DateTime date,
    required final double sugarAmount,
    required final String periodLabel,
  }) = _$ConsumptionDataPointImpl;

  factory _ConsumptionDataPoint.fromJson(Map<String, dynamic> json) =
      _$ConsumptionDataPointImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get sugarAmount;
  @override
  String get periodLabel;

  /// Create a copy of ConsumptionDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsumptionDataPointImplCopyWith<_$ConsumptionDataPointImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ProgressData _$ProgressDataFromJson(Map<String, dynamic> json) {
  return _ProgressData.fromJson(json);
}

/// @nodoc
mixin _$ProgressData {
  ProgressStatistics get statistics => throw _privateConstructorUsedError;
  List<Achievement> get achievements => throw _privateConstructorUsedError;
  List<ConsumptionDataPoint> get consumptionData =>
      throw _privateConstructorUsedError;
  String get selectedPeriod => throw _privateConstructorUsedError;

  /// Serializes this ProgressData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProgressData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgressDataCopyWith<ProgressData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressDataCopyWith<$Res> {
  factory $ProgressDataCopyWith(
    ProgressData value,
    $Res Function(ProgressData) then,
  ) = _$ProgressDataCopyWithImpl<$Res, ProgressData>;
  @useResult
  $Res call({
    ProgressStatistics statistics,
    List<Achievement> achievements,
    List<ConsumptionDataPoint> consumptionData,
    String selectedPeriod,
  });

  $ProgressStatisticsCopyWith<$Res> get statistics;
}

/// @nodoc
class _$ProgressDataCopyWithImpl<$Res, $Val extends ProgressData>
    implements $ProgressDataCopyWith<$Res> {
  _$ProgressDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgressData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statistics = null,
    Object? achievements = null,
    Object? consumptionData = null,
    Object? selectedPeriod = null,
  }) {
    return _then(
      _value.copyWith(
            statistics: null == statistics
                ? _value.statistics
                : statistics // ignore: cast_nullable_to_non_nullable
                      as ProgressStatistics,
            achievements: null == achievements
                ? _value.achievements
                : achievements // ignore: cast_nullable_to_non_nullable
                      as List<Achievement>,
            consumptionData: null == consumptionData
                ? _value.consumptionData
                : consumptionData // ignore: cast_nullable_to_non_nullable
                      as List<ConsumptionDataPoint>,
            selectedPeriod: null == selectedPeriod
                ? _value.selectedPeriod
                : selectedPeriod // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of ProgressData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProgressStatisticsCopyWith<$Res> get statistics {
    return $ProgressStatisticsCopyWith<$Res>(_value.statistics, (value) {
      return _then(_value.copyWith(statistics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProgressDataImplCopyWith<$Res>
    implements $ProgressDataCopyWith<$Res> {
  factory _$$ProgressDataImplCopyWith(
    _$ProgressDataImpl value,
    $Res Function(_$ProgressDataImpl) then,
  ) = __$$ProgressDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ProgressStatistics statistics,
    List<Achievement> achievements,
    List<ConsumptionDataPoint> consumptionData,
    String selectedPeriod,
  });

  @override
  $ProgressStatisticsCopyWith<$Res> get statistics;
}

/// @nodoc
class __$$ProgressDataImplCopyWithImpl<$Res>
    extends _$ProgressDataCopyWithImpl<$Res, _$ProgressDataImpl>
    implements _$$ProgressDataImplCopyWith<$Res> {
  __$$ProgressDataImplCopyWithImpl(
    _$ProgressDataImpl _value,
    $Res Function(_$ProgressDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProgressData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statistics = null,
    Object? achievements = null,
    Object? consumptionData = null,
    Object? selectedPeriod = null,
  }) {
    return _then(
      _$ProgressDataImpl(
        statistics: null == statistics
            ? _value.statistics
            : statistics // ignore: cast_nullable_to_non_nullable
                  as ProgressStatistics,
        achievements: null == achievements
            ? _value._achievements
            : achievements // ignore: cast_nullable_to_non_nullable
                  as List<Achievement>,
        consumptionData: null == consumptionData
            ? _value._consumptionData
            : consumptionData // ignore: cast_nullable_to_non_nullable
                  as List<ConsumptionDataPoint>,
        selectedPeriod: null == selectedPeriod
            ? _value.selectedPeriod
            : selectedPeriod // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgressDataImpl implements _ProgressData {
  const _$ProgressDataImpl({
    required this.statistics,
    required final List<Achievement> achievements,
    required final List<ConsumptionDataPoint> consumptionData,
    required this.selectedPeriod,
  }) : _achievements = achievements,
       _consumptionData = consumptionData;

  factory _$ProgressDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressDataImplFromJson(json);

  @override
  final ProgressStatistics statistics;
  final List<Achievement> _achievements;
  @override
  List<Achievement> get achievements {
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  final List<ConsumptionDataPoint> _consumptionData;
  @override
  List<ConsumptionDataPoint> get consumptionData {
    if (_consumptionData is EqualUnmodifiableListView) return _consumptionData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_consumptionData);
  }

  @override
  final String selectedPeriod;

  @override
  String toString() {
    return 'ProgressData(statistics: $statistics, achievements: $achievements, consumptionData: $consumptionData, selectedPeriod: $selectedPeriod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressDataImpl &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            const DeepCollectionEquality().equals(
              other._achievements,
              _achievements,
            ) &&
            const DeepCollectionEquality().equals(
              other._consumptionData,
              _consumptionData,
            ) &&
            (identical(other.selectedPeriod, selectedPeriod) ||
                other.selectedPeriod == selectedPeriod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    statistics,
    const DeepCollectionEquality().hash(_achievements),
    const DeepCollectionEquality().hash(_consumptionData),
    selectedPeriod,
  );

  /// Create a copy of ProgressData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressDataImplCopyWith<_$ProgressDataImpl> get copyWith =>
      __$$ProgressDataImplCopyWithImpl<_$ProgressDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressDataImplToJson(this);
  }
}

abstract class _ProgressData implements ProgressData {
  const factory _ProgressData({
    required final ProgressStatistics statistics,
    required final List<Achievement> achievements,
    required final List<ConsumptionDataPoint> consumptionData,
    required final String selectedPeriod,
  }) = _$ProgressDataImpl;

  factory _ProgressData.fromJson(Map<String, dynamic> json) =
      _$ProgressDataImpl.fromJson;

  @override
  ProgressStatistics get statistics;
  @override
  List<Achievement> get achievements;
  @override
  List<ConsumptionDataPoint> get consumptionData;
  @override
  String get selectedPeriod;

  /// Create a copy of ProgressData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgressDataImplCopyWith<_$ProgressDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
