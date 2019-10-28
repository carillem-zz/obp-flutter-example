import 'dart:async';

import 'package:ez/logic/viewmodel/user_login_view_model.dart';
import 'package:ez/model/fetch_process.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final loginController = StreamController<UserLoginViewModel>();
  final apiController = BehaviorSubject<FetchProcess>();

  Sink<UserLoginViewModel> get loginSink => loginController.sink;

  Stream<FetchProcess> get apiResult => apiController.stream;

  LoginBloc() {
    loginController.stream.listen(apiCall);
  }

  void apiCall(UserLoginViewModel userLogin) async {
    FetchProcess process = FetchProcess(loading: true);
    //for progress loading
    apiController.add(process);
    process.type = ApiType.performLogin;
    await userLogin.performLogin(userLogin);

    process.loading = false;
    process.response = userLogin.apiResut;
    //for error dialog
    apiController.add(process);
    userLogin = null;
  }

  void dispose() {
    loginController.close();
    apiController.close();
  }
}
