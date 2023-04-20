import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ncl_assessment/models/network_request_state.dart';
import 'package:ncl_assessment/models/ship_model.dart';
import 'package:ncl_assessment/models/ship_name_enum.dart';

import 'package:ncl_assessment/state_managers/ncl_ship_information/ncl_ship_information_cubit.dart';
import 'package:ncl_assessment/state_managers/ncl_ship_information/ncl_ship_information_state.dart';

import 'mocks.dart';

void main() {
  group('ncl ship information cubit tests', () {
    final mockNCLService = MockNCLService();
    final mockConnectivityService = MockConnectivityService();

    final cachedModel = ShipModel(
      'Norwegian Bliss',
      ShipFacts("capacity", "crew", "inaugural date"),
    );

    final responseModel = ShipModel(
      'Updated Norwegian Bliss',
      ShipFacts("capacity", "crew", "inaugural date"),
    );

    blocTest<NCLShipInformationCubit, NCLShipInformationState>(
      'fetch information information successfully when user has service with cached data present',
      build: () {
        /// Unfortunately I did not have time to figure out how to return an either from a Mock
        ///
        ///
        // when(() => mockNCLService.fetchShipModelFromLocalDB(ShipName.bliss))
        //     .thenAnswer(
        //   (_) =>
        //       Future.value(Left<ShipModel?, ShipInformationError>(cachedModel)),
        // );

        // when(() => mockNCLService.fetchShipModelFromServer(ShipName.bliss))
        //     .thenAnswer(
        //   (_) =>
        //       Future.value(Left<ShipModel?, ShipInformationError>(responseModel)),
        // );

        return NCLShipInformationCubit(
          nclService: mockNCLService,
          connectivityService: mockConnectivityService,
        );
      },
      act: (bloc) => bloc.fetchShipInformation(ShipName.bliss),
      expect: () => <NCLShipInformationState>[
        const NCLShipInformationState(),
        const NCLShipInformationState(
            requestState: NetworkRequestState.loading),
        NCLShipInformationState(
            requestState: NetworkRequestState.cached, shipModel: cachedModel),
        NCLShipInformationState(
          requestState: NetworkRequestState.loaded,
          shipModel: responseModel,
        )
      ],
    );

    blocTest<NCLShipInformationCubit, NCLShipInformationState>(
      'fetch information information successfully when user has service with no cached data present',
      build: () {
        return NCLShipInformationCubit(
          nclService: mockNCLService,
          connectivityService: mockConnectivityService,
        );
      },
      act: (bloc) => bloc.fetchShipInformation(ShipName.bliss),
      expect: () => <NCLShipInformationState>[
        const NCLShipInformationState(),
      ],
    );

    blocTest<NCLShipInformationCubit, NCLShipInformationState>(
      'failure fetching information when user has service with no cached data present',
      build: () {
        return NCLShipInformationCubit(
          nclService: mockNCLService,
          connectivityService: mockConnectivityService,
        );
      },
      act: (bloc) => bloc.fetchShipInformation(ShipName.bliss),
      expect: () => <NCLShipInformationState>[
        const NCLShipInformationState(),
      ],
    );

    blocTest<NCLShipInformationCubit, NCLShipInformationState>(
      'failure fetching information when user has service with cached data present',
      build: () {
        return NCLShipInformationCubit(
          nclService: mockNCLService,
          connectivityService: mockConnectivityService,
        );
      },
      act: (bloc) => bloc.fetchShipInformation(ShipName.bliss),
      expect: () => <NCLShipInformationState>[
        const NCLShipInformationState(),
      ],
    );

    blocTest<NCLShipInformationCubit, NCLShipInformationState>(
      'Fetch local information successfully when no service',
      build: () {
        return NCLShipInformationCubit(
          nclService: mockNCLService,
          connectivityService: mockConnectivityService,
        );
      },
      act: (bloc) => bloc.fetchShipInformation(ShipName.bliss),
      expect: () => <NCLShipInformationState>[
        const NCLShipInformationState(),
      ],
    );

    blocTest<NCLShipInformationCubit, NCLShipInformationState>(
      'fail to fetch local information when no service',
      build: () {
        return NCLShipInformationCubit(
          nclService: mockNCLService,
          connectivityService: mockConnectivityService,
        );
      },
      act: (bloc) => bloc.fetchShipInformation(ShipName.bliss),
      expect: () => <NCLShipInformationState>[
        const NCLShipInformationState(),
      ],
    );
  });
}
