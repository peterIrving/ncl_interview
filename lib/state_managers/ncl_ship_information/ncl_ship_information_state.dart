import 'package:flutter/material.dart';
import 'package:ncl_assessment/models/network_request_state.dart';
import 'package:ncl_assessment/models/ship_model.dart';

@immutable
class NCLShipInformationState {
  final ShipModel? shipModel;
  final NetworkRequestState requestState;
  final String? error;

  const NCLShipInformationState({
    this.shipModel,
    this.requestState = NetworkRequestState.idle,
    this.error,
  });

  NCLShipInformationState copyWith({
    ShipModel? shipModel,
    NetworkRequestState? requestState,
    String? error,
  }) {
    return NCLShipInformationState(
        shipModel: shipModel ?? this.shipModel,
        requestState: requestState ?? this.requestState,
        error: error ?? this.error);
  }
}
