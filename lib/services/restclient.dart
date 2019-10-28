import 'dart:async';
import 'dart:convert';
import 'package:ez/model/user_model.dart';
import 'package:ez/utils/constants.dart';

import 'network_service_response.dart';
import 'package:http/http.dart' as http;

class RestClient {

  static var _instance;
  static RestClient getInstance() {
    if(_instance == null)
      _instance = new RestClient();
    return _instance;
  }

  Map<String, String> getHeader() {
    return {
      "Content-Type": 'application/json',
      "Authorization": 'DirectLogin token=${UserModel.getInstance().getToken()}',
    };
  }

  Future<MappedNetworkServiceResponse<T>> getAsync<T>(
      String resourcePath) async {
    var response = await http.get(Constants.API_HOST + resourcePath, headers: getHeader());
    return processResponse<T>(response);
  }

  Future<MappedNetworkServiceResponse<T>> postAsync<T>(
      String resourcePath, dynamic data) async {
    var content = json.encoder.convert(data);
    var response =
    await http.post(Constants.API_HOST + resourcePath, body: content, headers: getHeader());
    return processResponse<T>(response);
  }

  Future<MappedNetworkServiceResponse<T>> postAsyncWithCustomHeader<T>(
      String resourcePath, dynamic data, Map<String, String> headers) async {
    var content = json.encoder.convert(data);
    var response =
    await http.post(Constants.API_HOST + resourcePath, body: content, headers: headers);
    return processResponse<T>(response);
  }

  MappedNetworkServiceResponse<T> processResponse<T>(http.Response response) {
    if (!((response.statusCode < 200) ||
        (response.statusCode >= 300) ||
        (response.body == null))) {
      var jsonResult = response.body;
      dynamic resultClass = jsonDecode(jsonResult);

      return new MappedNetworkServiceResponse<T>(
          mappedResult: resultClass,
          networkServiceResponse: new NetworkServiceResponse<T>(success: true));
    } else {
      var errorResponse = response.body;
      return new MappedNetworkServiceResponse<T>(
          networkServiceResponse: new NetworkServiceResponse<T>(
              success: false,
              message: "(${response.statusCode}) ${errorResponse.toString()}"));
    }
  }
}