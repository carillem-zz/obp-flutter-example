import 'dart:async';

import 'package:ez/logic/viewmodel/home_view_model.dart';
import 'package:ez/model/fetch_process.dart';
import 'package:rxdart/rxdart.dart';

class BalanceBloc {
  final balanceController = StreamController<HomeViewModel>();
  final apiController = BehaviorSubject<FetchProcess>();

  Sink get balanceSink => balanceController.sink;

  Stream<FetchProcess> get balanceResult => apiController.stream;

  BalanceBloc() {
    balanceController.stream.listen(apiCheckBalanceCall);
  }

  void apiCheckBalanceCall(HomeViewModel viewModel) async {
    FetchProcess process = FetchProcess(loading: true);
    //for progress loading
    apiController.add(process);
    process.type = ApiType.performCheckBalance;
    await viewModel.getBalance();

    process.loading = false;
    process.response = viewModel.apiBalanceResult;
    //for error dialog
    apiController.add(process);
    viewModel = null;
  }

  void dispose() {
    balanceController.close();
    apiController.close();
  }

}