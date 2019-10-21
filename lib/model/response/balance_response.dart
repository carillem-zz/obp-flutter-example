import 'package:ez/utils/json_utils.dart';

import 'account_model.dart';
import 'balance_model.dart';

class BalanceResponse {
  List<AccountModel> accounts;
  BalanceModel overallBalance;
  String overallBalanceDate;

  BalanceResponse({this.accounts, this.overallBalance, this.overallBalanceDate});

  BalanceResponse.fromJson(Map<String, dynamic> json)
      : accounts = JsonUtils.toList(json['accounts'], (e) => AccountModel.fromJson(e as Map)),
        overallBalance = json['overall_balance'] == null ? null : BalanceModel.fromJson(json['overall_balance']),
        overallBalanceDate = json['overall_balance_date'];
}