import 'package:charts_flutter/flutter.dart' as charts;
import 'package:ez/ui/widgets/bar_chart.dart';
import 'package:ez/ui/widgets/donut_pie_chart.dart';
import 'package:ez/ui/widgets/time_series_chart.dart';
import 'package:ez/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnalyticPage extends StatelessWidget {
  static const String title = Constants.analytic;

  @override
  Widget build(BuildContext context) {
    // **** Custom data *****
    var dateNow = DateTime.now();
    var data = [
      BalanceHistory(dateNow, 100),
      BalanceHistory(dateNow.add(Duration(days: -1)), 100),
      BalanceHistory(dateNow.add(Duration(days: -2)), 100),
      BalanceHistory(dateNow.add(Duration(days: -3)), 50),
      BalanceHistory(dateNow.add(Duration(days: -4)), 50),
      BalanceHistory(dateNow.add(Duration(days: -5)), 50),
      BalanceHistory(dateNow.add(Duration(days: -6)), 30),
      BalanceHistory(dateNow.add(Duration(days: -7)), 30),
      BalanceHistory(dateNow.add(Duration(days: -8)), 30),
      BalanceHistory(dateNow.add(Duration(days: -9)), 20),
      BalanceHistory(dateNow.add(Duration(days: -10)), 0),
      BalanceHistory(dateNow.add(Duration(days: -11)), 0),
      BalanceHistory(dateNow.add(Duration(days: -12)), 0),
      BalanceHistory(dateNow.add(Duration(days: -13)), 0)
    ];

    var usageData = [
      UsageHistory("Bill", 150),
      UsageHistory("Food & Beverage", 75),
      UsageHistory("Retail", 40),
      UsageHistory("Transportation", 20),
    ];

    var monthData = [
      UsageHistory("Jan", 150),
      UsageHistory("Feb", 75),
      UsageHistory("Mar", 40),
      UsageHistory("Apr", 20),
      UsageHistory("May", 30),
      UsageHistory("Jun", 10),
      UsageHistory("Jul", 15),
      UsageHistory("Aug", 100),
      UsageHistory("Sep", 0),
      UsageHistory("Oct", 0),
      UsageHistory("Nov", 0),
      UsageHistory("Dec", 0),
    ];

    var series = [
      charts.Series(
        domainFn: (BalanceHistory balance, _) => balance.dateTime,
        measureFn: (BalanceHistory balance, _) => balance.balance,
        id: Constants.balance,
        data: data,
      )
    ];

    var usageSeries = [
      charts.Series(
        domainFn: (UsageHistory usage, _) => usage.usage,
        measureFn: (UsageHistory usage, _) => usage.amount,
        id: "Usage",
        data: usageData,
      )
    ];

    var monthUsageSeries = [
      charts.Series(
        domainFn: (UsageHistory usage, _) => usage.usage,
        measureFn: (UsageHistory usage, _) => usage.amount,
        id: "Usage",
        data: monthData,
      )
    ];

    // **** End custom data *****

    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: Constants.bgGradients,
          )),
          child: SizedBox(
            height: 200.0,
            child: TimeSeriesChart(series, animate: true),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 24.0, 8, 24.0),
          child: SizedBox(
            height: 200.0,
            child: DonutPieChart(usageSeries, animate: true),
          ),
        ),
        Card(
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              height: 200.0,
              child: BarChart(monthUsageSeries, animate: true),
            ),
          ),
        ),
      ],
    );
  }
}

// *** Custom class for data ***
class BalanceHistory {
  DateTime dateTime;
  double balance;

  BalanceHistory(this.dateTime, this.balance);
}

class UsageHistory {
  String usage;
  double amount;

  UsageHistory(this.usage, this.amount);
}
// *** End custom class for data ***
