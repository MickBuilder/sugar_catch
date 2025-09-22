// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyLogImpl _$$DailyLogImplFromJson(Map<String, dynamic> json) =>
    _$DailyLogImpl(
      date: DateTime.parse(json['date'] as String),
      entries: (json['entries'] as List<dynamic>)
          .map((e) => LogEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalSugar: (json['totalSugar'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$DailyLogImplToJson(_$DailyLogImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'entries': instance.entries,
      'totalSugar': instance.totalSugar,
    };

_$LogEntryImpl _$$LogEntryImplFromJson(Map<String, dynamic> json) =>
    _$LogEntryImpl(
      id: json['id'] as String,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      sugarInfo: SugarInfo.fromJson(json['sugarInfo'] as Map<String, dynamic>),
      servingSize: ServingSize.fromJson(
        json['servingSize'] as Map<String, dynamic>,
      ),
      loggedAt: DateTime.parse(json['loggedAt'] as String),
      totalSugarAmount: (json['totalSugarAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$$LogEntryImplToJson(_$LogEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'sugarInfo': instance.sugarInfo,
      'servingSize': instance.servingSize,
      'loggedAt': instance.loggedAt.toIso8601String(),
      'totalSugarAmount': instance.totalSugarAmount,
    };

_$ServingSizeImpl _$$ServingSizeImplFromJson(Map<String, dynamic> json) =>
    _$ServingSizeImpl(
      quantity: (json['quantity'] as num).toDouble(),
      unit: json['unit'] as String,
      sugarPerServing: (json['sugarPerServing'] as num).toDouble(),
    );

Map<String, dynamic> _$$ServingSizeImplToJson(_$ServingSizeImpl instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'unit': instance.unit,
      'sugarPerServing': instance.sugarPerServing,
    };
