// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OnboardingData _$OnboardingDataFromJson(Map<String, dynamic> json) {
  return _OnboardingData.fromJson(json);
}

/// @nodoc
mixin _$OnboardingData {
  SugarGoal get sugarGoal => throw _privateConstructorUsedError;
  List<SugarMotivation> get motivations => throw _privateConstructorUsedError;
  bool get hasCompletedOnboarding => throw _privateConstructorUsedError;

  /// Serializes this OnboardingData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardingDataCopyWith<OnboardingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingDataCopyWith<$Res> {
  factory $OnboardingDataCopyWith(
    OnboardingData value,
    $Res Function(OnboardingData) then,
  ) = _$OnboardingDataCopyWithImpl<$Res, OnboardingData>;
  @useResult
  $Res call({
    SugarGoal sugarGoal,
    List<SugarMotivation> motivations,
    bool hasCompletedOnboarding,
  });
}

/// @nodoc
class _$OnboardingDataCopyWithImpl<$Res, $Val extends OnboardingData>
    implements $OnboardingDataCopyWith<$Res> {
  _$OnboardingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sugarGoal = null,
    Object? motivations = null,
    Object? hasCompletedOnboarding = null,
  }) {
    return _then(
      _value.copyWith(
            sugarGoal: null == sugarGoal
                ? _value.sugarGoal
                : sugarGoal // ignore: cast_nullable_to_non_nullable
                      as SugarGoal,
            motivations: null == motivations
                ? _value.motivations
                : motivations // ignore: cast_nullable_to_non_nullable
                      as List<SugarMotivation>,
            hasCompletedOnboarding: null == hasCompletedOnboarding
                ? _value.hasCompletedOnboarding
                : hasCompletedOnboarding // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OnboardingDataImplCopyWith<$Res>
    implements $OnboardingDataCopyWith<$Res> {
  factory _$$OnboardingDataImplCopyWith(
    _$OnboardingDataImpl value,
    $Res Function(_$OnboardingDataImpl) then,
  ) = __$$OnboardingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    SugarGoal sugarGoal,
    List<SugarMotivation> motivations,
    bool hasCompletedOnboarding,
  });
}

/// @nodoc
class __$$OnboardingDataImplCopyWithImpl<$Res>
    extends _$OnboardingDataCopyWithImpl<$Res, _$OnboardingDataImpl>
    implements _$$OnboardingDataImplCopyWith<$Res> {
  __$$OnboardingDataImplCopyWithImpl(
    _$OnboardingDataImpl _value,
    $Res Function(_$OnboardingDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sugarGoal = null,
    Object? motivations = null,
    Object? hasCompletedOnboarding = null,
  }) {
    return _then(
      _$OnboardingDataImpl(
        sugarGoal: null == sugarGoal
            ? _value.sugarGoal
            : sugarGoal // ignore: cast_nullable_to_non_nullable
                  as SugarGoal,
        motivations: null == motivations
            ? _value._motivations
            : motivations // ignore: cast_nullable_to_non_nullable
                  as List<SugarMotivation>,
        hasCompletedOnboarding: null == hasCompletedOnboarding
            ? _value.hasCompletedOnboarding
            : hasCompletedOnboarding // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OnboardingDataImpl implements _OnboardingData {
  const _$OnboardingDataImpl({
    this.sugarGoal = SugarGoal.moderate,
    final List<SugarMotivation> motivations = const [],
    this.hasCompletedOnboarding = false,
  }) : _motivations = motivations;

  factory _$OnboardingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnboardingDataImplFromJson(json);

  @override
  @JsonKey()
  final SugarGoal sugarGoal;
  final List<SugarMotivation> _motivations;
  @override
  @JsonKey()
  List<SugarMotivation> get motivations {
    if (_motivations is EqualUnmodifiableListView) return _motivations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_motivations);
  }

  @override
  @JsonKey()
  final bool hasCompletedOnboarding;

  @override
  String toString() {
    return 'OnboardingData(sugarGoal: $sugarGoal, motivations: $motivations, hasCompletedOnboarding: $hasCompletedOnboarding)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingDataImpl &&
            (identical(other.sugarGoal, sugarGoal) ||
                other.sugarGoal == sugarGoal) &&
            const DeepCollectionEquality().equals(
              other._motivations,
              _motivations,
            ) &&
            (identical(other.hasCompletedOnboarding, hasCompletedOnboarding) ||
                other.hasCompletedOnboarding == hasCompletedOnboarding));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sugarGoal,
    const DeepCollectionEquality().hash(_motivations),
    hasCompletedOnboarding,
  );

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingDataImplCopyWith<_$OnboardingDataImpl> get copyWith =>
      __$$OnboardingDataImplCopyWithImpl<_$OnboardingDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OnboardingDataImplToJson(this);
  }
}

abstract class _OnboardingData implements OnboardingData {
  const factory _OnboardingData({
    final SugarGoal sugarGoal,
    final List<SugarMotivation> motivations,
    final bool hasCompletedOnboarding,
  }) = _$OnboardingDataImpl;

  factory _OnboardingData.fromJson(Map<String, dynamic> json) =
      _$OnboardingDataImpl.fromJson;

  @override
  SugarGoal get sugarGoal;
  @override
  List<SugarMotivation> get motivations;
  @override
  bool get hasCompletedOnboarding;

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingDataImplCopyWith<_$OnboardingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
