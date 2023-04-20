import 'package:http/http.dart';

abstract class HTTPServiceInterface {
  Future<Response> get(Uri uri);
}
