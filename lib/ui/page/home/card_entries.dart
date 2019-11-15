import 'package:ez/logic/bloc/balance_bloc.dart';
import 'package:ez/logic/viewmodel/home_view_model.dart';
import 'package:ez/model/fetch_process.dart';
import 'package:ez/model/response/account_model.dart';
import 'package:ez/model/response/balance_response.dart';
import 'package:ez/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardEntries extends StatefulWidget {

  final AccountModel accountModel;
  CardEntries({this.accountModel});

  @override
  _CardEntriesState createState() => new _CardEntriesState();
}

class _CardEntriesState extends State<CardEntries>
    with SingleTickerProviderStateMixin {

  BalanceBloc balanceBloc;

  @override
  void initState() {
    super.initState();
    balanceBloc = new BalanceBloc();
    balanceBloc.balanceSink.add(HomeViewModel());
  }

  @override
  void dispose() {
    super.dispose();
    balanceBloc?.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<FetchProcess>(
      stream: balanceBloc.balanceResult,
      builder: (context, snapshot) => Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "ez",
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(Constants.balance,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                      (snapshot?.data?.response?.content as BalanceResponse)?.overallBalance?.amount == null
                          ? '' : "${(snapshot?.data?.response?.content as BalanceResponse)?.overallBalance?.currency} " +
                          "${(snapshot?.data?.response?.content as BalanceResponse)?.overallBalance?.amount}",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}