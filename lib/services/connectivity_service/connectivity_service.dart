import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ncl_assessment/services/connectivity_service/connectivity_service_interface.dart';

class ConnectivityService extends ConnectivityServiceInterface {
  @override
  Future<bool> hasService() async {
    try {
      return await InternetConnectionChecker().hasConnection;
    } catch (e) {
      /// not sure what we would want to do here if this package fails on us
      /// so for now just defaulting to returning false
      return false;
    }
  }
}
