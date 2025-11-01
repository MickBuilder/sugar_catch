// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientImpl _$$IngredientImplFromJson(Map<String, dynamic> json) =>
    _$IngredientImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      textEn: json['text_en'] as String?,
      percentEstimate: (json['percent_estimate'] as num?)?.toDouble(),
      percentMax: _parseDouble(json['percent_max']),
      percentMin: _parseDouble(json['percent_min']),
      vegan: json['vegan'] as String?,
      vegetarian: json['vegetarian'] as String?,
      fromPalmOil: json['from_palm_oil'] as String?,
    );

Map<String, dynamic> _$$IngredientImplToJson(_$IngredientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'text_en': instance.textEn,
      'percent_estimate': instance.percentEstimate,
      'percent_max': instance.percentMax,
      'percent_min': instance.percentMin,
      'vegan': instance.vegan,
      'vegetarian': instance.vegetarian,
      'from_palm_oil': instance.fromPalmOil,
    };

_$ProductImpl _$$ProductImplFromJson(
  Map<String, dynamic> json,
) => _$ProductImpl(
  code: json['code'] as String,
  productName: json['product_name'] as String,
  productNameEn: json['product_name_en'] as String?,
  genericName: json['generic_name'] as String?,
  brands: json['brands'] as String?,
  brandsTags: (json['brands_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  quantity: json['quantity'] as String?,
  productQuantity: json['product_quantity'] as String?,
  productQuantityUnit: json['product_quantity_unit'] as String?,
  servingSize: json['serving_size'] as String?,
  servingQuantity: json['serving_quantity'] as String?,
  imageUrl: json['image_url'] as String?,
  imageFrontUrl: json['image_front_url'] as String?,
  imageFrontSmallUrl: json['image_front_small_url'] as String?,
  imageNutritionUrl: json['image_nutrition_url'] as String?,
  imageIngredientsUrl: json['image_ingredients_url'] as String?,
  selectedImages: json['selected_images'] as Map<String, dynamic>?,
  ingredientsList: (json['ingredients'] as List<dynamic>?)
      ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
      .toList(),
  ingredientsText: json['ingredients_text'] as String?,
  ingredientsTextEn: json['ingredients_text_en'] as String?,
  ingredientsTags: (json['ingredients_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  ingredientsAnalysisTags: (json['ingredients_analysis_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  ingredientsSweetenersN: (json['ingredients_sweeteners_n'] as num?)?.toInt(),
  sugarsPer100g: (json['sugars_100g'] as num).toDouble(),
  sugarsServing: (json['sugars_serving'] as num?)?.toDouble(),
  nutriments: json['nutriments'] as Map<String, dynamic>?,
  nutrientLevels: (json['nutrient_levels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  nutriscoreGrade: json['nutriscore_grade'] as String?,
  nutriscoreScore: (json['nutriscore_score'] as num?)?.toInt(),
  nutriscoreData: json['nutriscore_data'] as Map<String, dynamic>?,
  categories: json['categories'] as String?,
  categoriesHierarchy: (json['categories_hierarchy'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  categoriesTags: (json['categories_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  additives: json['additives'] as String?,
  additivesTags: (json['additives_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  additivesOriginalTags: (json['additives_original_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  allergens: json['allergens'] as String?,
  allergensTags: (json['allergens_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  allergensFromIngredients: json['allergens_from_ingredients'] as String?,
  allergensFromUser: json['allergens_from_user'] as String?,
  traces: json['traces'] as String?,
  tracesTags: (json['traces_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  labels: json['labels'] as String?,
  labelsTags: (json['labels_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  labelsHierarchy: (json['labels_hierarchy'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  ecoscoreGrade: json['ecoscore_grade'] as String?,
  ecoscoreScore: (json['ecoscore_score'] as num?)?.toInt(),
  novaGroup: (json['nova_group'] as num?)?.toInt(),
  novaGroups: json['nova_groups'] as String?,
  processing: json['processing'] as String?,
  processingTags: (json['processing_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  packaging: json['packaging'] as String?,
  packagingTags: (json['packaging_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  countries: json['countries'] as String?,
  countriesTags: (json['countries_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  origins: json['origins'] as String?,
  originsTags: (json['origins_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  stores: json['stores'] as String?,
  storesTags: (json['stores_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  purchasePlaces: json['purchase_places'] as String?,
  purchasePlacesTags: (json['purchase_places_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  embCodes: json['emb_codes'] as String?,
  embCodesTags: (json['emb_codes_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  creator: json['creator'] as String?,
  createdT: (json['created_t'] as num?)?.toInt(),
  lastModifiedT: (json['last_modified_t'] as num?)?.toInt(),
  completeness: (json['completeness'] as num?)?.toDouble(),
  popularityTags: (json['popularity_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  states: json['states'] as String?,
  statesTags: (json['states_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  interfaceVersionCreated: json['interface_version_created'] as String?,
  interfaceVersionModified: json['interface_version_modified'] as String?,
  unknownNutrientsTags: (json['unknown_nutrients_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  ingredientsN: (json['ingredients_n'] as num?)?.toInt(),
  rev: (json['rev'] as num?)?.toInt(),
  noNutriments: json['no_nutriments'] as String?,
  ingredientsThatMayBeFromPalmOilN:
      (json['ingredients_that_may_be_from_palm_oil_n'] as num?)?.toInt(),
  ingredientsFromPalmOilN: (json['ingredients_from_palm_oil_n'] as num?)
      ?.toInt(),
  ingredientsFromOrThatMayBeFromPalmOilN:
      (json['ingredients_from_or_that_may_be_from_palm_oil_n'] as num?)
          ?.toInt(),
  nutritionGradeFr: json['nutrition_grade_fr'] as String?,
  pnnsGroups1: json['pnns_groups_1'] as String?,
  pnnsGroups2: json['pnns_groups_2'] as String?,
  foodGroups: json['food_groups'] as String?,
  foodGroupsTags: (json['food_groups_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  otherInformation: json['other_information'] as String?,
);

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'product_name': instance.productName,
      'product_name_en': instance.productNameEn,
      'generic_name': instance.genericName,
      'brands': instance.brands,
      'brands_tags': instance.brandsTags,
      'quantity': instance.quantity,
      'product_quantity': instance.productQuantity,
      'product_quantity_unit': instance.productQuantityUnit,
      'serving_size': instance.servingSize,
      'serving_quantity': instance.servingQuantity,
      'image_url': instance.imageUrl,
      'image_front_url': instance.imageFrontUrl,
      'image_front_small_url': instance.imageFrontSmallUrl,
      'image_nutrition_url': instance.imageNutritionUrl,
      'image_ingredients_url': instance.imageIngredientsUrl,
      'selected_images': instance.selectedImages,
      'ingredients': instance.ingredientsList,
      'ingredients_text': instance.ingredientsText,
      'ingredients_text_en': instance.ingredientsTextEn,
      'ingredients_tags': instance.ingredientsTags,
      'ingredients_analysis_tags': instance.ingredientsAnalysisTags,
      'ingredients_sweeteners_n': instance.ingredientsSweetenersN,
      'sugars_100g': instance.sugarsPer100g,
      'sugars_serving': instance.sugarsServing,
      'nutriments': instance.nutriments,
      'nutrient_levels': instance.nutrientLevels,
      'nutriscore_grade': instance.nutriscoreGrade,
      'nutriscore_score': instance.nutriscoreScore,
      'nutriscore_data': instance.nutriscoreData,
      'categories': instance.categories,
      'categories_hierarchy': instance.categoriesHierarchy,
      'categories_tags': instance.categoriesTags,
      'additives': instance.additives,
      'additives_tags': instance.additivesTags,
      'additives_original_tags': instance.additivesOriginalTags,
      'allergens': instance.allergens,
      'allergens_tags': instance.allergensTags,
      'allergens_from_ingredients': instance.allergensFromIngredients,
      'allergens_from_user': instance.allergensFromUser,
      'traces': instance.traces,
      'traces_tags': instance.tracesTags,
      'labels': instance.labels,
      'labels_tags': instance.labelsTags,
      'labels_hierarchy': instance.labelsHierarchy,
      'ecoscore_grade': instance.ecoscoreGrade,
      'ecoscore_score': instance.ecoscoreScore,
      'nova_group': instance.novaGroup,
      'nova_groups': instance.novaGroups,
      'processing': instance.processing,
      'processing_tags': instance.processingTags,
      'packaging': instance.packaging,
      'packaging_tags': instance.packagingTags,
      'countries': instance.countries,
      'countries_tags': instance.countriesTags,
      'origins': instance.origins,
      'origins_tags': instance.originsTags,
      'stores': instance.stores,
      'stores_tags': instance.storesTags,
      'purchase_places': instance.purchasePlaces,
      'purchase_places_tags': instance.purchasePlacesTags,
      'emb_codes': instance.embCodes,
      'emb_codes_tags': instance.embCodesTags,
      'creator': instance.creator,
      'created_t': instance.createdT,
      'last_modified_t': instance.lastModifiedT,
      'completeness': instance.completeness,
      'popularity_tags': instance.popularityTags,
      'states': instance.states,
      'states_tags': instance.statesTags,
      'interface_version_created': instance.interfaceVersionCreated,
      'interface_version_modified': instance.interfaceVersionModified,
      'unknown_nutrients_tags': instance.unknownNutrientsTags,
      'ingredients_n': instance.ingredientsN,
      'rev': instance.rev,
      'no_nutriments': instance.noNutriments,
      'ingredients_that_may_be_from_palm_oil_n':
          instance.ingredientsThatMayBeFromPalmOilN,
      'ingredients_from_palm_oil_n': instance.ingredientsFromPalmOilN,
      'ingredients_from_or_that_may_be_from_palm_oil_n':
          instance.ingredientsFromOrThatMayBeFromPalmOilN,
      'nutrition_grade_fr': instance.nutritionGradeFr,
      'pnns_groups_1': instance.pnnsGroups1,
      'pnns_groups_2': instance.pnnsGroups2,
      'food_groups': instance.foodGroups,
      'food_groups_tags': instance.foodGroupsTags,
      'other_information': instance.otherInformation,
    };

_$SugarInfoImpl _$$SugarInfoImplFromJson(Map<String, dynamic> json) =>
    _$SugarInfoImpl(
      sugarsPer100g: (json['sugarsPer100g'] as num).toDouble(),
      totalSugarsInProduct: (json['totalSugarsInProduct'] as num).toDouble(),
      productUnit: json['productUnit'] as String,
      hiddenSugarIngredients: (json['hiddenSugarIngredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SugarInfoImplToJson(_$SugarInfoImpl instance) =>
    <String, dynamic>{
      'sugarsPer100g': instance.sugarsPer100g,
      'totalSugarsInProduct': instance.totalSugarsInProduct,
      'productUnit': instance.productUnit,
      'hiddenSugarIngredients': instance.hiddenSugarIngredients,
    };
