import 'package:mockito/mockito.dart';
import 'package:ncl_assessment/services/connectivity_service/connectivity_service_interface.dart';
import 'package:ncl_assessment/services/ncl_service/ncl_service_interface.dart';

class MockNCLService extends Mock implements NCLServiceInterface {}

class MockConnectivityService extends Mock
    implements ConnectivityServiceInterface {}
