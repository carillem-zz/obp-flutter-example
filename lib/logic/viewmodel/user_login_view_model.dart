import 'dart:async';

import 'package:ez/services/abstract/api_service.dart';
import 'package:ez/services/network_service_response.dart';
import 'package:flutter/cupertino.dart';

class UserLoginViewModel {
  String username, pass;
  NetworkServiceResponse apiResut;

  //for login
  UserLoginViewModel.withPass({@required this.username, @required this.pass});

  Future<Null> performLogin(UserLoginViewModel userLogin) async {
    NetworkServiceResponse result =
        await ApiService.directLogin(username, pass);
    this.apiResut = result;
  }
}
