import 'dart:async';

import 'package:ez/model/fetch_process.dart';
import 'package:ez/model/response/balance_response.dart';
import 'package:ez/services/abstract/api_service.dart';
import 'package:ez/services/network_service_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class AccountListBlock {
  final accountListController = StreamController<BuildContext>();
  final apiController = BehaviorSubject<FetchProcess>();

  Sink get accountsSink => accountListController.sink;

  Stream<FetchProcess> get accountsResult => apiController.stream;

  AccountListBlock() {
    accountListController.stream.listen(apiGetAccountsCall);
  }

  void apiGetAccountsCall(BuildContext context) async {
    FetchProcess process = FetchProcess(loading: true);

    //for progress loading
    apiController.add(process);
    process.type = ApiType.perfromGetAccountList;
    NetworkServiceResponse<BalanceResponse> result = await ApiService.getAllAccount();

    process.loading = false;
    process.response = result;
    //for error dialog
    apiController.add(process);
  }

  void dispose() {
    accountListController.close();
    apiController.close();
  }
}