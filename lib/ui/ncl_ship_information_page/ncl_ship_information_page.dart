import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncl_assessment/models/network_request_state.dart';
import 'package:ncl_assessment/models/ship_name_enum.dart';
import 'package:ncl_assessment/state_managers/ncl_ship_information/ncl_ship_information_cubit.dart';
import 'package:ncl_assessment/state_managers/ncl_ship_information/ncl_ship_information_state.dart';
import 'package:ncl_assessment/ui/ncl_ship_information_page/components/ship_information_widget.dart';

class ShipInformationPage extends StatelessWidget {
  const ShipInformationPage({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Norwegian Cruise Lines"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<NCLShipInformationCubit,
                    NCLShipInformationState>(
                  builder: (context, state) {
                    switch (state.requestState) {
                      case NetworkRequestState.idle:
                        return const Text("please select a ship below");
                      case NetworkRequestState.loading:
                        return const CircularProgressIndicator();
                      case NetworkRequestState.cached:
                      case NetworkRequestState.loaded:
                        final shipModel = state.shipModel!;
                        return ShipInformationWidget(
                          shipName: shipModel.shipName,
                          crew: shipModel.shipFacts.crew,
                          inauguralDate: shipModel.shipFacts.inauguralDate,
                          passengerCapacity:
                              shipModel.shipFacts.passengerCapacity,
                        );
                      case NetworkRequestState.error:
                        return Text(state.error!);
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (ShipName shipName in ShipName.values)
                    TextButton(
                      onPressed: () {
                        context
                            .read<NCLShipInformationCubit>()
                            .fetchShipInformation(shipName);
                      },
                      child: Text(
                        shipName.displayTitle,
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
