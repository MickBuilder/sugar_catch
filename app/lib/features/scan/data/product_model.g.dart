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

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      code: json['code'] as String,
      productName: json['product_name'] as String,
      productNameEn: json['product_name_en'] as String?,
      brands: json['brands'] as String?,
      sugarsPer100g: (json['sugars_100g'] as num).toDouble(),
      sugarsServing: (json['sugars_serving'] as num?)?.toDouble(),
      servingSize: json['serving_size'] as String?,
      servingQuantity: json['serving_quantity'] as String?,
      quantity: json['quantity'] as String?,
      productQuantity: json['product_quantity'] as String?,
      productQuantityUnit: json['product_quantity_unit'] as String?,
      ingredientsList: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingredientsTags: (json['ingredients_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      imageUrl: json['image_url'] as String?,
      imageFrontUrl: json['image_front_url'] as String?,
      categories: json['categories'] as String?,
      categoriesHierarchy: (json['categories_hierarchy'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      categoriesTags: (json['categories_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      additivesTags: (json['additives_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      allergensTags: (json['allergens_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tracesTags: (json['traces_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ingredientsSweetenersN: (json['ingredients_sweeteners_n'] as num?)
          ?.toInt(),
      nutriments: json['nutriments'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'product_name': instance.productName,
      'product_name_en': instance.productNameEn,
      'brands': instance.brands,
      'sugars_100g': instance.sugarsPer100g,
      'sugars_serving': instance.sugarsServing,
      'serving_size': instance.servingSize,
      'serving_quantity': instance.servingQuantity,
      'quantity': instance.quantity,
      'product_quantity': instance.productQuantity,
      'product_quantity_unit': instance.productQuantityUnit,
      'ingredients': instance.ingredientsList,
      'ingredients_tags': instance.ingredientsTags,
      'image_url': instance.imageUrl,
      'image_front_url': instance.imageFrontUrl,
      'categories': instance.categories,
      'categories_hierarchy': instance.categoriesHierarchy,
      'categories_tags': instance.categoriesTags,
      'additives_tags': instance.additivesTags,
      'allergens_tags': instance.allergensTags,
      'traces_tags': instance.tracesTags,
      'ingredients_sweeteners_n': instance.ingredientsSweetenersN,
      'nutriments': instance.nutriments,
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
