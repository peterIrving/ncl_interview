import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncl_assessment/services/connectivity_service/connectivity_service.dart';
import 'package:ncl_assessment/services/http_service/http_service.dart';
import 'package:ncl_assessment/services/ncl_service/ncl_service.dart';
import 'package:ncl_assessment/state_managers/ncl_ship_information/ncl_ship_information_cubit.dart';
import 'package:ncl_assessment/ui/ncl_ship_information_page/ncl_ship_information_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return NCLShipInformationCubit(
          nclService: NCLService(HTTPService()),
          connectivityService: ConnectivityService(),
        );
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ShipInformationPage(),
      ),
    );
  }
}
