import 'package:ez/logic/bloc/account_list_block.dart';
import 'package:ez/model/fetch_process.dart';
import 'package:ez/model/response/account_model.dart';
import 'package:ez/model/response/balance_response.dart';
import 'package:ez/model/user_model.dart';
import 'package:ez/ui/page/main/main_page.dart';
import 'package:ez/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountList extends StatefulWidget {
  @override
  _AccountListState createState() => new _AccountListState();
}

class _AccountListState extends State<AccountList> {
  AccountListBlock accountListBlock;
  List<AccountModel> _accounts = new List();

  @override
  void initState() {
    accountListBlock = new AccountListBlock();
    accountListBlock.apiGetAccountsCall(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<FetchProcess>(
      stream: accountListBlock.accountsResult,
      builder: (context, snapshot) => Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _setAccounts(snapshot.data),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.account_balance,
                          color: Colors.blueGrey,
                        ),
                        title:Text(_accounts[index]?.label == null ? "" : _accounts[index]?.label),
                        subtitle: Text(_accounts[index]?.bankId == null ? "" : _accounts[index]?.bankId),
                        onTap: () {
                          UserModel.getInstance().setAccountModel(_accounts[index]);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                        },
                      )
                  );
                }
            ),
            _accounts == null || _accounts.isEmpty
                ? Padding(padding: EdgeInsets.all(16.0), child: Text(Constants.no_account))
                : Offstage()
          ],
        )
      ),
    );
  }

  int _setAccounts(FetchProcess fetchProcess) {
    List<AccountModel> model = (fetchProcess?.response?.content as BalanceResponse)?.accounts;
    _accounts = model == null ? new List() : model;
    return _accounts.length;
  }
}
