import 'package:ez/model/response/account_model.dart';

class UserModel {
  static UserModel _instance;
  String _token;
  String _username;
  AccountModel _accountModel;

  static UserModel getInstance() {
    if (_instance == null)
      _instance = new UserModel();
    return _instance;
  }

  setToken(String token) {
    _token = token;
  }

  setUsername(String username) {
    _username = username;
  }

  setAccountModel(AccountModel accountModel) {
    _accountModel = accountModel;
  }

  String getToken() {
    return _token;
  }

  String getUsername() {
    return _username;
  }

  AccountModel getAccountModel() {
    return _accountModel;
  }

  clearInstance() {
    _instance = null;
  }
}