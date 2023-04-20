import 'package:json_annotation/json_annotation.dart';

part 'ship_model.g.dart';

@JsonSerializable()
class ShipModel {
  ShipModel(this.shipName, this.shipFacts);

  final String shipName;
  final ShipFacts shipFacts;

  factory ShipModel.fromJson(Map<String, dynamic> json) =>
      _$ShipModelFromJson(json);
}

@JsonSerializable()
class ShipFacts {
  ShipFacts(this.passengerCapacity, this.crew, this.inauguralDate);

  final String passengerCapacity;
  final String crew;
  final String inauguralDate;

  factory ShipFacts.fromJson(Map<String, dynamic> json) =>
      _$ShipFactsFromJson(json);
}
