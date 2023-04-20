// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipModel _$ShipModelFromJson(Map<String, dynamic> json) => ShipModel(
      json['shipName'] as String,
      ShipFacts.fromJson(json['shipFacts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShipModelToJson(ShipModel instance) => <String, dynamic>{
      'shipName': instance.shipName,
      'shipFacts': instance.shipFacts,
    };

ShipFacts _$ShipFactsFromJson(Map<String, dynamic> json) => ShipFacts(
      json['passengerCapacity'] as String,
      json['crew'] as String,
      json['inauguralDate'] as String,
    );

Map<String, dynamic> _$ShipFactsToJson(ShipFacts instance) => <String, dynamic>{
      'passengerCapacity': instance.passengerCapacity,
      'crew': instance.crew,
      'inauguralDate': instance.inauguralDate,
    };
