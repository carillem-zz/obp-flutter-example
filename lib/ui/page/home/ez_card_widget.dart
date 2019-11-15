import 'package:ez/model/response/account_model.dart';
import 'package:ez/model/user_model.dart';
import 'package:ez/ui/page/home/card_entries.dart';
import 'package:ez/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExCardWidget extends StatelessWidget {

  final AccountModel accountModel;
  ExCardWidget({this.accountModel});

  @override
  Widget build(BuildContext context) {
    UserModel.getInstance().setAccountModel(accountModel);
    var deviceSize = MediaQuery.of(context).size;
    var cardEntries = CardEntries(accountModel: accountModel);
    return Container(
      height: deviceSize.height * 0.3,
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(9.0, 9.0, 9.0, 20),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 3.0,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: Constants.kitGradients)),
              ),
              Opacity(
                opacity: 0.1,
                child: Image.asset(
                  Constants.map_path,
                  fit: BoxFit.cover,
                ),
              ),
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? cardEntries
                  : FittedBox(
                      child: cardEntries,
                    ),
              Positioned(
                right: 10.0,
                top: 10.0,
                child: Image.asset(Constants.strings_logo_path),
              ),
              Positioned(
                right: 10.0,
                bottom: 10.0,
                child: Text(
                  accountModel?.label == null
                      ? "" : accountModel.label,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
