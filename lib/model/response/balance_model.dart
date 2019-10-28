class BalanceModel {
  String currency;
  String amount;

  BalanceModel({this.currency, this.amount});

  BalanceModel.fromJson(Map<String, dynamic> json)
      : currency = json['currency'],
        amount = json['amount'];
}