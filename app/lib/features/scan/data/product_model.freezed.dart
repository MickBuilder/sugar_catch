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
  @JsonKey(name: 'percent_max', fromJson: _parseDouble)
  double? get percentMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'percent_min', fromJson: _parseDouble)
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
    @JsonKey(name: 'percent_max', fromJson: _parseDouble) double? percentMax,
    @JsonKey(name: 'percent_min', fromJson: _parseDouble) double? percentMin,
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
    @JsonKey(name: 'percent_max', fromJson: _parseDouble) double? percentMax,
    @JsonKey(name: 'percent_min', fromJson: _parseDouble) double? percentMin,
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
    @JsonKey(name: 'percent_max', fromJson: _parseDouble) this.percentMax,
    @JsonKey(name: 'percent_min', fromJson: _parseDouble) this.percentMin,
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
  @JsonKey(name: 'percent_max', fromJson: _parseDouble)
  final double? percentMax;
  @override
  @JsonKey(name: 'percent_min', fromJson: _parseDouble)
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
    @JsonKey(name: 'percent_max', fromJson: _parseDouble)
    final double? percentMax,
    @JsonKey(name: 'percent_min', fromJson: _parseDouble)
    final double? percentMin,
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
  @JsonKey(name: 'percent_max', fromJson: _parseDouble)
  double? get percentMax;
  @override
  @JsonKey(name: 'percent_min', fromJson: _parseDouble)
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
  @JsonKey(name: 'generic_name')
  String? get genericName => throw _privateConstructorUsedError;
  @JsonKey(name: 'brands')
  String? get brands => throw _privateConstructorUsedError;
  @JsonKey(name: 'brands_tags')
  List<String>? get brandsTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  String? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_quantity')
  String? get productQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_quantity_unit')
  String? get productQuantityUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'serving_size')
  String? get servingSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'serving_quantity')
  String? get servingQuantity => throw _privateConstructorUsedError; // Images
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_front_url')
  String? get imageFrontUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_front_small_url')
  String? get imageFrontSmallUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_nutrition_url')
  String? get imageNutritionUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_ingredients_url')
  String? get imageIngredientsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'selected_images')
  Map<String, dynamic>? get selectedImages =>
      throw _privateConstructorUsedError; // Ingredients
  @JsonKey(name: 'ingredients')
  List<Ingredient>? get ingredientsList => throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredients_text')
  String? get ingredientsText => throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredients_text_en')
  String? get ingredientsTextEn => throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredients_tags')
  List<String>? get ingredientsTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredients_analysis_tags')
  List<String>? get ingredientsAnalysisTags =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredients_sweeteners_n')
  int? get ingredientsSweetenersN => throw _privateConstructorUsedError; // Nutrition
  @JsonKey(name: 'sugars_100g')
  double get sugarsPer100g => throw _privateConstructorUsedError;
  @JsonKey(name: 'sugars_serving')
  double? get sugarsServing => throw _privateConstructorUsedError;
  @JsonKey(name: 'nutriments')
  Map<String, dynamic>? get nutriments => throw _privateConstructorUsedError;
  @JsonKey(name: 'nutrient_levels')
  Map<String, String>? get nutrientLevels => throw _privateConstructorUsedError;
  @JsonKey(name: 'nutriscore_grade')
  String? get nutriscoreGrade => throw _privateConstructorUsedError;
  @JsonKey(name: 'nutriscore_score')
  int? get nutriscoreScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'nutriscore_data')
  Map<String, dynamic>? get nutriscoreData =>
      throw _privateConstructorUsedError; // Categories
  @JsonKey(name: 'categories')
  String? get categories => throw _privateConstructorUsedError;
  @JsonKey(name: 'categories_hierarchy')
  List<String>? get categoriesHierarchy => throw _privateConstructorUsedError;
  @JsonKey(name: 'categories_tags')
  List<String>? get categoriesTags => throw _privateConstructorUsedError; // Additives, Allergens, Traces
  @JsonKey(name: 'additives')
  String? get additives => throw _privateConstructorUsedError;
  @JsonKey(name: 'additives_tags')
  List<String>? get additivesTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'additives_original_tags')
  List<String>? get additivesOriginalTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'allergens')
  String? get allergens => throw _privateConstructorUsedError;
  @JsonKey(name: 'allergens_tags')
  List<String>? get allergensTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'allergens_from_ingredients')
  String? get allergensFromIngredients => throw _privateConstructorUsedError;
  @JsonKey(name: 'allergens_from_user')
  String? get allergensFromUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'traces')
  String? get traces => throw _privateConstructorUsedError;
  @JsonKey(name: 'traces_tags')
  List<String>? get tracesTags => throw _privateConstructorUsedError; // Labels and Certifications
  @JsonKey(name: 'labels')
  String? get labels => throw _privateConstructorUsedError;
  @JsonKey(name: 'labels_tags')
  List<String>? get labelsTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'labels_hierarchy')
  List<String>? get labelsHierarchy => throw _privateConstructorUsedError;
  @JsonKey(name: 'ecoscore_grade')
  String? get ecoscoreGrade => throw _privateConstructorUsedError;
  @JsonKey(name: 'ecoscore_score')
  int? get ecoscoreScore => throw _privateConstructorUsedError; // Processing and Quality
  @JsonKey(name: 'nova_group')
  int? get novaGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'nova_groups')
  String? get novaGroups => throw _privateConstructorUsedError;
  @JsonKey(name: 'processing')
  String? get processing => throw _privateConstructorUsedError;
  @JsonKey(name: 'processing_tags')
  List<String>? get processingTags => throw _privateConstructorUsedError; // Other useful fields
  @JsonKey(name: 'packaging')
  String? get packaging => throw _privateConstructorUsedError;
  @JsonKey(name: 'packaging_tags')
  List<String>? get packagingTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'countries')
  String? get countries => throw _privateConstructorUsedError;
  @JsonKey(name: 'countries_tags')
  List<String>? get countriesTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'origins')
  String? get origins => throw _privateConstructorUsedError;
  @JsonKey(name: 'origins_tags')
  List<String>? get originsTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'stores')
  String? get stores => throw _privateConstructorUsedError;
  @JsonKey(name: 'stores_tags')
  List<String>? get storesTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_places')
  String? get purchasePlaces => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_places_tags')
  List<String>? get purchasePlacesTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'emb_codes')
  String? get embCodes => throw _privateConstructorUsedError;
  @JsonKey(name: 'emb_codes_tags')
  List<String>? get embCodesTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'creator')
  String? get creator => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_t')
  int? get createdT => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_modified_t')
  int? get lastModifiedT => throw _privateConstructorUsedError;
  @JsonKey(name: 'completeness')
  double? get completeness => throw _privateConstructorUsedError;
  @JsonKey(name: 'popularity_tags')
  List<String>? get popularityTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'states')
  String? get states => throw _privateConstructorUsedError;
  @JsonKey(name: 'states_tags')
  List<String>? get statesTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'interface_version_created')
  String? get interfaceVersionCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'interface_version_modified')
  String? get interfaceVersionModified => throw _privateConstructorUsedError;
  @JsonKey(name: 'unknown_nutrients_tags')
  List<String>? get unknownNutrientsTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredients_n')
  int? get ingredientsN => throw _privateConstructorUsedError;
  @JsonKey(name: 'rev')
  int? get rev => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_nutriments')
  String? get noNutriments => throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredients_that_may_be_from_palm_oil_n')
  int? get ingredientsThatMayBeFromPalmOilN =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredients_from_palm_oil_n')
  int? get ingredientsFromPalmOilN => throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredients_from_or_that_may_be_from_palm_oil_n')
  int? get ingredientsFromOrThatMayBeFromPalmOilN =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'nutrition_grade_fr')
  String? get nutritionGradeFr => throw _privateConstructorUsedError;
  @JsonKey(name: 'pnns_groups_1')
  String? get pnnsGroups1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'pnns_groups_2')
  String? get pnnsGroups2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'food_groups')
  String? get foodGroups => throw _privateConstructorUsedError;
  @JsonKey(name: 'food_groups_tags')
  List<String>? get foodGroupsTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'other_information')
  String? get otherInformation => throw _privateConstructorUsedError;

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
    @JsonKey(name: 'generic_name') String? genericName,
    @JsonKey(name: 'brands') String? brands,
    @JsonKey(name: 'brands_tags') List<String>? brandsTags,
    @JsonKey(name: 'quantity') String? quantity,
    @JsonKey(name: 'product_quantity') String? productQuantity,
    @JsonKey(name: 'product_quantity_unit') String? productQuantityUnit,
    @JsonKey(name: 'serving_size') String? servingSize,
    @JsonKey(name: 'serving_quantity') String? servingQuantity,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'image_front_url') String? imageFrontUrl,
    @JsonKey(name: 'image_front_small_url') String? imageFrontSmallUrl,
    @JsonKey(name: 'image_nutrition_url') String? imageNutritionUrl,
    @JsonKey(name: 'image_ingredients_url') String? imageIngredientsUrl,
    @JsonKey(name: 'selected_images') Map<String, dynamic>? selectedImages,
    @JsonKey(name: 'ingredients') List<Ingredient>? ingredientsList,
    @JsonKey(name: 'ingredients_text') String? ingredientsText,
    @JsonKey(name: 'ingredients_text_en') String? ingredientsTextEn,
    @JsonKey(name: 'ingredients_tags') List<String>? ingredientsTags,
    @JsonKey(name: 'ingredients_analysis_tags')
    List<String>? ingredientsAnalysisTags,
    @JsonKey(name: 'ingredients_sweeteners_n') int? ingredientsSweetenersN,
    @JsonKey(name: 'sugars_100g') double sugarsPer100g,
    @JsonKey(name: 'sugars_serving') double? sugarsServing,
    @JsonKey(name: 'nutriments') Map<String, dynamic>? nutriments,
    @JsonKey(name: 'nutrient_levels') Map<String, String>? nutrientLevels,
    @JsonKey(name: 'nutriscore_grade') String? nutriscoreGrade,
    @JsonKey(name: 'nutriscore_score') int? nutriscoreScore,
    @JsonKey(name: 'nutriscore_data') Map<String, dynamic>? nutriscoreData,
    @JsonKey(name: 'categories') String? categories,
    @JsonKey(name: 'categories_hierarchy') List<String>? categoriesHierarchy,
    @JsonKey(name: 'categories_tags') List<String>? categoriesTags,
    @JsonKey(name: 'additives') String? additives,
    @JsonKey(name: 'additives_tags') List<String>? additivesTags,
    @JsonKey(name: 'additives_original_tags')
    List<String>? additivesOriginalTags,
    @JsonKey(name: 'allergens') String? allergens,
    @JsonKey(name: 'allergens_tags') List<String>? allergensTags,
    @JsonKey(name: 'allergens_from_ingredients')
    String? allergensFromIngredients,
    @JsonKey(name: 'allergens_from_user') String? allergensFromUser,
    @JsonKey(name: 'traces') String? traces,
    @JsonKey(name: 'traces_tags') List<String>? tracesTags,
    @JsonKey(name: 'labels') String? labels,
    @JsonKey(name: 'labels_tags') List<String>? labelsTags,
    @JsonKey(name: 'labels_hierarchy') List<String>? labelsHierarchy,
    @JsonKey(name: 'ecoscore_grade') String? ecoscoreGrade,
    @JsonKey(name: 'ecoscore_score') int? ecoscoreScore,
    @JsonKey(name: 'nova_group') int? novaGroup,
    @JsonKey(name: 'nova_groups') String? novaGroups,
    @JsonKey(name: 'processing') String? processing,
    @JsonKey(name: 'processing_tags') List<String>? processingTags,
    @JsonKey(name: 'packaging') String? packaging,
    @JsonKey(name: 'packaging_tags') List<String>? packagingTags,
    @JsonKey(name: 'countries') String? countries,
    @JsonKey(name: 'countries_tags') List<String>? countriesTags,
    @JsonKey(name: 'origins') String? origins,
    @JsonKey(name: 'origins_tags') List<String>? originsTags,
    @JsonKey(name: 'stores') String? stores,
    @JsonKey(name: 'stores_tags') List<String>? storesTags,
    @JsonKey(name: 'purchase_places') String? purchasePlaces,
    @JsonKey(name: 'purchase_places_tags') List<String>? purchasePlacesTags,
    @JsonKey(name: 'emb_codes') String? embCodes,
    @JsonKey(name: 'emb_codes_tags') List<String>? embCodesTags,
    @JsonKey(name: 'creator') String? creator,
    @JsonKey(name: 'created_t') int? createdT,
    @JsonKey(name: 'last_modified_t') int? lastModifiedT,
    @JsonKey(name: 'completeness') double? completeness,
    @JsonKey(name: 'popularity_tags') List<String>? popularityTags,
    @JsonKey(name: 'states') String? states,
    @JsonKey(name: 'states_tags') List<String>? statesTags,
    @JsonKey(name: 'interface_version_created') String? interfaceVersionCreated,
    @JsonKey(name: 'interface_version_modified')
    String? interfaceVersionModified,
    @JsonKey(name: 'unknown_nutrients_tags') List<String>? unknownNutrientsTags,
    @JsonKey(name: 'ingredients_n') int? ingredientsN,
    @JsonKey(name: 'rev') int? rev,
    @JsonKey(name: 'no_nutriments') String? noNutriments,
    @JsonKey(name: 'ingredients_that_may_be_from_palm_oil_n')
    int? ingredientsThatMayBeFromPalmOilN,
    @JsonKey(name: 'ingredients_from_palm_oil_n') int? ingredientsFromPalmOilN,
    @JsonKey(name: 'ingredients_from_or_that_may_be_from_palm_oil_n')
    int? ingredientsFromOrThatMayBeFromPalmOilN,
    @JsonKey(name: 'nutrition_grade_fr') String? nutritionGradeFr,
    @JsonKey(name: 'pnns_groups_1') String? pnnsGroups1,
    @JsonKey(name: 'pnns_groups_2') String? pnnsGroups2,
    @JsonKey(name: 'food_groups') String? foodGroups,
    @JsonKey(name: 'food_groups_tags') List<String>? foodGroupsTags,
    @JsonKey(name: 'other_information') String? otherInformation,
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
    Object? genericName = freezed,
    Object? brands = freezed,
    Object? brandsTags = freezed,
    Object? quantity = freezed,
    Object? productQuantity = freezed,
    Object? productQuantityUnit = freezed,
    Object? servingSize = freezed,
    Object? servingQuantity = freezed,
    Object? imageUrl = freezed,
    Object? imageFrontUrl = freezed,
    Object? imageFrontSmallUrl = freezed,
    Object? imageNutritionUrl = freezed,
    Object? imageIngredientsUrl = freezed,
    Object? selectedImages = freezed,
    Object? ingredientsList = freezed,
    Object? ingredientsText = freezed,
    Object? ingredientsTextEn = freezed,
    Object? ingredientsTags = freezed,
    Object? ingredientsAnalysisTags = freezed,
    Object? ingredientsSweetenersN = freezed,
    Object? sugarsPer100g = null,
    Object? sugarsServing = freezed,
    Object? nutriments = freezed,
    Object? nutrientLevels = freezed,
    Object? nutriscoreGrade = freezed,
    Object? nutriscoreScore = freezed,
    Object? nutriscoreData = freezed,
    Object? categories = freezed,
    Object? categoriesHierarchy = freezed,
    Object? categoriesTags = freezed,
    Object? additives = freezed,
    Object? additivesTags = freezed,
    Object? additivesOriginalTags = freezed,
    Object? allergens = freezed,
    Object? allergensTags = freezed,
    Object? allergensFromIngredients = freezed,
    Object? allergensFromUser = freezed,
    Object? traces = freezed,
    Object? tracesTags = freezed,
    Object? labels = freezed,
    Object? labelsTags = freezed,
    Object? labelsHierarchy = freezed,
    Object? ecoscoreGrade = freezed,
    Object? ecoscoreScore = freezed,
    Object? novaGroup = freezed,
    Object? novaGroups = freezed,
    Object? processing = freezed,
    Object? processingTags = freezed,
    Object? packaging = freezed,
    Object? packagingTags = freezed,
    Object? countries = freezed,
    Object? countriesTags = freezed,
    Object? origins = freezed,
    Object? originsTags = freezed,
    Object? stores = freezed,
    Object? storesTags = freezed,
    Object? purchasePlaces = freezed,
    Object? purchasePlacesTags = freezed,
    Object? embCodes = freezed,
    Object? embCodesTags = freezed,
    Object? creator = freezed,
    Object? createdT = freezed,
    Object? lastModifiedT = freezed,
    Object? completeness = freezed,
    Object? popularityTags = freezed,
    Object? states = freezed,
    Object? statesTags = freezed,
    Object? interfaceVersionCreated = freezed,
    Object? interfaceVersionModified = freezed,
    Object? unknownNutrientsTags = freezed,
    Object? ingredientsN = freezed,
    Object? rev = freezed,
    Object? noNutriments = freezed,
    Object? ingredientsThatMayBeFromPalmOilN = freezed,
    Object? ingredientsFromPalmOilN = freezed,
    Object? ingredientsFromOrThatMayBeFromPalmOilN = freezed,
    Object? nutritionGradeFr = freezed,
    Object? pnnsGroups1 = freezed,
    Object? pnnsGroups2 = freezed,
    Object? foodGroups = freezed,
    Object? foodGroupsTags = freezed,
    Object? otherInformation = freezed,
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
            genericName: freezed == genericName
                ? _value.genericName
                : genericName // ignore: cast_nullable_to_non_nullable
                      as String?,
            brands: freezed == brands
                ? _value.brands
                : brands // ignore: cast_nullable_to_non_nullable
                      as String?,
            brandsTags: freezed == brandsTags
                ? _value.brandsTags
                : brandsTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
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
            servingSize: freezed == servingSize
                ? _value.servingSize
                : servingSize // ignore: cast_nullable_to_non_nullable
                      as String?,
            servingQuantity: freezed == servingQuantity
                ? _value.servingQuantity
                : servingQuantity // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageFrontUrl: freezed == imageFrontUrl
                ? _value.imageFrontUrl
                : imageFrontUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageFrontSmallUrl: freezed == imageFrontSmallUrl
                ? _value.imageFrontSmallUrl
                : imageFrontSmallUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageNutritionUrl: freezed == imageNutritionUrl
                ? _value.imageNutritionUrl
                : imageNutritionUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageIngredientsUrl: freezed == imageIngredientsUrl
                ? _value.imageIngredientsUrl
                : imageIngredientsUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            selectedImages: freezed == selectedImages
                ? _value.selectedImages
                : selectedImages // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            ingredientsList: freezed == ingredientsList
                ? _value.ingredientsList
                : ingredientsList // ignore: cast_nullable_to_non_nullable
                      as List<Ingredient>?,
            ingredientsText: freezed == ingredientsText
                ? _value.ingredientsText
                : ingredientsText // ignore: cast_nullable_to_non_nullable
                      as String?,
            ingredientsTextEn: freezed == ingredientsTextEn
                ? _value.ingredientsTextEn
                : ingredientsTextEn // ignore: cast_nullable_to_non_nullable
                      as String?,
            ingredientsTags: freezed == ingredientsTags
                ? _value.ingredientsTags
                : ingredientsTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            ingredientsAnalysisTags: freezed == ingredientsAnalysisTags
                ? _value.ingredientsAnalysisTags
                : ingredientsAnalysisTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            ingredientsSweetenersN: freezed == ingredientsSweetenersN
                ? _value.ingredientsSweetenersN
                : ingredientsSweetenersN // ignore: cast_nullable_to_non_nullable
                      as int?,
            sugarsPer100g: null == sugarsPer100g
                ? _value.sugarsPer100g
                : sugarsPer100g // ignore: cast_nullable_to_non_nullable
                      as double,
            sugarsServing: freezed == sugarsServing
                ? _value.sugarsServing
                : sugarsServing // ignore: cast_nullable_to_non_nullable
                      as double?,
            nutriments: freezed == nutriments
                ? _value.nutriments
                : nutriments // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            nutrientLevels: freezed == nutrientLevels
                ? _value.nutrientLevels
                : nutrientLevels // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>?,
            nutriscoreGrade: freezed == nutriscoreGrade
                ? _value.nutriscoreGrade
                : nutriscoreGrade // ignore: cast_nullable_to_non_nullable
                      as String?,
            nutriscoreScore: freezed == nutriscoreScore
                ? _value.nutriscoreScore
                : nutriscoreScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            nutriscoreData: freezed == nutriscoreData
                ? _value.nutriscoreData
                : nutriscoreData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
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
            additives: freezed == additives
                ? _value.additives
                : additives // ignore: cast_nullable_to_non_nullable
                      as String?,
            additivesTags: freezed == additivesTags
                ? _value.additivesTags
                : additivesTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            additivesOriginalTags: freezed == additivesOriginalTags
                ? _value.additivesOriginalTags
                : additivesOriginalTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            allergens: freezed == allergens
                ? _value.allergens
                : allergens // ignore: cast_nullable_to_non_nullable
                      as String?,
            allergensTags: freezed == allergensTags
                ? _value.allergensTags
                : allergensTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            allergensFromIngredients: freezed == allergensFromIngredients
                ? _value.allergensFromIngredients
                : allergensFromIngredients // ignore: cast_nullable_to_non_nullable
                      as String?,
            allergensFromUser: freezed == allergensFromUser
                ? _value.allergensFromUser
                : allergensFromUser // ignore: cast_nullable_to_non_nullable
                      as String?,
            traces: freezed == traces
                ? _value.traces
                : traces // ignore: cast_nullable_to_non_nullable
                      as String?,
            tracesTags: freezed == tracesTags
                ? _value.tracesTags
                : tracesTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            labels: freezed == labels
                ? _value.labels
                : labels // ignore: cast_nullable_to_non_nullable
                      as String?,
            labelsTags: freezed == labelsTags
                ? _value.labelsTags
                : labelsTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            labelsHierarchy: freezed == labelsHierarchy
                ? _value.labelsHierarchy
                : labelsHierarchy // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            ecoscoreGrade: freezed == ecoscoreGrade
                ? _value.ecoscoreGrade
                : ecoscoreGrade // ignore: cast_nullable_to_non_nullable
                      as String?,
            ecoscoreScore: freezed == ecoscoreScore
                ? _value.ecoscoreScore
                : ecoscoreScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            novaGroup: freezed == novaGroup
                ? _value.novaGroup
                : novaGroup // ignore: cast_nullable_to_non_nullable
                      as int?,
            novaGroups: freezed == novaGroups
                ? _value.novaGroups
                : novaGroups // ignore: cast_nullable_to_non_nullable
                      as String?,
            processing: freezed == processing
                ? _value.processing
                : processing // ignore: cast_nullable_to_non_nullable
                      as String?,
            processingTags: freezed == processingTags
                ? _value.processingTags
                : processingTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            packaging: freezed == packaging
                ? _value.packaging
                : packaging // ignore: cast_nullable_to_non_nullable
                      as String?,
            packagingTags: freezed == packagingTags
                ? _value.packagingTags
                : packagingTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            countries: freezed == countries
                ? _value.countries
                : countries // ignore: cast_nullable_to_non_nullable
                      as String?,
            countriesTags: freezed == countriesTags
                ? _value.countriesTags
                : countriesTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            origins: freezed == origins
                ? _value.origins
                : origins // ignore: cast_nullable_to_non_nullable
                      as String?,
            originsTags: freezed == originsTags
                ? _value.originsTags
                : originsTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            stores: freezed == stores
                ? _value.stores
                : stores // ignore: cast_nullable_to_non_nullable
                      as String?,
            storesTags: freezed == storesTags
                ? _value.storesTags
                : storesTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            purchasePlaces: freezed == purchasePlaces
                ? _value.purchasePlaces
                : purchasePlaces // ignore: cast_nullable_to_non_nullable
                      as String?,
            purchasePlacesTags: freezed == purchasePlacesTags
                ? _value.purchasePlacesTags
                : purchasePlacesTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            embCodes: freezed == embCodes
                ? _value.embCodes
                : embCodes // ignore: cast_nullable_to_non_nullable
                      as String?,
            embCodesTags: freezed == embCodesTags
                ? _value.embCodesTags
                : embCodesTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            creator: freezed == creator
                ? _value.creator
                : creator // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdT: freezed == createdT
                ? _value.createdT
                : createdT // ignore: cast_nullable_to_non_nullable
                      as int?,
            lastModifiedT: freezed == lastModifiedT
                ? _value.lastModifiedT
                : lastModifiedT // ignore: cast_nullable_to_non_nullable
                      as int?,
            completeness: freezed == completeness
                ? _value.completeness
                : completeness // ignore: cast_nullable_to_non_nullable
                      as double?,
            popularityTags: freezed == popularityTags
                ? _value.popularityTags
                : popularityTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            states: freezed == states
                ? _value.states
                : states // ignore: cast_nullable_to_non_nullable
                      as String?,
            statesTags: freezed == statesTags
                ? _value.statesTags
                : statesTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            interfaceVersionCreated: freezed == interfaceVersionCreated
                ? _value.interfaceVersionCreated
                : interfaceVersionCreated // ignore: cast_nullable_to_non_nullable
                      as String?,
            interfaceVersionModified: freezed == interfaceVersionModified
                ? _value.interfaceVersionModified
                : interfaceVersionModified // ignore: cast_nullable_to_non_nullable
                      as String?,
            unknownNutrientsTags: freezed == unknownNutrientsTags
                ? _value.unknownNutrientsTags
                : unknownNutrientsTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            ingredientsN: freezed == ingredientsN
                ? _value.ingredientsN
                : ingredientsN // ignore: cast_nullable_to_non_nullable
                      as int?,
            rev: freezed == rev
                ? _value.rev
                : rev // ignore: cast_nullable_to_non_nullable
                      as int?,
            noNutriments: freezed == noNutriments
                ? _value.noNutriments
                : noNutriments // ignore: cast_nullable_to_non_nullable
                      as String?,
            ingredientsThatMayBeFromPalmOilN:
                freezed == ingredientsThatMayBeFromPalmOilN
                ? _value.ingredientsThatMayBeFromPalmOilN
                : ingredientsThatMayBeFromPalmOilN // ignore: cast_nullable_to_non_nullable
                      as int?,
            ingredientsFromPalmOilN: freezed == ingredientsFromPalmOilN
                ? _value.ingredientsFromPalmOilN
                : ingredientsFromPalmOilN // ignore: cast_nullable_to_non_nullable
                      as int?,
            ingredientsFromOrThatMayBeFromPalmOilN:
                freezed == ingredientsFromOrThatMayBeFromPalmOilN
                ? _value.ingredientsFromOrThatMayBeFromPalmOilN
                : ingredientsFromOrThatMayBeFromPalmOilN // ignore: cast_nullable_to_non_nullable
                      as int?,
            nutritionGradeFr: freezed == nutritionGradeFr
                ? _value.nutritionGradeFr
                : nutritionGradeFr // ignore: cast_nullable_to_non_nullable
                      as String?,
            pnnsGroups1: freezed == pnnsGroups1
                ? _value.pnnsGroups1
                : pnnsGroups1 // ignore: cast_nullable_to_non_nullable
                      as String?,
            pnnsGroups2: freezed == pnnsGroups2
                ? _value.pnnsGroups2
                : pnnsGroups2 // ignore: cast_nullable_to_non_nullable
                      as String?,
            foodGroups: freezed == foodGroups
                ? _value.foodGroups
                : foodGroups // ignore: cast_nullable_to_non_nullable
                      as String?,
            foodGroupsTags: freezed == foodGroupsTags
                ? _value.foodGroupsTags
                : foodGroupsTags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            otherInformation: freezed == otherInformation
                ? _value.otherInformation
                : otherInformation // ignore: cast_nullable_to_non_nullable
                      as String?,
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
    @JsonKey(name: 'generic_name') String? genericName,
    @JsonKey(name: 'brands') String? brands,
    @JsonKey(name: 'brands_tags') List<String>? brandsTags,
    @JsonKey(name: 'quantity') String? quantity,
    @JsonKey(name: 'product_quantity') String? productQuantity,
    @JsonKey(name: 'product_quantity_unit') String? productQuantityUnit,
    @JsonKey(name: 'serving_size') String? servingSize,
    @JsonKey(name: 'serving_quantity') String? servingQuantity,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'image_front_url') String? imageFrontUrl,
    @JsonKey(name: 'image_front_small_url') String? imageFrontSmallUrl,
    @JsonKey(name: 'image_nutrition_url') String? imageNutritionUrl,
    @JsonKey(name: 'image_ingredients_url') String? imageIngredientsUrl,
    @JsonKey(name: 'selected_images') Map<String, dynamic>? selectedImages,
    @JsonKey(name: 'ingredients') List<Ingredient>? ingredientsList,
    @JsonKey(name: 'ingredients_text') String? ingredientsText,
    @JsonKey(name: 'ingredients_text_en') String? ingredientsTextEn,
    @JsonKey(name: 'ingredients_tags') List<String>? ingredientsTags,
    @JsonKey(name: 'ingredients_analysis_tags')
    List<String>? ingredientsAnalysisTags,
    @JsonKey(name: 'ingredients_sweeteners_n') int? ingredientsSweetenersN,
    @JsonKey(name: 'sugars_100g') double sugarsPer100g,
    @JsonKey(name: 'sugars_serving') double? sugarsServing,
    @JsonKey(name: 'nutriments') Map<String, dynamic>? nutriments,
    @JsonKey(name: 'nutrient_levels') Map<String, String>? nutrientLevels,
    @JsonKey(name: 'nutriscore_grade') String? nutriscoreGrade,
    @JsonKey(name: 'nutriscore_score') int? nutriscoreScore,
    @JsonKey(name: 'nutriscore_data') Map<String, dynamic>? nutriscoreData,
    @JsonKey(name: 'categories') String? categories,
    @JsonKey(name: 'categories_hierarchy') List<String>? categoriesHierarchy,
    @JsonKey(name: 'categories_tags') List<String>? categoriesTags,
    @JsonKey(name: 'additives') String? additives,
    @JsonKey(name: 'additives_tags') List<String>? additivesTags,
    @JsonKey(name: 'additives_original_tags')
    List<String>? additivesOriginalTags,
    @JsonKey(name: 'allergens') String? allergens,
    @JsonKey(name: 'allergens_tags') List<String>? allergensTags,
    @JsonKey(name: 'allergens_from_ingredients')
    String? allergensFromIngredients,
    @JsonKey(name: 'allergens_from_user') String? allergensFromUser,
    @JsonKey(name: 'traces') String? traces,
    @JsonKey(name: 'traces_tags') List<String>? tracesTags,
    @JsonKey(name: 'labels') String? labels,
    @JsonKey(name: 'labels_tags') List<String>? labelsTags,
    @JsonKey(name: 'labels_hierarchy') List<String>? labelsHierarchy,
    @JsonKey(name: 'ecoscore_grade') String? ecoscoreGrade,
    @JsonKey(name: 'ecoscore_score') int? ecoscoreScore,
    @JsonKey(name: 'nova_group') int? novaGroup,
    @JsonKey(name: 'nova_groups') String? novaGroups,
    @JsonKey(name: 'processing') String? processing,
    @JsonKey(name: 'processing_tags') List<String>? processingTags,
    @JsonKey(name: 'packaging') String? packaging,
    @JsonKey(name: 'packaging_tags') List<String>? packagingTags,
    @JsonKey(name: 'countries') String? countries,
    @JsonKey(name: 'countries_tags') List<String>? countriesTags,
    @JsonKey(name: 'origins') String? origins,
    @JsonKey(name: 'origins_tags') List<String>? originsTags,
    @JsonKey(name: 'stores') String? stores,
    @JsonKey(name: 'stores_tags') List<String>? storesTags,
    @JsonKey(name: 'purchase_places') String? purchasePlaces,
    @JsonKey(name: 'purchase_places_tags') List<String>? purchasePlacesTags,
    @JsonKey(name: 'emb_codes') String? embCodes,
    @JsonKey(name: 'emb_codes_tags') List<String>? embCodesTags,
    @JsonKey(name: 'creator') String? creator,
    @JsonKey(name: 'created_t') int? createdT,
    @JsonKey(name: 'last_modified_t') int? lastModifiedT,
    @JsonKey(name: 'completeness') double? completeness,
    @JsonKey(name: 'popularity_tags') List<String>? popularityTags,
    @JsonKey(name: 'states') String? states,
    @JsonKey(name: 'states_tags') List<String>? statesTags,
    @JsonKey(name: 'interface_version_created') String? interfaceVersionCreated,
    @JsonKey(name: 'interface_version_modified')
    String? interfaceVersionModified,
    @JsonKey(name: 'unknown_nutrients_tags') List<String>? unknownNutrientsTags,
    @JsonKey(name: 'ingredients_n') int? ingredientsN,
    @JsonKey(name: 'rev') int? rev,
    @JsonKey(name: 'no_nutriments') String? noNutriments,
    @JsonKey(name: 'ingredients_that_may_be_from_palm_oil_n')
    int? ingredientsThatMayBeFromPalmOilN,
    @JsonKey(name: 'ingredients_from_palm_oil_n') int? ingredientsFromPalmOilN,
    @JsonKey(name: 'ingredients_from_or_that_may_be_from_palm_oil_n')
    int? ingredientsFromOrThatMayBeFromPalmOilN,
    @JsonKey(name: 'nutrition_grade_fr') String? nutritionGradeFr,
    @JsonKey(name: 'pnns_groups_1') String? pnnsGroups1,
    @JsonKey(name: 'pnns_groups_2') String? pnnsGroups2,
    @JsonKey(name: 'food_groups') String? foodGroups,
    @JsonKey(name: 'food_groups_tags') List<String>? foodGroupsTags,
    @JsonKey(name: 'other_information') String? otherInformation,
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
    Object? genericName = freezed,
    Object? brands = freezed,
    Object? brandsTags = freezed,
    Object? quantity = freezed,
    Object? productQuantity = freezed,
    Object? productQuantityUnit = freezed,
    Object? servingSize = freezed,
    Object? servingQuantity = freezed,
    Object? imageUrl = freezed,
    Object? imageFrontUrl = freezed,
    Object? imageFrontSmallUrl = freezed,
    Object? imageNutritionUrl = freezed,
    Object? imageIngredientsUrl = freezed,
    Object? selectedImages = freezed,
    Object? ingredientsList = freezed,
    Object? ingredientsText = freezed,
    Object? ingredientsTextEn = freezed,
    Object? ingredientsTags = freezed,
    Object? ingredientsAnalysisTags = freezed,
    Object? ingredientsSweetenersN = freezed,
    Object? sugarsPer100g = null,
    Object? sugarsServing = freezed,
    Object? nutriments = freezed,
    Object? nutrientLevels = freezed,
    Object? nutriscoreGrade = freezed,
    Object? nutriscoreScore = freezed,
    Object? nutriscoreData = freezed,
    Object? categories = freezed,
    Object? categoriesHierarchy = freezed,
    Object? categoriesTags = freezed,
    Object? additives = freezed,
    Object? additivesTags = freezed,
    Object? additivesOriginalTags = freezed,
    Object? allergens = freezed,
    Object? allergensTags = freezed,
    Object? allergensFromIngredients = freezed,
    Object? allergensFromUser = freezed,
    Object? traces = freezed,
    Object? tracesTags = freezed,
    Object? labels = freezed,
    Object? labelsTags = freezed,
    Object? labelsHierarchy = freezed,
    Object? ecoscoreGrade = freezed,
    Object? ecoscoreScore = freezed,
    Object? novaGroup = freezed,
    Object? novaGroups = freezed,
    Object? processing = freezed,
    Object? processingTags = freezed,
    Object? packaging = freezed,
    Object? packagingTags = freezed,
    Object? countries = freezed,
    Object? countriesTags = freezed,
    Object? origins = freezed,
    Object? originsTags = freezed,
    Object? stores = freezed,
    Object? storesTags = freezed,
    Object? purchasePlaces = freezed,
    Object? purchasePlacesTags = freezed,
    Object? embCodes = freezed,
    Object? embCodesTags = freezed,
    Object? creator = freezed,
    Object? createdT = freezed,
    Object? lastModifiedT = freezed,
    Object? completeness = freezed,
    Object? popularityTags = freezed,
    Object? states = freezed,
    Object? statesTags = freezed,
    Object? interfaceVersionCreated = freezed,
    Object? interfaceVersionModified = freezed,
    Object? unknownNutrientsTags = freezed,
    Object? ingredientsN = freezed,
    Object? rev = freezed,
    Object? noNutriments = freezed,
    Object? ingredientsThatMayBeFromPalmOilN = freezed,
    Object? ingredientsFromPalmOilN = freezed,
    Object? ingredientsFromOrThatMayBeFromPalmOilN = freezed,
    Object? nutritionGradeFr = freezed,
    Object? pnnsGroups1 = freezed,
    Object? pnnsGroups2 = freezed,
    Object? foodGroups = freezed,
    Object? foodGroupsTags = freezed,
    Object? otherInformation = freezed,
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
        genericName: freezed == genericName
            ? _value.genericName
            : genericName // ignore: cast_nullable_to_non_nullable
                  as String?,
        brands: freezed == brands
            ? _value.brands
            : brands // ignore: cast_nullable_to_non_nullable
                  as String?,
        brandsTags: freezed == brandsTags
            ? _value._brandsTags
            : brandsTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
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
        servingSize: freezed == servingSize
            ? _value.servingSize
            : servingSize // ignore: cast_nullable_to_non_nullable
                  as String?,
        servingQuantity: freezed == servingQuantity
            ? _value.servingQuantity
            : servingQuantity // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageFrontUrl: freezed == imageFrontUrl
            ? _value.imageFrontUrl
            : imageFrontUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageFrontSmallUrl: freezed == imageFrontSmallUrl
            ? _value.imageFrontSmallUrl
            : imageFrontSmallUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageNutritionUrl: freezed == imageNutritionUrl
            ? _value.imageNutritionUrl
            : imageNutritionUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageIngredientsUrl: freezed == imageIngredientsUrl
            ? _value.imageIngredientsUrl
            : imageIngredientsUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        selectedImages: freezed == selectedImages
            ? _value._selectedImages
            : selectedImages // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        ingredientsList: freezed == ingredientsList
            ? _value._ingredientsList
            : ingredientsList // ignore: cast_nullable_to_non_nullable
                  as List<Ingredient>?,
        ingredientsText: freezed == ingredientsText
            ? _value.ingredientsText
            : ingredientsText // ignore: cast_nullable_to_non_nullable
                  as String?,
        ingredientsTextEn: freezed == ingredientsTextEn
            ? _value.ingredientsTextEn
            : ingredientsTextEn // ignore: cast_nullable_to_non_nullable
                  as String?,
        ingredientsTags: freezed == ingredientsTags
            ? _value._ingredientsTags
            : ingredientsTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        ingredientsAnalysisTags: freezed == ingredientsAnalysisTags
            ? _value._ingredientsAnalysisTags
            : ingredientsAnalysisTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        ingredientsSweetenersN: freezed == ingredientsSweetenersN
            ? _value.ingredientsSweetenersN
            : ingredientsSweetenersN // ignore: cast_nullable_to_non_nullable
                  as int?,
        sugarsPer100g: null == sugarsPer100g
            ? _value.sugarsPer100g
            : sugarsPer100g // ignore: cast_nullable_to_non_nullable
                  as double,
        sugarsServing: freezed == sugarsServing
            ? _value.sugarsServing
            : sugarsServing // ignore: cast_nullable_to_non_nullable
                  as double?,
        nutriments: freezed == nutriments
            ? _value._nutriments
            : nutriments // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        nutrientLevels: freezed == nutrientLevels
            ? _value._nutrientLevels
            : nutrientLevels // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>?,
        nutriscoreGrade: freezed == nutriscoreGrade
            ? _value.nutriscoreGrade
            : nutriscoreGrade // ignore: cast_nullable_to_non_nullable
                  as String?,
        nutriscoreScore: freezed == nutriscoreScore
            ? _value.nutriscoreScore
            : nutriscoreScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        nutriscoreData: freezed == nutriscoreData
            ? _value._nutriscoreData
            : nutriscoreData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
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
        additives: freezed == additives
            ? _value.additives
            : additives // ignore: cast_nullable_to_non_nullable
                  as String?,
        additivesTags: freezed == additivesTags
            ? _value._additivesTags
            : additivesTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        additivesOriginalTags: freezed == additivesOriginalTags
            ? _value._additivesOriginalTags
            : additivesOriginalTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        allergens: freezed == allergens
            ? _value.allergens
            : allergens // ignore: cast_nullable_to_non_nullable
                  as String?,
        allergensTags: freezed == allergensTags
            ? _value._allergensTags
            : allergensTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        allergensFromIngredients: freezed == allergensFromIngredients
            ? _value.allergensFromIngredients
            : allergensFromIngredients // ignore: cast_nullable_to_non_nullable
                  as String?,
        allergensFromUser: freezed == allergensFromUser
            ? _value.allergensFromUser
            : allergensFromUser // ignore: cast_nullable_to_non_nullable
                  as String?,
        traces: freezed == traces
            ? _value.traces
            : traces // ignore: cast_nullable_to_non_nullable
                  as String?,
        tracesTags: freezed == tracesTags
            ? _value._tracesTags
            : tracesTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        labels: freezed == labels
            ? _value.labels
            : labels // ignore: cast_nullable_to_non_nullable
                  as String?,
        labelsTags: freezed == labelsTags
            ? _value._labelsTags
            : labelsTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        labelsHierarchy: freezed == labelsHierarchy
            ? _value._labelsHierarchy
            : labelsHierarchy // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        ecoscoreGrade: freezed == ecoscoreGrade
            ? _value.ecoscoreGrade
            : ecoscoreGrade // ignore: cast_nullable_to_non_nullable
                  as String?,
        ecoscoreScore: freezed == ecoscoreScore
            ? _value.ecoscoreScore
            : ecoscoreScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        novaGroup: freezed == novaGroup
            ? _value.novaGroup
            : novaGroup // ignore: cast_nullable_to_non_nullable
                  as int?,
        novaGroups: freezed == novaGroups
            ? _value.novaGroups
            : novaGroups // ignore: cast_nullable_to_non_nullable
                  as String?,
        processing: freezed == processing
            ? _value.processing
            : processing // ignore: cast_nullable_to_non_nullable
                  as String?,
        processingTags: freezed == processingTags
            ? _value._processingTags
            : processingTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        packaging: freezed == packaging
            ? _value.packaging
            : packaging // ignore: cast_nullable_to_non_nullable
                  as String?,
        packagingTags: freezed == packagingTags
            ? _value._packagingTags
            : packagingTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        countries: freezed == countries
            ? _value.countries
            : countries // ignore: cast_nullable_to_non_nullable
                  as String?,
        countriesTags: freezed == countriesTags
            ? _value._countriesTags
            : countriesTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        origins: freezed == origins
            ? _value.origins
            : origins // ignore: cast_nullable_to_non_nullable
                  as String?,
        originsTags: freezed == originsTags
            ? _value._originsTags
            : originsTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        stores: freezed == stores
            ? _value.stores
            : stores // ignore: cast_nullable_to_non_nullable
                  as String?,
        storesTags: freezed == storesTags
            ? _value._storesTags
            : storesTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        purchasePlaces: freezed == purchasePlaces
            ? _value.purchasePlaces
            : purchasePlaces // ignore: cast_nullable_to_non_nullable
                  as String?,
        purchasePlacesTags: freezed == purchasePlacesTags
            ? _value._purchasePlacesTags
            : purchasePlacesTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        embCodes: freezed == embCodes
            ? _value.embCodes
            : embCodes // ignore: cast_nullable_to_non_nullable
                  as String?,
        embCodesTags: freezed == embCodesTags
            ? _value._embCodesTags
            : embCodesTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        creator: freezed == creator
            ? _value.creator
            : creator // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdT: freezed == createdT
            ? _value.createdT
            : createdT // ignore: cast_nullable_to_non_nullable
                  as int?,
        lastModifiedT: freezed == lastModifiedT
            ? _value.lastModifiedT
            : lastModifiedT // ignore: cast_nullable_to_non_nullable
                  as int?,
        completeness: freezed == completeness
            ? _value.completeness
            : completeness // ignore: cast_nullable_to_non_nullable
                  as double?,
        popularityTags: freezed == popularityTags
            ? _value._popularityTags
            : popularityTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        states: freezed == states
            ? _value.states
            : states // ignore: cast_nullable_to_non_nullable
                  as String?,
        statesTags: freezed == statesTags
            ? _value._statesTags
            : statesTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        interfaceVersionCreated: freezed == interfaceVersionCreated
            ? _value.interfaceVersionCreated
            : interfaceVersionCreated // ignore: cast_nullable_to_non_nullable
                  as String?,
        interfaceVersionModified: freezed == interfaceVersionModified
            ? _value.interfaceVersionModified
            : interfaceVersionModified // ignore: cast_nullable_to_non_nullable
                  as String?,
        unknownNutrientsTags: freezed == unknownNutrientsTags
            ? _value._unknownNutrientsTags
            : unknownNutrientsTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        ingredientsN: freezed == ingredientsN
            ? _value.ingredientsN
            : ingredientsN // ignore: cast_nullable_to_non_nullable
                  as int?,
        rev: freezed == rev
            ? _value.rev
            : rev // ignore: cast_nullable_to_non_nullable
                  as int?,
        noNutriments: freezed == noNutriments
            ? _value.noNutriments
            : noNutriments // ignore: cast_nullable_to_non_nullable
                  as String?,
        ingredientsThatMayBeFromPalmOilN:
            freezed == ingredientsThatMayBeFromPalmOilN
            ? _value.ingredientsThatMayBeFromPalmOilN
            : ingredientsThatMayBeFromPalmOilN // ignore: cast_nullable_to_non_nullable
                  as int?,
        ingredientsFromPalmOilN: freezed == ingredientsFromPalmOilN
            ? _value.ingredientsFromPalmOilN
            : ingredientsFromPalmOilN // ignore: cast_nullable_to_non_nullable
                  as int?,
        ingredientsFromOrThatMayBeFromPalmOilN:
            freezed == ingredientsFromOrThatMayBeFromPalmOilN
            ? _value.ingredientsFromOrThatMayBeFromPalmOilN
            : ingredientsFromOrThatMayBeFromPalmOilN // ignore: cast_nullable_to_non_nullable
                  as int?,
        nutritionGradeFr: freezed == nutritionGradeFr
            ? _value.nutritionGradeFr
            : nutritionGradeFr // ignore: cast_nullable_to_non_nullable
                  as String?,
        pnnsGroups1: freezed == pnnsGroups1
            ? _value.pnnsGroups1
            : pnnsGroups1 // ignore: cast_nullable_to_non_nullable
                  as String?,
        pnnsGroups2: freezed == pnnsGroups2
            ? _value.pnnsGroups2
            : pnnsGroups2 // ignore: cast_nullable_to_non_nullable
                  as String?,
        foodGroups: freezed == foodGroups
            ? _value.foodGroups
            : foodGroups // ignore: cast_nullable_to_non_nullable
                  as String?,
        foodGroupsTags: freezed == foodGroupsTags
            ? _value._foodGroupsTags
            : foodGroupsTags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        otherInformation: freezed == otherInformation
            ? _value.otherInformation
            : otherInformation // ignore: cast_nullable_to_non_nullable
                  as String?,
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
    @JsonKey(name: 'generic_name') this.genericName,
    @JsonKey(name: 'brands') this.brands,
    @JsonKey(name: 'brands_tags') final List<String>? brandsTags,
    @JsonKey(name: 'quantity') this.quantity,
    @JsonKey(name: 'product_quantity') this.productQuantity,
    @JsonKey(name: 'product_quantity_unit') this.productQuantityUnit,
    @JsonKey(name: 'serving_size') this.servingSize,
    @JsonKey(name: 'serving_quantity') this.servingQuantity,
    @JsonKey(name: 'image_url') this.imageUrl,
    @JsonKey(name: 'image_front_url') this.imageFrontUrl,
    @JsonKey(name: 'image_front_small_url') this.imageFrontSmallUrl,
    @JsonKey(name: 'image_nutrition_url') this.imageNutritionUrl,
    @JsonKey(name: 'image_ingredients_url') this.imageIngredientsUrl,
    @JsonKey(name: 'selected_images')
    final Map<String, dynamic>? selectedImages,
    @JsonKey(name: 'ingredients') final List<Ingredient>? ingredientsList,
    @JsonKey(name: 'ingredients_text') this.ingredientsText,
    @JsonKey(name: 'ingredients_text_en') this.ingredientsTextEn,
    @JsonKey(name: 'ingredients_tags') final List<String>? ingredientsTags,
    @JsonKey(name: 'ingredients_analysis_tags')
    final List<String>? ingredientsAnalysisTags,
    @JsonKey(name: 'ingredients_sweeteners_n') this.ingredientsSweetenersN,
    @JsonKey(name: 'sugars_100g') required this.sugarsPer100g,
    @JsonKey(name: 'sugars_serving') this.sugarsServing,
    @JsonKey(name: 'nutriments') final Map<String, dynamic>? nutriments,
    @JsonKey(name: 'nutrient_levels') final Map<String, String>? nutrientLevels,
    @JsonKey(name: 'nutriscore_grade') this.nutriscoreGrade,
    @JsonKey(name: 'nutriscore_score') this.nutriscoreScore,
    @JsonKey(name: 'nutriscore_data')
    final Map<String, dynamic>? nutriscoreData,
    @JsonKey(name: 'categories') this.categories,
    @JsonKey(name: 'categories_hierarchy')
    final List<String>? categoriesHierarchy,
    @JsonKey(name: 'categories_tags') final List<String>? categoriesTags,
    @JsonKey(name: 'additives') this.additives,
    @JsonKey(name: 'additives_tags') final List<String>? additivesTags,
    @JsonKey(name: 'additives_original_tags')
    final List<String>? additivesOriginalTags,
    @JsonKey(name: 'allergens') this.allergens,
    @JsonKey(name: 'allergens_tags') final List<String>? allergensTags,
    @JsonKey(name: 'allergens_from_ingredients') this.allergensFromIngredients,
    @JsonKey(name: 'allergens_from_user') this.allergensFromUser,
    @JsonKey(name: 'traces') this.traces,
    @JsonKey(name: 'traces_tags') final List<String>? tracesTags,
    @JsonKey(name: 'labels') this.labels,
    @JsonKey(name: 'labels_tags') final List<String>? labelsTags,
    @JsonKey(name: 'labels_hierarchy') final List<String>? labelsHierarchy,
    @JsonKey(name: 'ecoscore_grade') this.ecoscoreGrade,
    @JsonKey(name: 'ecoscore_score') this.ecoscoreScore,
    @JsonKey(name: 'nova_group') this.novaGroup,
    @JsonKey(name: 'nova_groups') this.novaGroups,
    @JsonKey(name: 'processing') this.processing,
    @JsonKey(name: 'processing_tags') final List<String>? processingTags,
    @JsonKey(name: 'packaging') this.packaging,
    @JsonKey(name: 'packaging_tags') final List<String>? packagingTags,
    @JsonKey(name: 'countries') this.countries,
    @JsonKey(name: 'countries_tags') final List<String>? countriesTags,
    @JsonKey(name: 'origins') this.origins,
    @JsonKey(name: 'origins_tags') final List<String>? originsTags,
    @JsonKey(name: 'stores') this.stores,
    @JsonKey(name: 'stores_tags') final List<String>? storesTags,
    @JsonKey(name: 'purchase_places') this.purchasePlaces,
    @JsonKey(name: 'purchase_places_tags')
    final List<String>? purchasePlacesTags,
    @JsonKey(name: 'emb_codes') this.embCodes,
    @JsonKey(name: 'emb_codes_tags') final List<String>? embCodesTags,
    @JsonKey(name: 'creator') this.creator,
    @JsonKey(name: 'created_t') this.createdT,
    @JsonKey(name: 'last_modified_t') this.lastModifiedT,
    @JsonKey(name: 'completeness') this.completeness,
    @JsonKey(name: 'popularity_tags') final List<String>? popularityTags,
    @JsonKey(name: 'states') this.states,
    @JsonKey(name: 'states_tags') final List<String>? statesTags,
    @JsonKey(name: 'interface_version_created') this.interfaceVersionCreated,
    @JsonKey(name: 'interface_version_modified') this.interfaceVersionModified,
    @JsonKey(name: 'unknown_nutrients_tags')
    final List<String>? unknownNutrientsTags,
    @JsonKey(name: 'ingredients_n') this.ingredientsN,
    @JsonKey(name: 'rev') this.rev,
    @JsonKey(name: 'no_nutriments') this.noNutriments,
    @JsonKey(name: 'ingredients_that_may_be_from_palm_oil_n')
    this.ingredientsThatMayBeFromPalmOilN,
    @JsonKey(name: 'ingredients_from_palm_oil_n') this.ingredientsFromPalmOilN,
    @JsonKey(name: 'ingredients_from_or_that_may_be_from_palm_oil_n')
    this.ingredientsFromOrThatMayBeFromPalmOilN,
    @JsonKey(name: 'nutrition_grade_fr') this.nutritionGradeFr,
    @JsonKey(name: 'pnns_groups_1') this.pnnsGroups1,
    @JsonKey(name: 'pnns_groups_2') this.pnnsGroups2,
    @JsonKey(name: 'food_groups') this.foodGroups,
    @JsonKey(name: 'food_groups_tags') final List<String>? foodGroupsTags,
    @JsonKey(name: 'other_information') this.otherInformation,
  }) : _brandsTags = brandsTags,
       _selectedImages = selectedImages,
       _ingredientsList = ingredientsList,
       _ingredientsTags = ingredientsTags,
       _ingredientsAnalysisTags = ingredientsAnalysisTags,
       _nutriments = nutriments,
       _nutrientLevels = nutrientLevels,
       _nutriscoreData = nutriscoreData,
       _categoriesHierarchy = categoriesHierarchy,
       _categoriesTags = categoriesTags,
       _additivesTags = additivesTags,
       _additivesOriginalTags = additivesOriginalTags,
       _allergensTags = allergensTags,
       _tracesTags = tracesTags,
       _labelsTags = labelsTags,
       _labelsHierarchy = labelsHierarchy,
       _processingTags = processingTags,
       _packagingTags = packagingTags,
       _countriesTags = countriesTags,
       _originsTags = originsTags,
       _storesTags = storesTags,
       _purchasePlacesTags = purchasePlacesTags,
       _embCodesTags = embCodesTags,
       _popularityTags = popularityTags,
       _statesTags = statesTags,
       _unknownNutrientsTags = unknownNutrientsTags,
       _foodGroupsTags = foodGroupsTags;

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
  @JsonKey(name: 'generic_name')
  final String? genericName;
  @override
  @JsonKey(name: 'brands')
  final String? brands;
  final List<String>? _brandsTags;
  @override
  @JsonKey(name: 'brands_tags')
  List<String>? get brandsTags {
    final value = _brandsTags;
    if (value == null) return null;
    if (_brandsTags is EqualUnmodifiableListView) return _brandsTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'quantity')
  final String? quantity;
  @override
  @JsonKey(name: 'product_quantity')
  final String? productQuantity;
  @override
  @JsonKey(name: 'product_quantity_unit')
  final String? productQuantityUnit;
  @override
  @JsonKey(name: 'serving_size')
  final String? servingSize;
  @override
  @JsonKey(name: 'serving_quantity')
  final String? servingQuantity;
  // Images
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'image_front_url')
  final String? imageFrontUrl;
  @override
  @JsonKey(name: 'image_front_small_url')
  final String? imageFrontSmallUrl;
  @override
  @JsonKey(name: 'image_nutrition_url')
  final String? imageNutritionUrl;
  @override
  @JsonKey(name: 'image_ingredients_url')
  final String? imageIngredientsUrl;
  final Map<String, dynamic>? _selectedImages;
  @override
  @JsonKey(name: 'selected_images')
  Map<String, dynamic>? get selectedImages {
    final value = _selectedImages;
    if (value == null) return null;
    if (_selectedImages is EqualUnmodifiableMapView) return _selectedImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  // Ingredients
  final List<Ingredient>? _ingredientsList;
  // Ingredients
  @override
  @JsonKey(name: 'ingredients')
  List<Ingredient>? get ingredientsList {
    final value = _ingredientsList;
    if (value == null) return null;
    if (_ingredientsList is EqualUnmodifiableListView) return _ingredientsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'ingredients_text')
  final String? ingredientsText;
  @override
  @JsonKey(name: 'ingredients_text_en')
  final String? ingredientsTextEn;
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

  final List<String>? _ingredientsAnalysisTags;
  @override
  @JsonKey(name: 'ingredients_analysis_tags')
  List<String>? get ingredientsAnalysisTags {
    final value = _ingredientsAnalysisTags;
    if (value == null) return null;
    if (_ingredientsAnalysisTags is EqualUnmodifiableListView)
      return _ingredientsAnalysisTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'ingredients_sweeteners_n')
  final int? ingredientsSweetenersN;
  // Nutrition
  @override
  @JsonKey(name: 'sugars_100g')
  final double sugarsPer100g;
  @override
  @JsonKey(name: 'sugars_serving')
  final double? sugarsServing;
  final Map<String, dynamic>? _nutriments;
  @override
  @JsonKey(name: 'nutriments')
  Map<String, dynamic>? get nutriments {
    final value = _nutriments;
    if (value == null) return null;
    if (_nutriments is EqualUnmodifiableMapView) return _nutriments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, String>? _nutrientLevels;
  @override
  @JsonKey(name: 'nutrient_levels')
  Map<String, String>? get nutrientLevels {
    final value = _nutrientLevels;
    if (value == null) return null;
    if (_nutrientLevels is EqualUnmodifiableMapView) return _nutrientLevels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'nutriscore_grade')
  final String? nutriscoreGrade;
  @override
  @JsonKey(name: 'nutriscore_score')
  final int? nutriscoreScore;
  final Map<String, dynamic>? _nutriscoreData;
  @override
  @JsonKey(name: 'nutriscore_data')
  Map<String, dynamic>? get nutriscoreData {
    final value = _nutriscoreData;
    if (value == null) return null;
    if (_nutriscoreData is EqualUnmodifiableMapView) return _nutriscoreData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  // Categories
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

  // Additives, Allergens, Traces
  @override
  @JsonKey(name: 'additives')
  final String? additives;
  final List<String>? _additivesTags;
  @override
  @JsonKey(name: 'additives_tags')
  List<String>? get additivesTags {
    final value = _additivesTags;
    if (value == null) return null;
    if (_additivesTags is EqualUnmodifiableListView) return _additivesTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _additivesOriginalTags;
  @override
  @JsonKey(name: 'additives_original_tags')
  List<String>? get additivesOriginalTags {
    final value = _additivesOriginalTags;
    if (value == null) return null;
    if (_additivesOriginalTags is EqualUnmodifiableListView)
      return _additivesOriginalTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'allergens')
  final String? allergens;
  final List<String>? _allergensTags;
  @override
  @JsonKey(name: 'allergens_tags')
  List<String>? get allergensTags {
    final value = _allergensTags;
    if (value == null) return null;
    if (_allergensTags is EqualUnmodifiableListView) return _allergensTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'allergens_from_ingredients')
  final String? allergensFromIngredients;
  @override
  @JsonKey(name: 'allergens_from_user')
  final String? allergensFromUser;
  @override
  @JsonKey(name: 'traces')
  final String? traces;
  final List<String>? _tracesTags;
  @override
  @JsonKey(name: 'traces_tags')
  List<String>? get tracesTags {
    final value = _tracesTags;
    if (value == null) return null;
    if (_tracesTags is EqualUnmodifiableListView) return _tracesTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  // Labels and Certifications
  @override
  @JsonKey(name: 'labels')
  final String? labels;
  final List<String>? _labelsTags;
  @override
  @JsonKey(name: 'labels_tags')
  List<String>? get labelsTags {
    final value = _labelsTags;
    if (value == null) return null;
    if (_labelsTags is EqualUnmodifiableListView) return _labelsTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _labelsHierarchy;
  @override
  @JsonKey(name: 'labels_hierarchy')
  List<String>? get labelsHierarchy {
    final value = _labelsHierarchy;
    if (value == null) return null;
    if (_labelsHierarchy is EqualUnmodifiableListView) return _labelsHierarchy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'ecoscore_grade')
  final String? ecoscoreGrade;
  @override
  @JsonKey(name: 'ecoscore_score')
  final int? ecoscoreScore;
  // Processing and Quality
  @override
  @JsonKey(name: 'nova_group')
  final int? novaGroup;
  @override
  @JsonKey(name: 'nova_groups')
  final String? novaGroups;
  @override
  @JsonKey(name: 'processing')
  final String? processing;
  final List<String>? _processingTags;
  @override
  @JsonKey(name: 'processing_tags')
  List<String>? get processingTags {
    final value = _processingTags;
    if (value == null) return null;
    if (_processingTags is EqualUnmodifiableListView) return _processingTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  // Other useful fields
  @override
  @JsonKey(name: 'packaging')
  final String? packaging;
  final List<String>? _packagingTags;
  @override
  @JsonKey(name: 'packaging_tags')
  List<String>? get packagingTags {
    final value = _packagingTags;
    if (value == null) return null;
    if (_packagingTags is EqualUnmodifiableListView) return _packagingTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'countries')
  final String? countries;
  final List<String>? _countriesTags;
  @override
  @JsonKey(name: 'countries_tags')
  List<String>? get countriesTags {
    final value = _countriesTags;
    if (value == null) return null;
    if (_countriesTags is EqualUnmodifiableListView) return _countriesTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'origins')
  final String? origins;
  final List<String>? _originsTags;
  @override
  @JsonKey(name: 'origins_tags')
  List<String>? get originsTags {
    final value = _originsTags;
    if (value == null) return null;
    if (_originsTags is EqualUnmodifiableListView) return _originsTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'stores')
  final String? stores;
  final List<String>? _storesTags;
  @override
  @JsonKey(name: 'stores_tags')
  List<String>? get storesTags {
    final value = _storesTags;
    if (value == null) return null;
    if (_storesTags is EqualUnmodifiableListView) return _storesTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'purchase_places')
  final String? purchasePlaces;
  final List<String>? _purchasePlacesTags;
  @override
  @JsonKey(name: 'purchase_places_tags')
  List<String>? get purchasePlacesTags {
    final value = _purchasePlacesTags;
    if (value == null) return null;
    if (_purchasePlacesTags is EqualUnmodifiableListView)
      return _purchasePlacesTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'emb_codes')
  final String? embCodes;
  final List<String>? _embCodesTags;
  @override
  @JsonKey(name: 'emb_codes_tags')
  List<String>? get embCodesTags {
    final value = _embCodesTags;
    if (value == null) return null;
    if (_embCodesTags is EqualUnmodifiableListView) return _embCodesTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'creator')
  final String? creator;
  @override
  @JsonKey(name: 'created_t')
  final int? createdT;
  @override
  @JsonKey(name: 'last_modified_t')
  final int? lastModifiedT;
  @override
  @JsonKey(name: 'completeness')
  final double? completeness;
  final List<String>? _popularityTags;
  @override
  @JsonKey(name: 'popularity_tags')
  List<String>? get popularityTags {
    final value = _popularityTags;
    if (value == null) return null;
    if (_popularityTags is EqualUnmodifiableListView) return _popularityTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'states')
  final String? states;
  final List<String>? _statesTags;
  @override
  @JsonKey(name: 'states_tags')
  List<String>? get statesTags {
    final value = _statesTags;
    if (value == null) return null;
    if (_statesTags is EqualUnmodifiableListView) return _statesTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'interface_version_created')
  final String? interfaceVersionCreated;
  @override
  @JsonKey(name: 'interface_version_modified')
  final String? interfaceVersionModified;
  final List<String>? _unknownNutrientsTags;
  @override
  @JsonKey(name: 'unknown_nutrients_tags')
  List<String>? get unknownNutrientsTags {
    final value = _unknownNutrientsTags;
    if (value == null) return null;
    if (_unknownNutrientsTags is EqualUnmodifiableListView)
      return _unknownNutrientsTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'ingredients_n')
  final int? ingredientsN;
  @override
  @JsonKey(name: 'rev')
  final int? rev;
  @override
  @JsonKey(name: 'no_nutriments')
  final String? noNutriments;
  @override
  @JsonKey(name: 'ingredients_that_may_be_from_palm_oil_n')
  final int? ingredientsThatMayBeFromPalmOilN;
  @override
  @JsonKey(name: 'ingredients_from_palm_oil_n')
  final int? ingredientsFromPalmOilN;
  @override
  @JsonKey(name: 'ingredients_from_or_that_may_be_from_palm_oil_n')
  final int? ingredientsFromOrThatMayBeFromPalmOilN;
  @override
  @JsonKey(name: 'nutrition_grade_fr')
  final String? nutritionGradeFr;
  @override
  @JsonKey(name: 'pnns_groups_1')
  final String? pnnsGroups1;
  @override
  @JsonKey(name: 'pnns_groups_2')
  final String? pnnsGroups2;
  @override
  @JsonKey(name: 'food_groups')
  final String? foodGroups;
  final List<String>? _foodGroupsTags;
  @override
  @JsonKey(name: 'food_groups_tags')
  List<String>? get foodGroupsTags {
    final value = _foodGroupsTags;
    if (value == null) return null;
    if (_foodGroupsTags is EqualUnmodifiableListView) return _foodGroupsTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'other_information')
  final String? otherInformation;

  @override
  String toString() {
    return 'Product(code: $code, productName: $productName, productNameEn: $productNameEn, genericName: $genericName, brands: $brands, brandsTags: $brandsTags, quantity: $quantity, productQuantity: $productQuantity, productQuantityUnit: $productQuantityUnit, servingSize: $servingSize, servingQuantity: $servingQuantity, imageUrl: $imageUrl, imageFrontUrl: $imageFrontUrl, imageFrontSmallUrl: $imageFrontSmallUrl, imageNutritionUrl: $imageNutritionUrl, imageIngredientsUrl: $imageIngredientsUrl, selectedImages: $selectedImages, ingredientsList: $ingredientsList, ingredientsText: $ingredientsText, ingredientsTextEn: $ingredientsTextEn, ingredientsTags: $ingredientsTags, ingredientsAnalysisTags: $ingredientsAnalysisTags, ingredientsSweetenersN: $ingredientsSweetenersN, sugarsPer100g: $sugarsPer100g, sugarsServing: $sugarsServing, nutriments: $nutriments, nutrientLevels: $nutrientLevels, nutriscoreGrade: $nutriscoreGrade, nutriscoreScore: $nutriscoreScore, nutriscoreData: $nutriscoreData, categories: $categories, categoriesHierarchy: $categoriesHierarchy, categoriesTags: $categoriesTags, additives: $additives, additivesTags: $additivesTags, additivesOriginalTags: $additivesOriginalTags, allergens: $allergens, allergensTags: $allergensTags, allergensFromIngredients: $allergensFromIngredients, allergensFromUser: $allergensFromUser, traces: $traces, tracesTags: $tracesTags, labels: $labels, labelsTags: $labelsTags, labelsHierarchy: $labelsHierarchy, ecoscoreGrade: $ecoscoreGrade, ecoscoreScore: $ecoscoreScore, novaGroup: $novaGroup, novaGroups: $novaGroups, processing: $processing, processingTags: $processingTags, packaging: $packaging, packagingTags: $packagingTags, countries: $countries, countriesTags: $countriesTags, origins: $origins, originsTags: $originsTags, stores: $stores, storesTags: $storesTags, purchasePlaces: $purchasePlaces, purchasePlacesTags: $purchasePlacesTags, embCodes: $embCodes, embCodesTags: $embCodesTags, creator: $creator, createdT: $createdT, lastModifiedT: $lastModifiedT, completeness: $completeness, popularityTags: $popularityTags, states: $states, statesTags: $statesTags, interfaceVersionCreated: $interfaceVersionCreated, interfaceVersionModified: $interfaceVersionModified, unknownNutrientsTags: $unknownNutrientsTags, ingredientsN: $ingredientsN, rev: $rev, noNutriments: $noNutriments, ingredientsThatMayBeFromPalmOilN: $ingredientsThatMayBeFromPalmOilN, ingredientsFromPalmOilN: $ingredientsFromPalmOilN, ingredientsFromOrThatMayBeFromPalmOilN: $ingredientsFromOrThatMayBeFromPalmOilN, nutritionGradeFr: $nutritionGradeFr, pnnsGroups1: $pnnsGroups1, pnnsGroups2: $pnnsGroups2, foodGroups: $foodGroups, foodGroupsTags: $foodGroupsTags, otherInformation: $otherInformation)';
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
            (identical(other.genericName, genericName) ||
                other.genericName == genericName) &&
            (identical(other.brands, brands) || other.brands == brands) &&
            const DeepCollectionEquality().equals(
              other._brandsTags,
              _brandsTags,
            ) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.productQuantity, productQuantity) ||
                other.productQuantity == productQuantity) &&
            (identical(other.productQuantityUnit, productQuantityUnit) ||
                other.productQuantityUnit == productQuantityUnit) &&
            (identical(other.servingSize, servingSize) ||
                other.servingSize == servingSize) &&
            (identical(other.servingQuantity, servingQuantity) ||
                other.servingQuantity == servingQuantity) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageFrontUrl, imageFrontUrl) ||
                other.imageFrontUrl == imageFrontUrl) &&
            (identical(other.imageFrontSmallUrl, imageFrontSmallUrl) ||
                other.imageFrontSmallUrl == imageFrontSmallUrl) &&
            (identical(other.imageNutritionUrl, imageNutritionUrl) ||
                other.imageNutritionUrl == imageNutritionUrl) &&
            (identical(other.imageIngredientsUrl, imageIngredientsUrl) ||
                other.imageIngredientsUrl == imageIngredientsUrl) &&
            const DeepCollectionEquality().equals(
              other._selectedImages,
              _selectedImages,
            ) &&
            const DeepCollectionEquality().equals(
              other._ingredientsList,
              _ingredientsList,
            ) &&
            (identical(other.ingredientsText, ingredientsText) ||
                other.ingredientsText == ingredientsText) &&
            (identical(other.ingredientsTextEn, ingredientsTextEn) ||
                other.ingredientsTextEn == ingredientsTextEn) &&
            const DeepCollectionEquality().equals(
              other._ingredientsTags,
              _ingredientsTags,
            ) &&
            const DeepCollectionEquality().equals(
              other._ingredientsAnalysisTags,
              _ingredientsAnalysisTags,
            ) &&
            (identical(other.ingredientsSweetenersN, ingredientsSweetenersN) ||
                other.ingredientsSweetenersN == ingredientsSweetenersN) &&
            (identical(other.sugarsPer100g, sugarsPer100g) ||
                other.sugarsPer100g == sugarsPer100g) &&
            (identical(other.sugarsServing, sugarsServing) ||
                other.sugarsServing == sugarsServing) &&
            const DeepCollectionEquality().equals(
              other._nutriments,
              _nutriments,
            ) &&
            const DeepCollectionEquality().equals(
              other._nutrientLevels,
              _nutrientLevels,
            ) &&
            (identical(other.nutriscoreGrade, nutriscoreGrade) ||
                other.nutriscoreGrade == nutriscoreGrade) &&
            (identical(other.nutriscoreScore, nutriscoreScore) ||
                other.nutriscoreScore == nutriscoreScore) &&
            const DeepCollectionEquality().equals(
              other._nutriscoreData,
              _nutriscoreData,
            ) &&
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
            (identical(other.additives, additives) ||
                other.additives == additives) &&
            const DeepCollectionEquality().equals(
              other._additivesTags,
              _additivesTags,
            ) &&
            const DeepCollectionEquality().equals(
              other._additivesOriginalTags,
              _additivesOriginalTags,
            ) &&
            (identical(other.allergens, allergens) ||
                other.allergens == allergens) &&
            const DeepCollectionEquality().equals(
              other._allergensTags,
              _allergensTags,
            ) &&
            (identical(
                  other.allergensFromIngredients,
                  allergensFromIngredients,
                ) ||
                other.allergensFromIngredients == allergensFromIngredients) &&
            (identical(other.allergensFromUser, allergensFromUser) ||
                other.allergensFromUser == allergensFromUser) &&
            (identical(other.traces, traces) || other.traces == traces) &&
            const DeepCollectionEquality().equals(
              other._tracesTags,
              _tracesTags,
            ) &&
            (identical(other.labels, labels) || other.labels == labels) &&
            const DeepCollectionEquality().equals(
              other._labelsTags,
              _labelsTags,
            ) &&
            const DeepCollectionEquality().equals(
              other._labelsHierarchy,
              _labelsHierarchy,
            ) &&
            (identical(other.ecoscoreGrade, ecoscoreGrade) ||
                other.ecoscoreGrade == ecoscoreGrade) &&
            (identical(other.ecoscoreScore, ecoscoreScore) ||
                other.ecoscoreScore == ecoscoreScore) &&
            (identical(other.novaGroup, novaGroup) ||
                other.novaGroup == novaGroup) &&
            (identical(other.novaGroups, novaGroups) ||
                other.novaGroups == novaGroups) &&
            (identical(other.processing, processing) ||
                other.processing == processing) &&
            const DeepCollectionEquality().equals(
              other._processingTags,
              _processingTags,
            ) &&
            (identical(other.packaging, packaging) ||
                other.packaging == packaging) &&
            const DeepCollectionEquality().equals(
              other._packagingTags,
              _packagingTags,
            ) &&
            (identical(other.countries, countries) ||
                other.countries == countries) &&
            const DeepCollectionEquality().equals(
              other._countriesTags,
              _countriesTags,
            ) &&
            (identical(other.origins, origins) || other.origins == origins) &&
            const DeepCollectionEquality().equals(
              other._originsTags,
              _originsTags,
            ) &&
            (identical(other.stores, stores) || other.stores == stores) &&
            const DeepCollectionEquality().equals(
              other._storesTags,
              _storesTags,
            ) &&
            (identical(other.purchasePlaces, purchasePlaces) ||
                other.purchasePlaces == purchasePlaces) &&
            const DeepCollectionEquality().equals(
              other._purchasePlacesTags,
              _purchasePlacesTags,
            ) &&
            (identical(other.embCodes, embCodes) ||
                other.embCodes == embCodes) &&
            const DeepCollectionEquality().equals(
              other._embCodesTags,
              _embCodesTags,
            ) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.createdT, createdT) ||
                other.createdT == createdT) &&
            (identical(other.lastModifiedT, lastModifiedT) ||
                other.lastModifiedT == lastModifiedT) &&
            (identical(other.completeness, completeness) ||
                other.completeness == completeness) &&
            const DeepCollectionEquality().equals(
              other._popularityTags,
              _popularityTags,
            ) &&
            (identical(other.states, states) || other.states == states) &&
            const DeepCollectionEquality().equals(
              other._statesTags,
              _statesTags,
            ) &&
            (identical(
                  other.interfaceVersionCreated,
                  interfaceVersionCreated,
                ) ||
                other.interfaceVersionCreated == interfaceVersionCreated) &&
            (identical(
                  other.interfaceVersionModified,
                  interfaceVersionModified,
                ) ||
                other.interfaceVersionModified == interfaceVersionModified) &&
            const DeepCollectionEquality().equals(
              other._unknownNutrientsTags,
              _unknownNutrientsTags,
            ) &&
            (identical(other.ingredientsN, ingredientsN) ||
                other.ingredientsN == ingredientsN) &&
            (identical(other.rev, rev) || other.rev == rev) &&
            (identical(other.noNutriments, noNutriments) ||
                other.noNutriments == noNutriments) &&
            (identical(
                  other.ingredientsThatMayBeFromPalmOilN,
                  ingredientsThatMayBeFromPalmOilN,
                ) ||
                other.ingredientsThatMayBeFromPalmOilN ==
                    ingredientsThatMayBeFromPalmOilN) &&
            (identical(
                  other.ingredientsFromPalmOilN,
                  ingredientsFromPalmOilN,
                ) ||
                other.ingredientsFromPalmOilN == ingredientsFromPalmOilN) &&
            (identical(
                  other.ingredientsFromOrThatMayBeFromPalmOilN,
                  ingredientsFromOrThatMayBeFromPalmOilN,
                ) ||
                other.ingredientsFromOrThatMayBeFromPalmOilN ==
                    ingredientsFromOrThatMayBeFromPalmOilN) &&
            (identical(other.nutritionGradeFr, nutritionGradeFr) ||
                other.nutritionGradeFr == nutritionGradeFr) &&
            (identical(other.pnnsGroups1, pnnsGroups1) ||
                other.pnnsGroups1 == pnnsGroups1) &&
            (identical(other.pnnsGroups2, pnnsGroups2) ||
                other.pnnsGroups2 == pnnsGroups2) &&
            (identical(other.foodGroups, foodGroups) ||
                other.foodGroups == foodGroups) &&
            const DeepCollectionEquality().equals(
              other._foodGroupsTags,
              _foodGroupsTags,
            ) &&
            (identical(other.otherInformation, otherInformation) ||
                other.otherInformation == otherInformation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    code,
    productName,
    productNameEn,
    genericName,
    brands,
    const DeepCollectionEquality().hash(_brandsTags),
    quantity,
    productQuantity,
    productQuantityUnit,
    servingSize,
    servingQuantity,
    imageUrl,
    imageFrontUrl,
    imageFrontSmallUrl,
    imageNutritionUrl,
    imageIngredientsUrl,
    const DeepCollectionEquality().hash(_selectedImages),
    const DeepCollectionEquality().hash(_ingredientsList),
    ingredientsText,
    ingredientsTextEn,
    const DeepCollectionEquality().hash(_ingredientsTags),
    const DeepCollectionEquality().hash(_ingredientsAnalysisTags),
    ingredientsSweetenersN,
    sugarsPer100g,
    sugarsServing,
    const DeepCollectionEquality().hash(_nutriments),
    const DeepCollectionEquality().hash(_nutrientLevels),
    nutriscoreGrade,
    nutriscoreScore,
    const DeepCollectionEquality().hash(_nutriscoreData),
    categories,
    const DeepCollectionEquality().hash(_categoriesHierarchy),
    const DeepCollectionEquality().hash(_categoriesTags),
    additives,
    const DeepCollectionEquality().hash(_additivesTags),
    const DeepCollectionEquality().hash(_additivesOriginalTags),
    allergens,
    const DeepCollectionEquality().hash(_allergensTags),
    allergensFromIngredients,
    allergensFromUser,
    traces,
    const DeepCollectionEquality().hash(_tracesTags),
    labels,
    const DeepCollectionEquality().hash(_labelsTags),
    const DeepCollectionEquality().hash(_labelsHierarchy),
    ecoscoreGrade,
    ecoscoreScore,
    novaGroup,
    novaGroups,
    processing,
    const DeepCollectionEquality().hash(_processingTags),
    packaging,
    const DeepCollectionEquality().hash(_packagingTags),
    countries,
    const DeepCollectionEquality().hash(_countriesTags),
    origins,
    const DeepCollectionEquality().hash(_originsTags),
    stores,
    const DeepCollectionEquality().hash(_storesTags),
    purchasePlaces,
    const DeepCollectionEquality().hash(_purchasePlacesTags),
    embCodes,
    const DeepCollectionEquality().hash(_embCodesTags),
    creator,
    createdT,
    lastModifiedT,
    completeness,
    const DeepCollectionEquality().hash(_popularityTags),
    states,
    const DeepCollectionEquality().hash(_statesTags),
    interfaceVersionCreated,
    interfaceVersionModified,
    const DeepCollectionEquality().hash(_unknownNutrientsTags),
    ingredientsN,
    rev,
    noNutriments,
    ingredientsThatMayBeFromPalmOilN,
    ingredientsFromPalmOilN,
    ingredientsFromOrThatMayBeFromPalmOilN,
    nutritionGradeFr,
    pnnsGroups1,
    pnnsGroups2,
    foodGroups,
    const DeepCollectionEquality().hash(_foodGroupsTags),
    otherInformation,
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
    @JsonKey(name: 'generic_name') final String? genericName,
    @JsonKey(name: 'brands') final String? brands,
    @JsonKey(name: 'brands_tags') final List<String>? brandsTags,
    @JsonKey(name: 'quantity') final String? quantity,
    @JsonKey(name: 'product_quantity') final String? productQuantity,
    @JsonKey(name: 'product_quantity_unit') final String? productQuantityUnit,
    @JsonKey(name: 'serving_size') final String? servingSize,
    @JsonKey(name: 'serving_quantity') final String? servingQuantity,
    @JsonKey(name: 'image_url') final String? imageUrl,
    @JsonKey(name: 'image_front_url') final String? imageFrontUrl,
    @JsonKey(name: 'image_front_small_url') final String? imageFrontSmallUrl,
    @JsonKey(name: 'image_nutrition_url') final String? imageNutritionUrl,
    @JsonKey(name: 'image_ingredients_url') final String? imageIngredientsUrl,
    @JsonKey(name: 'selected_images')
    final Map<String, dynamic>? selectedImages,
    @JsonKey(name: 'ingredients') final List<Ingredient>? ingredientsList,
    @JsonKey(name: 'ingredients_text') final String? ingredientsText,
    @JsonKey(name: 'ingredients_text_en') final String? ingredientsTextEn,
    @JsonKey(name: 'ingredients_tags') final List<String>? ingredientsTags,
    @JsonKey(name: 'ingredients_analysis_tags')
    final List<String>? ingredientsAnalysisTags,
    @JsonKey(name: 'ingredients_sweeteners_n')
    final int? ingredientsSweetenersN,
    @JsonKey(name: 'sugars_100g') required final double sugarsPer100g,
    @JsonKey(name: 'sugars_serving') final double? sugarsServing,
    @JsonKey(name: 'nutriments') final Map<String, dynamic>? nutriments,
    @JsonKey(name: 'nutrient_levels') final Map<String, String>? nutrientLevels,
    @JsonKey(name: 'nutriscore_grade') final String? nutriscoreGrade,
    @JsonKey(name: 'nutriscore_score') final int? nutriscoreScore,
    @JsonKey(name: 'nutriscore_data')
    final Map<String, dynamic>? nutriscoreData,
    @JsonKey(name: 'categories') final String? categories,
    @JsonKey(name: 'categories_hierarchy')
    final List<String>? categoriesHierarchy,
    @JsonKey(name: 'categories_tags') final List<String>? categoriesTags,
    @JsonKey(name: 'additives') final String? additives,
    @JsonKey(name: 'additives_tags') final List<String>? additivesTags,
    @JsonKey(name: 'additives_original_tags')
    final List<String>? additivesOriginalTags,
    @JsonKey(name: 'allergens') final String? allergens,
    @JsonKey(name: 'allergens_tags') final List<String>? allergensTags,
    @JsonKey(name: 'allergens_from_ingredients')
    final String? allergensFromIngredients,
    @JsonKey(name: 'allergens_from_user') final String? allergensFromUser,
    @JsonKey(name: 'traces') final String? traces,
    @JsonKey(name: 'traces_tags') final List<String>? tracesTags,
    @JsonKey(name: 'labels') final String? labels,
    @JsonKey(name: 'labels_tags') final List<String>? labelsTags,
    @JsonKey(name: 'labels_hierarchy') final List<String>? labelsHierarchy,
    @JsonKey(name: 'ecoscore_grade') final String? ecoscoreGrade,
    @JsonKey(name: 'ecoscore_score') final int? ecoscoreScore,
    @JsonKey(name: 'nova_group') final int? novaGroup,
    @JsonKey(name: 'nova_groups') final String? novaGroups,
    @JsonKey(name: 'processing') final String? processing,
    @JsonKey(name: 'processing_tags') final List<String>? processingTags,
    @JsonKey(name: 'packaging') final String? packaging,
    @JsonKey(name: 'packaging_tags') final List<String>? packagingTags,
    @JsonKey(name: 'countries') final String? countries,
    @JsonKey(name: 'countries_tags') final List<String>? countriesTags,
    @JsonKey(name: 'origins') final String? origins,
    @JsonKey(name: 'origins_tags') final List<String>? originsTags,
    @JsonKey(name: 'stores') final String? stores,
    @JsonKey(name: 'stores_tags') final List<String>? storesTags,
    @JsonKey(name: 'purchase_places') final String? purchasePlaces,
    @JsonKey(name: 'purchase_places_tags')
    final List<String>? purchasePlacesTags,
    @JsonKey(name: 'emb_codes') final String? embCodes,
    @JsonKey(name: 'emb_codes_tags') final List<String>? embCodesTags,
    @JsonKey(name: 'creator') final String? creator,
    @JsonKey(name: 'created_t') final int? createdT,
    @JsonKey(name: 'last_modified_t') final int? lastModifiedT,
    @JsonKey(name: 'completeness') final double? completeness,
    @JsonKey(name: 'popularity_tags') final List<String>? popularityTags,
    @JsonKey(name: 'states') final String? states,
    @JsonKey(name: 'states_tags') final List<String>? statesTags,
    @JsonKey(name: 'interface_version_created')
    final String? interfaceVersionCreated,
    @JsonKey(name: 'interface_version_modified')
    final String? interfaceVersionModified,
    @JsonKey(name: 'unknown_nutrients_tags')
    final List<String>? unknownNutrientsTags,
    @JsonKey(name: 'ingredients_n') final int? ingredientsN,
    @JsonKey(name: 'rev') final int? rev,
    @JsonKey(name: 'no_nutriments') final String? noNutriments,
    @JsonKey(name: 'ingredients_that_may_be_from_palm_oil_n')
    final int? ingredientsThatMayBeFromPalmOilN,
    @JsonKey(name: 'ingredients_from_palm_oil_n')
    final int? ingredientsFromPalmOilN,
    @JsonKey(name: 'ingredients_from_or_that_may_be_from_palm_oil_n')
    final int? ingredientsFromOrThatMayBeFromPalmOilN,
    @JsonKey(name: 'nutrition_grade_fr') final String? nutritionGradeFr,
    @JsonKey(name: 'pnns_groups_1') final String? pnnsGroups1,
    @JsonKey(name: 'pnns_groups_2') final String? pnnsGroups2,
    @JsonKey(name: 'food_groups') final String? foodGroups,
    @JsonKey(name: 'food_groups_tags') final List<String>? foodGroupsTags,
    @JsonKey(name: 'other_information') final String? otherInformation,
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
  @JsonKey(name: 'generic_name')
  String? get genericName;
  @override
  @JsonKey(name: 'brands')
  String? get brands;
  @override
  @JsonKey(name: 'brands_tags')
  List<String>? get brandsTags;
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
  @JsonKey(name: 'serving_size')
  String? get servingSize;
  @override
  @JsonKey(name: 'serving_quantity')
  String? get servingQuantity; // Images
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'image_front_url')
  String? get imageFrontUrl;
  @override
  @JsonKey(name: 'image_front_small_url')
  String? get imageFrontSmallUrl;
  @override
  @JsonKey(name: 'image_nutrition_url')
  String? get imageNutritionUrl;
  @override
  @JsonKey(name: 'image_ingredients_url')
  String? get imageIngredientsUrl;
  @override
  @JsonKey(name: 'selected_images')
  Map<String, dynamic>? get selectedImages; // Ingredients
  @override
  @JsonKey(name: 'ingredients')
  List<Ingredient>? get ingredientsList;
  @override
  @JsonKey(name: 'ingredients_text')
  String? get ingredientsText;
  @override
  @JsonKey(name: 'ingredients_text_en')
  String? get ingredientsTextEn;
  @override
  @JsonKey(name: 'ingredients_tags')
  List<String>? get ingredientsTags;
  @override
  @JsonKey(name: 'ingredients_analysis_tags')
  List<String>? get ingredientsAnalysisTags;
  @override
  @JsonKey(name: 'ingredients_sweeteners_n')
  int? get ingredientsSweetenersN; // Nutrition
  @override
  @JsonKey(name: 'sugars_100g')
  double get sugarsPer100g;
  @override
  @JsonKey(name: 'sugars_serving')
  double? get sugarsServing;
  @override
  @JsonKey(name: 'nutriments')
  Map<String, dynamic>? get nutriments;
  @override
  @JsonKey(name: 'nutrient_levels')
  Map<String, String>? get nutrientLevels;
  @override
  @JsonKey(name: 'nutriscore_grade')
  String? get nutriscoreGrade;
  @override
  @JsonKey(name: 'nutriscore_score')
  int? get nutriscoreScore;
  @override
  @JsonKey(name: 'nutriscore_data')
  Map<String, dynamic>? get nutriscoreData; // Categories
  @override
  @JsonKey(name: 'categories')
  String? get categories;
  @override
  @JsonKey(name: 'categories_hierarchy')
  List<String>? get categoriesHierarchy;
  @override
  @JsonKey(name: 'categories_tags')
  List<String>? get categoriesTags; // Additives, Allergens, Traces
  @override
  @JsonKey(name: 'additives')
  String? get additives;
  @override
  @JsonKey(name: 'additives_tags')
  List<String>? get additivesTags;
  @override
  @JsonKey(name: 'additives_original_tags')
  List<String>? get additivesOriginalTags;
  @override
  @JsonKey(name: 'allergens')
  String? get allergens;
  @override
  @JsonKey(name: 'allergens_tags')
  List<String>? get allergensTags;
  @override
  @JsonKey(name: 'allergens_from_ingredients')
  String? get allergensFromIngredients;
  @override
  @JsonKey(name: 'allergens_from_user')
  String? get allergensFromUser;
  @override
  @JsonKey(name: 'traces')
  String? get traces;
  @override
  @JsonKey(name: 'traces_tags')
  List<String>? get tracesTags; // Labels and Certifications
  @override
  @JsonKey(name: 'labels')
  String? get labels;
  @override
  @JsonKey(name: 'labels_tags')
  List<String>? get labelsTags;
  @override
  @JsonKey(name: 'labels_hierarchy')
  List<String>? get labelsHierarchy;
  @override
  @JsonKey(name: 'ecoscore_grade')
  String? get ecoscoreGrade;
  @override
  @JsonKey(name: 'ecoscore_score')
  int? get ecoscoreScore; // Processing and Quality
  @override
  @JsonKey(name: 'nova_group')
  int? get novaGroup;
  @override
  @JsonKey(name: 'nova_groups')
  String? get novaGroups;
  @override
  @JsonKey(name: 'processing')
  String? get processing;
  @override
  @JsonKey(name: 'processing_tags')
  List<String>? get processingTags; // Other useful fields
  @override
  @JsonKey(name: 'packaging')
  String? get packaging;
  @override
  @JsonKey(name: 'packaging_tags')
  List<String>? get packagingTags;
  @override
  @JsonKey(name: 'countries')
  String? get countries;
  @override
  @JsonKey(name: 'countries_tags')
  List<String>? get countriesTags;
  @override
  @JsonKey(name: 'origins')
  String? get origins;
  @override
  @JsonKey(name: 'origins_tags')
  List<String>? get originsTags;
  @override
  @JsonKey(name: 'stores')
  String? get stores;
  @override
  @JsonKey(name: 'stores_tags')
  List<String>? get storesTags;
  @override
  @JsonKey(name: 'purchase_places')
  String? get purchasePlaces;
  @override
  @JsonKey(name: 'purchase_places_tags')
  List<String>? get purchasePlacesTags;
  @override
  @JsonKey(name: 'emb_codes')
  String? get embCodes;
  @override
  @JsonKey(name: 'emb_codes_tags')
  List<String>? get embCodesTags;
  @override
  @JsonKey(name: 'creator')
  String? get creator;
  @override
  @JsonKey(name: 'created_t')
  int? get createdT;
  @override
  @JsonKey(name: 'last_modified_t')
  int? get lastModifiedT;
  @override
  @JsonKey(name: 'completeness')
  double? get completeness;
  @override
  @JsonKey(name: 'popularity_tags')
  List<String>? get popularityTags;
  @override
  @JsonKey(name: 'states')
  String? get states;
  @override
  @JsonKey(name: 'states_tags')
  List<String>? get statesTags;
  @override
  @JsonKey(name: 'interface_version_created')
  String? get interfaceVersionCreated;
  @override
  @JsonKey(name: 'interface_version_modified')
  String? get interfaceVersionModified;
  @override
  @JsonKey(name: 'unknown_nutrients_tags')
  List<String>? get unknownNutrientsTags;
  @override
  @JsonKey(name: 'ingredients_n')
  int? get ingredientsN;
  @override
  @JsonKey(name: 'rev')
  int? get rev;
  @override
  @JsonKey(name: 'no_nutriments')
  String? get noNutriments;
  @override
  @JsonKey(name: 'ingredients_that_may_be_from_palm_oil_n')
  int? get ingredientsThatMayBeFromPalmOilN;
  @override
  @JsonKey(name: 'ingredients_from_palm_oil_n')
  int? get ingredientsFromPalmOilN;
  @override
  @JsonKey(name: 'ingredients_from_or_that_may_be_from_palm_oil_n')
  int? get ingredientsFromOrThatMayBeFromPalmOilN;
  @override
  @JsonKey(name: 'nutrition_grade_fr')
  String? get nutritionGradeFr;
  @override
  @JsonKey(name: 'pnns_groups_1')
  String? get pnnsGroups1;
  @override
  @JsonKey(name: 'pnns_groups_2')
  String? get pnnsGroups2;
  @override
  @JsonKey(name: 'food_groups')
  String? get foodGroups;
  @override
  @JsonKey(name: 'food_groups_tags')
  List<String>? get foodGroupsTags;
  @override
  @JsonKey(name: 'other_information')
  String? get otherInformation;

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
