
import 'package:ez/logic/bloc/account_list_block.dart';
import 'package:ez/model/fetch_process.dart';
import 'package:ez/model/response/account_model.dart';
import 'package:ez/model/response/balance_response.dart';
import 'package:ez/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

import 'ez_card_widget.dart';

class CardViewpagerWidget extends StatefulWidget {
  @override
  _CardListState createState() => new _CardListState();
}

class _CardListState extends State<CardViewpagerWidget> {

  AccountListBlock accountListBlock;
  List<AccountModel> _accounts = new List();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    accountListBlock = new AccountListBlock();
    accountListBlock.apiGetAccountsCall(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    
    return StreamBuilder<FetchProcess>(
      stream: accountListBlock.accountsResult,
      builder: (context, snapshot) => Form(
        child: Stack(
          children: <Widget>[
            SizedBox(height:  deviceSize.height * 0.3,
              child: PageView.builder(
                itemCount: _setAccounts(snapshot.data),
                onPageChanged: (int index) {
                  _currentPageNotifier.value = index;
                },
                itemBuilder: (BuildContext context, int index) {
                  return ExCardWidget(accountModel: _accounts[index]);
                  },
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CirclePageIndicator(
                  size: 8.0,
                  selectedSize: 10.0,
                  selectedDotColor: Constants.appColor,
                  itemCount: _accounts.length,
                  currentPageNotifier: _currentPageNotifier,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  int _setAccounts(FetchProcess fetchProcess) {
    List<AccountModel> model = (fetchProcess?.response?.content as BalanceResponse)?.accounts;
    _accounts = (model == null) ? new List() : model;
    return _accounts.length;
  }

}