import 'package:ez/model/response/routing_model.dart';
import 'package:ez/model/response/view_model.dart';
import 'package:ez/utils/json_utils.dart';

import 'balance_model.dart';

class AccountModel {
  String id;
  String label;
  String bankId;
  List<RoutingModel> accountRoutings;
  BalanceModel balance;
  List<ViewModel> views;

  AccountModel({this.id, this.label, this.bankId, this.accountRoutings, this.balance, this.views});

  AccountModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        label = json['label'],
        bankId = json['bank_id'],
        accountRoutings = JsonUtils.toList(json['account_routings'], (e) => RoutingModel.fromJson(e as Map)),
        balance = json['balance'] == null ? null : BalanceModel.fromJson(json['balance']),
        views = json['views'] == null ? null : JsonUtils.toList(json['views'], (e) => ViewModel.fromJson(e as Map));
}