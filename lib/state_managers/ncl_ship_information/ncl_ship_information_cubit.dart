import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncl_assessment/models/network_request_state.dart';
import 'package:ncl_assessment/models/ship_information_error.dart';
import 'package:ncl_assessment/models/ship_model.dart';
import 'package:ncl_assessment/models/ship_name_enum.dart';
import 'package:ncl_assessment/services/connectivity_service/connectivity_service_interface.dart';
import 'package:ncl_assessment/services/ncl_service/ncl_service_interface.dart';
import 'package:ncl_assessment/state_managers/ncl_ship_information/ncl_ship_information_state.dart';

class NCLShipInformationCubit extends Cubit<NCLShipInformationState> {
  NCLShipInformationCubit({
    NCLShipInformationState? state,
    required NCLServiceInterface nclService,
    required ConnectivityServiceInterface connectivityService,
  })  : _nclService = nclService,
        _connectivityService = connectivityService,
        super(state ?? const NCLShipInformationState());

  final NCLServiceInterface _nclService;
  final ConnectivityServiceInterface _connectivityService;

  Future<void> fetchShipInformation(ShipName shipName) async {
    emit(state.copyWith(requestState: NetworkRequestState.loading));

    (await _nclService.fetchShipModelFromLocalDB(shipName)).fold((shipInfo) {
      emit(state.copyWith(
        requestState: NetworkRequestState.cached,
        shipModel: shipInfo,
      ));
    }, (error) {
      /// possibly do nothing - but we would be stuck in a perpetual loading
      /// state if we didnt have service
    });

    if (await _connectivityService.hasService()) {
      (await _nclService.fetchShipModelFromServer(shipName)).fold(
        (ShipModel shipModel) {
          emit(state.copyWith(
            requestState: NetworkRequestState.loaded,
            shipModel: shipModel,
          ));
        },
        (ShipInformationError error) {
          emit(state.copyWith(
            requestState: NetworkRequestState.error,
            error: error.description,
          ));
        },
      );
    }
  }
}
