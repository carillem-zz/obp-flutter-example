import 'dart:async';

import 'package:ez/services/network_service_response.dart';
import 'package:flutter/cupertino.dart';

class UserLoginViewModel {
  String username, pass;
  bool usernameResult = false;
  NetworkServiceResponse apiResut;

  //ILoginService loginRepo;

  //for username
  UserLoginViewModel({@required this.username});

  //for login
  UserLoginViewModel.withPass({@required this.username, @required this.pass});

  Future<Null> validateUsername(String username) async {
    //TODO: initiate api validate username
    this.usernameResult = true;
    this.apiResut = null;
  }

  Future<Null> performLogin(UserLoginViewModel userLogin) async {
    //TODO: initiate api login
    this.apiResut = null;
  }
}
