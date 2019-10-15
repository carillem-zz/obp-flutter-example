import 'dart:async';

import 'package:ez/logic/viewmodel/user_login_view_model.dart';
import 'package:ez/model/fetch_process.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final passController = StreamController<UserLoginViewModel>();
  final loginController = StreamController<UserLoginViewModel>();
  final apiController = BehaviorSubject<FetchProcess>();
  final usernameResultController = BehaviorSubject<bool>();

  Sink<UserLoginViewModel> get usernameSink => passController.sink;

  Sink<UserLoginViewModel> get loginSink => passController.sink;

  Stream<bool> get usernameResult => usernameResultController.stream;

  Stream<FetchProcess> get apiResult => apiController.stream;

  LoginBloc() {
    passController.stream.listen(apiCall);
    loginController.stream.listen(apiCall);
  }

  void apiCall(UserLoginViewModel userLogin) async {
    FetchProcess process = FetchProcess(loading: true);
    //for progress loading
    apiController.add(process);
    if (userLogin.pass == null) {
      process.type = ApiType.validateUsername;
      await userLogin.validateUsername(userLogin.username);
      usernameResultController.add(userLogin.usernameResult);
    } else {
      process.type = ApiType.performLogin;
      await userLogin.performLogin(userLogin);
    }

    process.loading = false;
    process.response = userLogin.apiResut;
    //for error dialog
    apiController.add(process);
    userLogin = null;
  }

  void dispose() {
    passController.close();
    apiController.close();
    usernameResultController.close();
    loginController.close();
  }
}
