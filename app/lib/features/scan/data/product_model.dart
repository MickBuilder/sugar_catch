// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'text') required String text,
    @JsonKey(name: 'text_en') String? textEn,
    @JsonKey(name: 'percent_estimate') double? percentEstimate,
    @JsonKey(name: 'percent_max') double? percentMax,
    @JsonKey(name: 'percent_min') double? percentMin,
    @JsonKey(name: 'vegan') String? vegan,
    @JsonKey(name: 'vegetarian') String? vegetarian,
    @JsonKey(name: 'from_palm_oil') String? fromPalmOil,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    required String code,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_name_en') String? productNameEn,
    @JsonKey(name: 'brands') String? brands,
    @JsonKey(name: 'sugars_100g') required double sugarsPer100g,
    @JsonKey(name: 'sugars_serving') double? sugarsServing,
    @JsonKey(name: 'serving_size') String? servingSize,
    @JsonKey(name: 'serving_quantity') String? servingQuantity,
    @JsonKey(name: 'quantity') String? quantity,
    @JsonKey(name: 'product_quantity') String? productQuantity,
    @JsonKey(name: 'product_quantity_unit') String? productQuantityUnit,
    @JsonKey(name: 'ingredients') List<Ingredient>? ingredientsList,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'image_front_url') String? imageFrontUrl,
    Map<String, dynamic>? nutriments,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class SugarInfo with _$SugarInfo {
  const factory SugarInfo({
    required double sugarsPer100g,
    required double totalSugarsInProduct,
    required String productUnit,
    required List<Ingredient> hiddenSugarIngredients,
  }) = _SugarInfo;

  factory SugarInfo.fromJson(Map<String, dynamic> json) =>
      _$SugarInfoFromJson(json);
}