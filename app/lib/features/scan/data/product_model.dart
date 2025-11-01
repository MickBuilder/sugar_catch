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
    @JsonKey(name: 'percent_max', fromJson: _parseDouble) double? percentMax,
    @JsonKey(name: 'percent_min', fromJson: _parseDouble) double? percentMin,
    @JsonKey(name: 'vegan') String? vegan,
    @JsonKey(name: 'vegetarian') String? vegetarian,
    @JsonKey(name: 'from_palm_oil') String? fromPalmOil,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}

// Helper function to parse both string and numeric values to double
double? _parseDouble(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) {
    return double.tryParse(value);
  }
  return null;
}

@freezed
class Product with _$Product {
  const factory Product({
    required String code,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_name_en') String? productNameEn,
    @JsonKey(name: 'generic_name') String? genericName,
    @JsonKey(name: 'brands') String? brands,
    @JsonKey(name: 'brands_tags') List<String>? brandsTags,
    @JsonKey(name: 'quantity') String? quantity,
    @JsonKey(name: 'product_quantity') String? productQuantity,
    @JsonKey(name: 'product_quantity_unit') String? productQuantityUnit,
    @JsonKey(name: 'serving_size') String? servingSize,
    @JsonKey(name: 'serving_quantity') String? servingQuantity,
    
    // Images
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'image_front_url') String? imageFrontUrl,
    @JsonKey(name: 'image_front_small_url') String? imageFrontSmallUrl,
    @JsonKey(name: 'image_nutrition_url') String? imageNutritionUrl,
    @JsonKey(name: 'image_ingredients_url') String? imageIngredientsUrl,
    @JsonKey(name: 'selected_images') Map<String, dynamic>? selectedImages,
    
    // Ingredients
    @JsonKey(name: 'ingredients') List<Ingredient>? ingredientsList,
    @JsonKey(name: 'ingredients_text') String? ingredientsText,
    @JsonKey(name: 'ingredients_text_en') String? ingredientsTextEn,
    @JsonKey(name: 'ingredients_tags') List<String>? ingredientsTags,
    @JsonKey(name: 'ingredients_analysis_tags') List<String>? ingredientsAnalysisTags,
    @JsonKey(name: 'ingredients_sweeteners_n') int? ingredientsSweetenersN,
    
    // Nutrition
    @JsonKey(name: 'sugars_100g') required double sugarsPer100g,
    @JsonKey(name: 'sugars_serving') double? sugarsServing,
    @JsonKey(name: 'nutriments') Map<String, dynamic>? nutriments,
    @JsonKey(name: 'nutrient_levels') Map<String, String>? nutrientLevels,
    @JsonKey(name: 'nutriscore_grade') String? nutriscoreGrade,
    @JsonKey(name: 'nutriscore_score') int? nutriscoreScore,
    @JsonKey(name: 'nutriscore_data') Map<String, dynamic>? nutriscoreData,
    
    // Categories
    @JsonKey(name: 'categories') String? categories,
    @JsonKey(name: 'categories_hierarchy') List<String>? categoriesHierarchy,
    @JsonKey(name: 'categories_tags') List<String>? categoriesTags,
    
    // Additives, Allergens, Traces
    @JsonKey(name: 'additives') String? additives,
    @JsonKey(name: 'additives_tags') List<String>? additivesTags,
    @JsonKey(name: 'additives_original_tags') List<String>? additivesOriginalTags,
    @JsonKey(name: 'allergens') String? allergens,
    @JsonKey(name: 'allergens_tags') List<String>? allergensTags,
    @JsonKey(name: 'allergens_from_ingredients') String? allergensFromIngredients,
    @JsonKey(name: 'allergens_from_user') String? allergensFromUser,
    @JsonKey(name: 'traces') String? traces,
    @JsonKey(name: 'traces_tags') List<String>? tracesTags,
    
    // Labels and Certifications
    @JsonKey(name: 'labels') String? labels,
    @JsonKey(name: 'labels_tags') List<String>? labelsTags,
    @JsonKey(name: 'labels_hierarchy') List<String>? labelsHierarchy,
    @JsonKey(name: 'ecoscore_grade') String? ecoscoreGrade,
    @JsonKey(name: 'ecoscore_score') int? ecoscoreScore,
    
    // Processing and Quality
    @JsonKey(name: 'nova_group') int? novaGroup,
    @JsonKey(name: 'nova_groups') String? novaGroups,
    @JsonKey(name: 'processing') String? processing,
    @JsonKey(name: 'processing_tags') List<String>? processingTags,
    
    // Other useful fields
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
    @JsonKey(name: 'interface_version_modified') String? interfaceVersionModified,
    @JsonKey(name: 'unknown_nutrients_tags') List<String>? unknownNutrientsTags,
    @JsonKey(name: 'ingredients_n') int? ingredientsN,
    @JsonKey(name: 'rev') int? rev,
    @JsonKey(name: 'no_nutriments') String? noNutriments,
    @JsonKey(name: 'ingredients_that_may_be_from_palm_oil_n') int? ingredientsThatMayBeFromPalmOilN,
    @JsonKey(name: 'ingredients_from_palm_oil_n') int? ingredientsFromPalmOilN,
    @JsonKey(name: 'ingredients_from_or_that_may_be_from_palm_oil_n') int? ingredientsFromOrThatMayBeFromPalmOilN,
    @JsonKey(name: 'nutrition_grade_fr') String? nutritionGradeFr,
    @JsonKey(name: 'pnns_groups_1') String? pnnsGroups1,
    @JsonKey(name: 'pnns_groups_2') String? pnnsGroups2,
    @JsonKey(name: 'food_groups') String? foodGroups,
    @JsonKey(name: 'food_groups_tags') List<String>? foodGroupsTags,
    @JsonKey(name: 'other_information') String? otherInformation,
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
