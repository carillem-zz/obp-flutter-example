import 'package:ez/services/network_service_response.dart';

enum ApiType { validateUsername, performLogin }

class FetchProcess<T> {
  ApiType type;
  bool loading;
  NetworkServiceResponse<T> response;

  FetchProcess({this.loading, this.response, this.type});
}
