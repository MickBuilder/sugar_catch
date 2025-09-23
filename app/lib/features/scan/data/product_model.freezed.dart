// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return _Ingredient.fromJson(json);
}

/// @nodoc
mixin _$Ingredient {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'text_en')
  String? get textEn => throw _privateConstructorUsedError;
  @JsonKey(name: 'percent_estimate')
  double? get percentEstimate => throw _privateConstructorUsedError;
  @JsonKey(name: 'percent_max')
  double? get percentMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'percent_min')
  double? get percentMin => throw _privateConstructorUsedError;
  @JsonKey(name: 'vegan')
  String? get vegan => throw _privateConstructorUsedError;
  @JsonKey(name: 'vegetarian')
  String? get vegetarian => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_palm_oil')
  String? get fromPalmOil => throw _privateConstructorUsedError;

  /// Serializes this Ingredient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientCopyWith<Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientCopyWith<$Res> {
  factory $IngredientCopyWith(
    Ingredient value,
    $Res Function(Ingredient) then,
  ) = _$IngredientCopyWithImpl<$Res, Ingredient>;
  @useResult
  $Res call({
    @JsonKey(name: 'id') String id,
    @JsonKey(name: 'text') String text,
    @JsonKey(name: 'text_en') String? textEn,
    @JsonKey(name: 'percent_estimate') double? percentEstimate,
    @JsonKey(name: 'percent_max') double? percentMax,
    @JsonKey(name: 'percent_min') double? percentMin,
    @JsonKey(name: 'vegan') String? vegan,
    @JsonKey(name: 'vegetarian') String? vegetarian,
    @JsonKey(name: 'from_palm_oil') String? fromPalmOil,
  });
}

/// @nodoc
class _$IngredientCopyWithImpl<$Res, $Val extends Ingredient>
    implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? textEn = freezed,
    Object? percentEstimate = freezed,
    Object? percentMax = freezed,
    Object? percentMin = freezed,
    Object? vegan = freezed,
    Object? vegetarian = freezed,
    Object? fromPalmOil = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            textEn: freezed == textEn
                ? _value.textEn
                : textEn // ignore: cast_nullable_to_non_nullable
                      as String?,
            percentEstimate: freezed == percentEstimate
                ? _value.percentEstimate
                : percentEstimate // ignore: cast_nullable_to_non_nullable
                      as double?,
            percentMax: freezed == percentMax
                ? _value.percentMax
                : percentMax // ignore: cast_nullable_to_non_nullable
                      as double?,
            percentMin: freezed == percentMin
                ? _value.percentMin
                : percentMin // ignore: cast_nullable_to_non_nullable
                      as double?,
            vegan: freezed == vegan
                ? _value.vegan
                : vegan // ignore: cast_nullable_to_non_nullable
                      as String?,
            vegetarian: freezed == vegetarian
                ? _value.vegetarian
                : vegetarian // ignore: cast_nullable_to_non_nullable
                      as String?,
            fromPalmOil: freezed == fromPalmOil
                ? _value.fromPalmOil
                : fromPalmOil // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IngredientImplCopyWith<$Res>
    implements $IngredientCopyWith<$Res> {
  factory _$$IngredientImplCopyWith(
    _$IngredientImpl value,
    $Res Function(_$IngredientImpl) then,
  ) = __$$IngredientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id') String id,
    @JsonKey(name: 'text') String text,
    @JsonKey(name: 'text_en') String? textEn,
    @JsonKey(name: 'percent_estimate') double? percentEstimate,
    @JsonKey(name: 'percent_max') double? percentMax,
    @JsonKey(name: 'percent_min') double? percentMin,
    @JsonKey(name: 'vegan') String? vegan,
    @JsonKey(name: 'vegetarian') String? vegetarian,
    @JsonKey(name: 'from_palm_oil') String? fromPalmOil,
  });
}

/// @nodoc
class __$$IngredientImplCopyWithImpl<$Res>
    extends _$IngredientCopyWithImpl<$Res, _$IngredientImpl>
    implements _$$IngredientImplCopyWith<$Res> {
  __$$IngredientImplCopyWithImpl(
    _$IngredientImpl _value,
    $Res Function(_$IngredientImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? textEn = freezed,
    Object? percentEstimate = freezed,
    Object? percentMax = freezed,
    Object? percentMin = freezed,
    Object? vegan = freezed,
    Object? vegetarian = freezed,
    Object? fromPalmOil = freezed,
  }) {
    return _then(
      _$IngredientImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        textEn: freezed == textEn
            ? _value.textEn
            : textEn // ignore: cast_nullable_to_non_nullable
                  as String?,
        percentEstimate: freezed == percentEstimate
            ? _value.percentEstimate
            : percentEstimate // ignore: cast_nullable_to_non_nullable
                  as double?,
        percentMax: freezed == percentMax
            ? _value.percentMax
            : percentMax // ignore: cast_nullable_to_non_nullable
                  as double?,
        percentMin: freezed == percentMin
            ? _value.percentMin
            : percentMin // ignore: cast_nullable_to_non_nullable
                  as double?,
        vegan: freezed == vegan
            ? _value.vegan
            : vegan // ignore: cast_nullable_to_non_nullable
                  as String?,
        vegetarian: freezed == vegetarian
            ? _value.vegetarian
            : vegetarian // ignore: cast_nullable_to_non_nullable
                  as String?,
        fromPalmOil: freezed == fromPalmOil
            ? _value.fromPalmOil
            : fromPalmOil // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientImpl implements _Ingredient {
  const _$IngredientImpl({
    @JsonKey(name: 'id') required this.id,
    @JsonKey(name: 'text') required this.text,
    @JsonKey(name: 'text_en') this.textEn,
    @JsonKey(name: 'percent_estimate') this.percentEstimate,
    @JsonKey(name: 'percent_max') this.percentMax,
    @JsonKey(name: 'percent_min') this.percentMin,
    @JsonKey(name: 'vegan') this.vegan,
    @JsonKey(name: 'vegetarian') this.vegetarian,
    @JsonKey(name: 'from_palm_oil') this.fromPalmOil,
  });

  factory _$IngredientImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'text')
  final String text;
  @override
  @JsonKey(name: 'text_en')
  final String? textEn;
  @override
  @JsonKey(name: 'percent_estimate')
  final double? percentEstimate;
  @override
  @JsonKey(name: 'percent_max')
  final double? percentMax;
  @override
  @JsonKey(name: 'percent_min')
  final double? percentMin;
  @override
  @JsonKey(name: 'vegan')
  final String? vegan;
  @override
  @JsonKey(name: 'vegetarian')
  final String? vegetarian;
  @override
  @JsonKey(name: 'from_palm_oil')
  final String? fromPalmOil;

  @override
  String toString() {
    return 'Ingredient(id: $id, text: $text, textEn: $textEn, percentEstimate: $percentEstimate, percentMax: $percentMax, percentMin: $percentMin, vegan: $vegan, vegetarian: $vegetarian, fromPalmOil: $fromPalmOil)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.textEn, textEn) || other.textEn == textEn) &&
            (identical(other.percentEstimate, percentEstimate) ||
                other.percentEstimate == percentEstimate) &&
            (identical(other.percentMax, percentMax) ||
                other.percentMax == percentMax) &&
            (identical(other.percentMin, percentMin) ||
                other.percentMin == percentMin) &&
            (identical(other.vegan, vegan) || other.vegan == vegan) &&
            (identical(other.vegetarian, vegetarian) ||
                other.vegetarian == vegetarian) &&
            (identical(other.fromPalmOil, fromPalmOil) ||
                other.fromPalmOil == fromPalmOil));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    text,
    textEn,
    percentEstimate,
    percentMax,
    percentMin,
    vegan,
    vegetarian,
    fromPalmOil,
  );

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientImplCopyWith<_$IngredientImpl> get copyWith =>
      __$$IngredientImplCopyWithImpl<_$IngredientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientImplToJson(this);
  }
}

abstract class _Ingredient implements Ingredient {
  const factory _Ingredient({
    @JsonKey(name: 'id') required final String id,
    @JsonKey(name: 'text') required final String text,
    @JsonKey(name: 'text_en') final String? textEn,
    @JsonKey(name: 'percent_estimate') final double? percentEstimate,
    @JsonKey(name: 'percent_max') final double? percentMax,
    @JsonKey(name: 'percent_min') final double? percentMin,
    @JsonKey(name: 'vegan') final String? vegan,
    @JsonKey(name: 'vegetarian') final String? vegetarian,
    @JsonKey(name: 'from_palm_oil') final String? fromPalmOil,
  }) = _$IngredientImpl;

  factory _Ingredient.fromJson(Map<String, dynamic> json) =
      _$IngredientImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'text')
  String get text;
  @override
  @JsonKey(name: 'text_en')
  String? get textEn;
  @override
  @JsonKey(name: 'percent_estimate')
  double? get percentEstimate;
  @override
  @JsonKey(name: 'percent_max')
  double? get percentMax;
  @override
  @JsonKey(name: 'percent_min')
  double? get percentMin;
  @override
  @JsonKey(name: 'vegan')
  String? get vegan;
  @override
  @JsonKey(name: 'vegetarian')
  String? get vegetarian;
  @override
  @JsonKey(name: 'from_palm_oil')
  String? get fromPalmOil;

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientImplCopyWith<_$IngredientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name_en')
  String? get productNameEn => throw _privateConstructorUsedError;
  @JsonKey(name: 'brands')
  String? get brands => throw _privateConstructorUsedError;
  @JsonKey(name: 'sugars_100g')
  double get sugarsPer100g => throw _privateConstructorUsedError;
  @JsonKey(name: 'sugars_serving')
  double? get sugarsServing => throw _privateConstructorUsedError;
  @JsonKey(name: 'serving_size')
  String? get servingSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'serving_quantity')
  String? get servingQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  String? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_quantity')
  String? get productQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_quantity_unit')
  String? get productQuantityUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredients')
  List<Ingredient>? get ingredientsList => throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredients_tags')
  List<String>? get ingredientsTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_front_url')
  String? get imageFrontUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'categories')
  String? get categories => throw _privateConstructorUsedError;
  @JsonKey(name: 'categories_hierarchy')
  List<String>? get categoriesHierarchy => throw _privateConstructorUsedError;
  @JsonKey(name: 'categories_tags')
  List<String>? get categoriesTags => throw _privateConstructorUsedError;
  Map<String, dynamic>? get nutriments => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call({
    String code,
    @JsonKey(name: 'product_name') String productName,
    @JsonKey(name: 'product_name_en') String? productNameEn,
    @JsonKey(name: 'brands') String? brands,
    @JsonKey(name: 'sugars_100g') double sugarsPer100g,
    @JsonKey(name: 'sugars_serving') double? sugarsServing,
    @JsonKey(name: 'serving_size') String? servingSize,
    @JsonKey(name: 'serving_quantity') String? servingQuantity,
    @JsonKey(name: 'quantity') String? quantity,
    @JsonKey(name: 'product_quantity') String? productQuantity,
    @JsonKey(name: 'product_quantity_unit') String? productQuantityUnit,
    @JsonKey(name: 'ingredients') List<Ingredient>? ingredientsList,
    @JsonKey(name: 'ingredients_tags') List<String>? ingredientsTags,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'image_front_url') String? imageFrontUrl,
    @JsonKey(name: 'categories') String? categories,
    @JsonKey(name: 'categories_hierarchy') List<String>? categoriesHierarchy,
    @JsonKey(name: 'categories_tags') List<String>? categoriesTags,
    Map<String, dynamic>? nutriments,
  });
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? productName = null,
    Object? productNameEn = freezed,
    Object? brands = freezed,
    Object? sugarsPer100g = null,
    Object? sugarsServing = freezed,
    Object? servingSize = freezed,
    Object? servingQuantity = freezed,
    Object? quantity = freezed,
    Object? productQuantity = freezed,
    Object? productQuantityUnit = freezed,
    Object? ingredientsList = freezed,
    Object? ingredientsTags = freezed,
    Object? imageUrl = freezed,
    Object? imageFrontUrl = freezed,
    Object? categories = freezed,
    Object? categoriesHierarchy = freezed,
    Object? categoriesTags = freezed,
    Object? nutriments = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            productName: null == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                      as String,
            productNameEn: freezed == productNameEn
                ? _value.productNameEn
                : productNameEn // ignore: cast_nullable_to_non_nullable
                      as String?,
            brands: freezed == brands
                ? _value.brands
                : brands // ignore: cast_nullable_to_non_nullable
                      as String?,
            sugarsPer100g: null == sugarsPer100g
                ? _value.sugarsPer100g
                : sugarsPer100g // ignore: cast_nullable_to_non_nullable
                      as double,
            sugarsServing: freezed == sugarsServing
                ? _value.sugarsServing
                : sugarsServing // ignore: cast_nullable_to_non_nullable
                      as double?,
            servingSize: freezed == servingSize
                ? _value.servingSize
                : servingSize // ignore: cast_nullable_to_non_nullable
                      as String?,
            servingQuantity: freezed == servingQuantity
                ? _value.servingQuantity
                : servingQuantity // ignore: cast_nullable_to_non_nullable
                      as String?,
            quantity: freezed == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as String?,
            productQuantity: freezed == productQuantity
                ? _value.productQuantity
                : productQuantity // ignore: cast_nullable_to_non_nullable
                      as String?,
            productQuantityUnit: freezed == productQuantityUnit
                ? _value.productQuantityUnit
                : productQuantityUnit // ignore: cast_nullable_to_non_nullable
                      as String?,
            ingredientsList: freezed == ingredientsList
                ? _value.ingredientsList
                : ingredientsList // ignore: cast_nullable_to_non_nullable
                      as List<Ingredient>?,
            ingredientsTags: freezed == ingredientsTags
                ? _value.ingredientsTags
                : ingredientsTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageFrontUrl: freezed == imageFrontUrl
                ? _value.imageFrontUrl
                : imageFrontUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            categories: freezed == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as String?,
            categoriesHierarchy: freezed == categoriesHierarchy
                ? _value.categoriesHierarchy
                : categoriesHierarchy // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            categoriesTags: freezed == categoriesTags
                ? _value.categoriesTags
                : categoriesTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            nutriments: freezed == nutriments
                ? _value.nutriments
                : nutriments // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
    _$ProductImpl value,
    $Res Function(_$ProductImpl) then,
  ) = __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String code,
    @JsonKey(name: 'product_name') String productName,
    @JsonKey(name: 'product_name_en') String? productNameEn,
    @JsonKey(name: 'brands') String? brands,
    @JsonKey(name: 'sugars_100g') double sugarsPer100g,
    @JsonKey(name: 'sugars_serving') double? sugarsServing,
    @JsonKey(name: 'serving_size') String? servingSize,
    @JsonKey(name: 'serving_quantity') String? servingQuantity,
    @JsonKey(name: 'quantity') String? quantity,
    @JsonKey(name: 'product_quantity') String? productQuantity,
    @JsonKey(name: 'product_quantity_unit') String? productQuantityUnit,
    @JsonKey(name: 'ingredients') List<Ingredient>? ingredientsList,
    @JsonKey(name: 'ingredients_tags') List<String>? ingredientsTags,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'image_front_url') String? imageFrontUrl,
    @JsonKey(name: 'categories') String? categories,
    @JsonKey(name: 'categories_hierarchy') List<String>? categoriesHierarchy,
    @JsonKey(name: 'categories_tags') List<String>? categoriesTags,
    Map<String, dynamic>? nutriments,
  });
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
    _$ProductImpl _value,
    $Res Function(_$ProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? productName = null,
    Object? productNameEn = freezed,
    Object? brands = freezed,
    Object? sugarsPer100g = null,
    Object? sugarsServing = freezed,
    Object? servingSize = freezed,
    Object? servingQuantity = freezed,
    Object? quantity = freezed,
    Object? productQuantity = freezed,
    Object? productQuantityUnit = freezed,
    Object? ingredientsList = freezed,
    Object? ingredientsTags = freezed,
    Object? imageUrl = freezed,
    Object? imageFrontUrl = freezed,
    Object? categories = freezed,
    Object? categoriesHierarchy = freezed,
    Object? categoriesTags = freezed,
    Object? nutriments = freezed,
  }) {
    return _then(
      _$ProductImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        productName: null == productName
            ? _value.productName
            : productName // ignore: cast_nullable_to_non_nullable
                  as String,
        productNameEn: freezed == productNameEn
            ? _value.productNameEn
            : productNameEn // ignore: cast_nullable_to_non_nullable
                  as String?,
        brands: freezed == brands
            ? _value.brands
            : brands // ignore: cast_nullable_to_non_nullable
                  as String?,
        sugarsPer100g: null == sugarsPer100g
            ? _value.sugarsPer100g
            : sugarsPer100g // ignore: cast_nullable_to_non_nullable
                  as double,
        sugarsServing: freezed == sugarsServing
            ? _value.sugarsServing
            : sugarsServing // ignore: cast_nullable_to_non_nullable
                  as double?,
        servingSize: freezed == servingSize
            ? _value.servingSize
            : servingSize // ignore: cast_nullable_to_non_nullable
                  as String?,
        servingQuantity: freezed == servingQuantity
            ? _value.servingQuantity
            : servingQuantity // ignore: cast_nullable_to_non_nullable
                  as String?,
        quantity: freezed == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as String?,
        productQuantity: freezed == productQuantity
            ? _value.productQuantity
            : productQuantity // ignore: cast_nullable_to_non_nullable
                  as String?,
        productQuantityUnit: freezed == productQuantityUnit
            ? _value.productQuantityUnit
            : productQuantityUnit // ignore: cast_nullable_to_non_nullable
                  as String?,
        ingredientsList: freezed == ingredientsList
            ? _value._ingredientsList
            : ingredientsList // ignore: cast_nullable_to_non_nullable
                  as List<Ingredient>?,
        ingredientsTags: freezed == ingredientsTags
            ? _value._ingredientsTags
            : ingredientsTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageFrontUrl: freezed == imageFrontUrl
            ? _value.imageFrontUrl
            : imageFrontUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        categories: freezed == categories
            ? _value.categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoriesHierarchy: freezed == categoriesHierarchy
            ? _value._categoriesHierarchy
            : categoriesHierarchy // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        categoriesTags: freezed == categoriesTags
            ? _value._categoriesTags
            : categoriesTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        nutriments: freezed == nutriments
            ? _value._nutriments
            : nutriments // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl({
    required this.code,
    @JsonKey(name: 'product_name') required this.productName,
    @JsonKey(name: 'product_name_en') this.productNameEn,
    @JsonKey(name: 'brands') this.brands,
    @JsonKey(name: 'sugars_100g') required this.sugarsPer100g,
    @JsonKey(name: 'sugars_serving') this.sugarsServing,
    @JsonKey(name: 'serving_size') this.servingSize,
    @JsonKey(name: 'serving_quantity') this.servingQuantity,
    @JsonKey(name: 'quantity') this.quantity,
    @JsonKey(name: 'product_quantity') this.productQuantity,
    @JsonKey(name: 'product_quantity_unit') this.productQuantityUnit,
    @JsonKey(name: 'ingredients') final List<Ingredient>? ingredientsList,
    @JsonKey(name: 'ingredients_tags') final List<String>? ingredientsTags,
    @JsonKey(name: 'image_url') this.imageUrl,
    @JsonKey(name: 'image_front_url') this.imageFrontUrl,
    @JsonKey(name: 'categories') this.categories,
    @JsonKey(name: 'categories_hierarchy')
    final List<String>? categoriesHierarchy,
    @JsonKey(name: 'categories_tags') final List<String>? categoriesTags,
    final Map<String, dynamic>? nutriments,
  }) : _ingredientsList = ingredientsList,
       _ingredientsTags = ingredientsTags,
       _categoriesHierarchy = categoriesHierarchy,
       _categoriesTags = categoriesTags,
       _nutriments = nutriments;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final String code;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'product_name_en')
  final String? productNameEn;
  @override
  @JsonKey(name: 'brands')
  final String? brands;
  @override
  @JsonKey(name: 'sugars_100g')
  final double sugarsPer100g;
  @override
  @JsonKey(name: 'sugars_serving')
  final double? sugarsServing;
  @override
  @JsonKey(name: 'serving_size')
  final String? servingSize;
  @override
  @JsonKey(name: 'serving_quantity')
  final String? servingQuantity;
  @override
  @JsonKey(name: 'quantity')
  final String? quantity;
  @override
  @JsonKey(name: 'product_quantity')
  final String? productQuantity;
  @override
  @JsonKey(name: 'product_quantity_unit')
  final String? productQuantityUnit;
  final List<Ingredient>? _ingredientsList;
  @override
  @JsonKey(name: 'ingredients')
  List<Ingredient>? get ingredientsList {
    final value = _ingredientsList;
    if (value == null) return null;
    if (_ingredientsList is EqualUnmodifiableListView) return _ingredientsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _ingredientsTags;
  @override
  @JsonKey(name: 'ingredients_tags')
  List<String>? get ingredientsTags {
    final value = _ingredientsTags;
    if (value == null) return null;
    if (_ingredientsTags is EqualUnmodifiableListView) return _ingredientsTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'image_front_url')
  final String? imageFrontUrl;
  @override
  @JsonKey(name: 'categories')
  final String? categories;
  final List<String>? _categoriesHierarchy;
  @override
  @JsonKey(name: 'categories_hierarchy')
  List<String>? get categoriesHierarchy {
    final value = _categoriesHierarchy;
    if (value == null) return null;
    if (_categoriesHierarchy is EqualUnmodifiableListView)
      return _categoriesHierarchy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _categoriesTags;
  @override
  @JsonKey(name: 'categories_tags')
  List<String>? get categoriesTags {
    final value = _categoriesTags;
    if (value == null) return null;
    if (_categoriesTags is EqualUnmodifiableListView) return _categoriesTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _nutriments;
  @override
  Map<String, dynamic>? get nutriments {
    final value = _nutriments;
    if (value == null) return null;
    if (_nutriments is EqualUnmodifiableMapView) return _nutriments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Product(code: $code, productName: $productName, productNameEn: $productNameEn, brands: $brands, sugarsPer100g: $sugarsPer100g, sugarsServing: $sugarsServing, servingSize: $servingSize, servingQuantity: $servingQuantity, quantity: $quantity, productQuantity: $productQuantity, productQuantityUnit: $productQuantityUnit, ingredientsList: $ingredientsList, ingredientsTags: $ingredientsTags, imageUrl: $imageUrl, imageFrontUrl: $imageFrontUrl, categories: $categories, categoriesHierarchy: $categoriesHierarchy, categoriesTags: $categoriesTags, nutriments: $nutriments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productNameEn, productNameEn) ||
                other.productNameEn == productNameEn) &&
            (identical(other.brands, brands) || other.brands == brands) &&
            (identical(other.sugarsPer100g, sugarsPer100g) ||
                other.sugarsPer100g == sugarsPer100g) &&
            (identical(other.sugarsServing, sugarsServing) ||
                other.sugarsServing == sugarsServing) &&
            (identical(other.servingSize, servingSize) ||
                other.servingSize == servingSize) &&
            (identical(other.servingQuantity, servingQuantity) ||
                other.servingQuantity == servingQuantity) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.productQuantity, productQuantity) ||
                other.productQuantity == productQuantity) &&
            (identical(other.productQuantityUnit, productQuantityUnit) ||
                other.productQuantityUnit == productQuantityUnit) &&
            const DeepCollectionEquality().equals(
              other._ingredientsList,
              _ingredientsList,
            ) &&
            const DeepCollectionEquality().equals(
              other._ingredientsTags,
              _ingredientsTags,
            ) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageFrontUrl, imageFrontUrl) ||
                other.imageFrontUrl == imageFrontUrl) &&
            (identical(other.categories, categories) ||
                other.categories == categories) &&
            const DeepCollectionEquality().equals(
              other._categoriesHierarchy,
              _categoriesHierarchy,
            ) &&
            const DeepCollectionEquality().equals(
              other._categoriesTags,
              _categoriesTags,
            ) &&
            const DeepCollectionEquality().equals(
              other._nutriments,
              _nutriments,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    code,
    productName,
    productNameEn,
    brands,
    sugarsPer100g,
    sugarsServing,
    servingSize,
    servingQuantity,
    quantity,
    productQuantity,
    productQuantityUnit,
    const DeepCollectionEquality().hash(_ingredientsList),
    const DeepCollectionEquality().hash(_ingredientsTags),
    imageUrl,
    imageFrontUrl,
    categories,
    const DeepCollectionEquality().hash(_categoriesHierarchy),
    const DeepCollectionEquality().hash(_categoriesTags),
    const DeepCollectionEquality().hash(_nutriments),
  ]);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(this);
  }
}

abstract class _Product implements Product {
  const factory _Product({
    required final String code,
    @JsonKey(name: 'product_name') required final String productName,
    @JsonKey(name: 'product_name_en') final String? productNameEn,
    @JsonKey(name: 'brands') final String? brands,
    @JsonKey(name: 'sugars_100g') required final double sugarsPer100g,
    @JsonKey(name: 'sugars_serving') final double? sugarsServing,
    @JsonKey(name: 'serving_size') final String? servingSize,
    @JsonKey(name: 'serving_quantity') final String? servingQuantity,
    @JsonKey(name: 'quantity') final String? quantity,
    @JsonKey(name: 'product_quantity') final String? productQuantity,
    @JsonKey(name: 'product_quantity_unit') final String? productQuantityUnit,
    @JsonKey(name: 'ingredients') final List<Ingredient>? ingredientsList,
    @JsonKey(name: 'ingredients_tags') final List<String>? ingredientsTags,
    @JsonKey(name: 'image_url') final String? imageUrl,
    @JsonKey(name: 'image_front_url') final String? imageFrontUrl,
    @JsonKey(name: 'categories') final String? categories,
    @JsonKey(name: 'categories_hierarchy')
    final List<String>? categoriesHierarchy,
    @JsonKey(name: 'categories_tags') final List<String>? categoriesTags,
    final Map<String, dynamic>? nutriments,
  }) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String get code;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'product_name_en')
  String? get productNameEn;
  @override
  @JsonKey(name: 'brands')
  String? get brands;
  @override
  @JsonKey(name: 'sugars_100g')
  double get sugarsPer100g;
  @override
  @JsonKey(name: 'sugars_serving')
  double? get sugarsServing;
  @override
  @JsonKey(name: 'serving_size')
  String? get servingSize;
  @override
  @JsonKey(name: 'serving_quantity')
  String? get servingQuantity;
  @override
  @JsonKey(name: 'quantity')
  String? get quantity;
  @override
  @JsonKey(name: 'product_quantity')
  String? get productQuantity;
  @override
  @JsonKey(name: 'product_quantity_unit')
  String? get productQuantityUnit;
  @override
  @JsonKey(name: 'ingredients')
  List<Ingredient>? get ingredientsList;
  @override
  @JsonKey(name: 'ingredients_tags')
  List<String>? get ingredientsTags;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'image_front_url')
  String? get imageFrontUrl;
  @override
  @JsonKey(name: 'categories')
  String? get categories;
  @override
  @JsonKey(name: 'categories_hierarchy')
  List<String>? get categoriesHierarchy;
  @override
  @JsonKey(name: 'categories_tags')
  List<String>? get categoriesTags;
  @override
  Map<String, dynamic>? get nutriments;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SugarInfo _$SugarInfoFromJson(Map<String, dynamic> json) {
  return _SugarInfo.fromJson(json);
}

/// @nodoc
mixin _$SugarInfo {
  double get sugarsPer100g => throw _privateConstructorUsedError;
  double get totalSugarsInProduct => throw _privateConstructorUsedError;
  String get productUnit => throw _privateConstructorUsedError;
  List<Ingredient> get hiddenSugarIngredients =>
      throw _privateConstructorUsedError;

  /// Serializes this SugarInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SugarInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SugarInfoCopyWith<SugarInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SugarInfoCopyWith<$Res> {
  factory $SugarInfoCopyWith(SugarInfo value, $Res Function(SugarInfo) then) =
      _$SugarInfoCopyWithImpl<$Res, SugarInfo>;
  @useResult
  $Res call({
    double sugarsPer100g,
    double totalSugarsInProduct,
    String productUnit,
    List<Ingredient> hiddenSugarIngredients,
  });
}

/// @nodoc
class _$SugarInfoCopyWithImpl<$Res, $Val extends SugarInfo>
    implements $SugarInfoCopyWith<$Res> {
  _$SugarInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SugarInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sugarsPer100g = null,
    Object? totalSugarsInProduct = null,
    Object? productUnit = null,
    Object? hiddenSugarIngredients = null,
  }) {
    return _then(
      _value.copyWith(
            sugarsPer100g: null == sugarsPer100g
                ? _value.sugarsPer100g
                : sugarsPer100g // ignore: cast_nullable_to_non_nullable
                      as double,
            totalSugarsInProduct: null == totalSugarsInProduct
                ? _value.totalSugarsInProduct
                : totalSugarsInProduct // ignore: cast_nullable_to_non_nullable
                      as double,
            productUnit: null == productUnit
                ? _value.productUnit
                : productUnit // ignore: cast_nullable_to_non_nullable
                      as String,
            hiddenSugarIngredients: null == hiddenSugarIngredients
                ? _value.hiddenSugarIngredients
                : hiddenSugarIngredients // ignore: cast_nullable_to_non_nullable
                      as List<Ingredient>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SugarInfoImplCopyWith<$Res>
    implements $SugarInfoCopyWith<$Res> {
  factory _$$SugarInfoImplCopyWith(
    _$SugarInfoImpl value,
    $Res Function(_$SugarInfoImpl) then,
  ) = __$$SugarInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double sugarsPer100g,
    double totalSugarsInProduct,
    String productUnit,
    List<Ingredient> hiddenSugarIngredients,
  });
}

/// @nodoc
class __$$SugarInfoImplCopyWithImpl<$Res>
    extends _$SugarInfoCopyWithImpl<$Res, _$SugarInfoImpl>
    implements _$$SugarInfoImplCopyWith<$Res> {
  __$$SugarInfoImplCopyWithImpl(
    _$SugarInfoImpl _value,
    $Res Function(_$SugarInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SugarInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sugarsPer100g = null,
    Object? totalSugarsInProduct = null,
    Object? productUnit = null,
    Object? hiddenSugarIngredients = null,
  }) {
    return _then(
      _$SugarInfoImpl(
        sugarsPer100g: null == sugarsPer100g
            ? _value.sugarsPer100g
            : sugarsPer100g // ignore: cast_nullable_to_non_nullable
                  as double,
        totalSugarsInProduct: null == totalSugarsInProduct
            ? _value.totalSugarsInProduct
            : totalSugarsInProduct // ignore: cast_nullable_to_non_nullable
                  as double,
        productUnit: null == productUnit
            ? _value.productUnit
            : productUnit // ignore: cast_nullable_to_non_nullable
                  as String,
        hiddenSugarIngredients: null == hiddenSugarIngredients
            ? _value._hiddenSugarIngredients
            : hiddenSugarIngredients // ignore: cast_nullable_to_non_nullable
                  as List<Ingredient>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SugarInfoImpl implements _SugarInfo {
  const _$SugarInfoImpl({
    required this.sugarsPer100g,
    required this.totalSugarsInProduct,
    required this.productUnit,
    required final List<Ingredient> hiddenSugarIngredients,
  }) : _hiddenSugarIngredients = hiddenSugarIngredients;

  factory _$SugarInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SugarInfoImplFromJson(json);

  @override
  final double sugarsPer100g;
  @override
  final double totalSugarsInProduct;
  @override
  final String productUnit;
  final List<Ingredient> _hiddenSugarIngredients;
  @override
  List<Ingredient> get hiddenSugarIngredients {
    if (_hiddenSugarIngredients is EqualUnmodifiableListView)
      return _hiddenSugarIngredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hiddenSugarIngredients);
  }

  @override
  String toString() {
    return 'SugarInfo(sugarsPer100g: $sugarsPer100g, totalSugarsInProduct: $totalSugarsInProduct, productUnit: $productUnit, hiddenSugarIngredients: $hiddenSugarIngredients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SugarInfoImpl &&
            (identical(other.sugarsPer100g, sugarsPer100g) ||
                other.sugarsPer100g == sugarsPer100g) &&
            (identical(other.totalSugarsInProduct, totalSugarsInProduct) ||
                other.totalSugarsInProduct == totalSugarsInProduct) &&
            (identical(other.productUnit, productUnit) ||
                other.productUnit == productUnit) &&
            const DeepCollectionEquality().equals(
              other._hiddenSugarIngredients,
              _hiddenSugarIngredients,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sugarsPer100g,
    totalSugarsInProduct,
    productUnit,
    const DeepCollectionEquality().hash(_hiddenSugarIngredients),
  );

  /// Create a copy of SugarInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SugarInfoImplCopyWith<_$SugarInfoImpl> get copyWith =>
      __$$SugarInfoImplCopyWithImpl<_$SugarInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SugarInfoImplToJson(this);
  }
}

abstract class _SugarInfo implements SugarInfo {
  const factory _SugarInfo({
    required final double sugarsPer100g,
    required final double totalSugarsInProduct,
    required final String productUnit,
    required final List<Ingredient> hiddenSugarIngredients,
  }) = _$SugarInfoImpl;

  factory _SugarInfo.fromJson(Map<String, dynamic> json) =
      _$SugarInfoImpl.fromJson;

  @override
  double get sugarsPer100g;
  @override
  double get totalSugarsInProduct;
  @override
  String get productUnit;
  @override
  List<Ingredient> get hiddenSugarIngredients;

  /// Create a copy of SugarInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SugarInfoImplCopyWith<_$SugarInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
