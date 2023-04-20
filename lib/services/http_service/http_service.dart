import 'package:ncl_assessment/services/http_service/http_service_interface.dart';
import 'package:http/http.dart' as http;

class HTTPService extends HTTPServiceInterface {
  @override
  Future<http.Response> get(Uri uri) {
    return http.get(uri);
  }
}
