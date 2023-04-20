import 'package:flutter/material.dart';

class ShipInformationWidget extends StatelessWidget {
  const ShipInformationWidget({
    super.key,
    required this.shipName,
    required this.crew,
    required this.passengerCapacity,
    required this.inauguralDate,
  });

  final String shipName;
  final String crew;
  final String passengerCapacity;
  final String inauguralDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Ship Name: $shipName"),
        Text("crew: $crew"),
        Text("passenger capacity: $passengerCapacity"),
        Text("inaugural date: $inauguralDate"),
      ],
    );
  }
}
