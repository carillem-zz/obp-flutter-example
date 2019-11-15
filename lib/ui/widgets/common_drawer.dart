import 'package:ez/model/user_model.dart';
import 'package:ez/ui/page/login/login_page.dart';
import 'package:ez/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void logOut() {
      UserModel.getInstance().clearInstance();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  LoginPage()), (Route<dynamic> route) => false);
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              UserModel.getInstance().getUsername() == null
                  ? "" : UserModel.getInstance().getUsername(),
            ),
            accountEmail: Text("019-*******"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(Constants.avatar_path),
            ),
          ),
          ListTile(
            title: Text(
              "Me",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.person_outline,
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text(
              "Promotion",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.lightbulb_outline,
              color: Colors.green,
            ),
          ),
          ListTile(
            title: Text(
              "Mail",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.mail_outline,
              color: Colors.orange,
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.brown,
            ),
          ),
          ListTile(
            title: Text(
              "Log out",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            onTap: logOut,
          ),
        ],
      ),
    );
  }
}
