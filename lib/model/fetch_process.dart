import 'package:ez/services/network_service_response.dart';

enum ApiType {performLogin, performCheckBalance, perfromGetAccountList}

class FetchProcess<T> {
  ApiType type;
  bool loading;
  NetworkServiceResponse<T> response;

  FetchProcess({this.loading, this.response, this.type});
}
