import 'dart:async';

import 'package:ez/inherited/login_provider.dart';
import 'package:ez/logic/bloc/login_bloc.dart';
import 'package:ez/logic/viewmodel/user_login_view_model.dart';
import 'package:ez/model/fetch_process.dart';
import 'package:ez/ui/page/login/login_page.dart';
import 'package:ez/ui/widgets/api_subscription.dart';
import 'package:ez/ui/widgets/gradient_button.dart';
import 'package:ez/utils/uidata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard>
    with SingleTickerProviderStateMixin {
  var deviceSize;
  AnimationController controller;
  Animation<double> animation;
  LoginBloc loginBloc;
  String username, pass;
  StreamSubscription<FetchProcess> apiStreamSubscription;

  Widget loginBuilder() => StreamBuilder<bool>(
        stream: loginBloc.usernameResult,
        initialData: false,
        builder: (context, snapshot) => Form(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                      height: deviceSize.height / 8,
                      width: deviceSize.width / 2,
                      child: Image.asset(UIData.strings_logo_path)),
                  TextField(
                    onChanged: (id) => username = id,
                    enabled: !snapshot.data,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: UIData.enter_username_hint,
                        labelText: UIData.enter_username_label,
                        labelStyle: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  snapshot.data == false
                      ? Offstage()
                      : TextField(
                          onChanged: (password) => pass = password,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                          decoration: InputDecoration(
                              hintText: UIData.enter_pass_hint,
                              labelText: UIData.enter_pass_label,
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.w700)),
                          obscureText: true,
                        ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: snapshot.data == false
                        ? GradientButton(
                            onPressed: () => (username != null &&
                                    username.isNotEmpty)
                                ? loginBloc.usernameSink
                                    .add(UserLoginViewModel(username: username))
                                : showUsernameError(context),
                            text: UIData.next)
                        : GradientButton(
                            onPressed: () => (pass != null && pass.isNotEmpty)
                                ? loginBloc.loginSink.add(
                                    UserLoginViewModel.withPass(
                                        username: username, pass: pass))
                                : showPassError(context),
                            text: UIData.login),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  Widget loginCard() {
    return Opacity(
      opacity: animation.value,
      child: SizedBox(
        height: deviceSize.height / 2 - 20,
        width: deviceSize.width * 0.85,
        child: Card(color: Colors.white, elevation: 2.0, child: loginBuilder()),
      ),
    );
  }

  @override
  initState() {
    super.initState();
    loginBloc = LoginBloc();
    apiStreamSubscription = apiSubscription(loginBloc.apiResult, context);
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    animation.addListener(() => this.setState(() {}));
    controller.forward();
  }

  @override
  dispose() {
    controller?.dispose();
    loginBloc?.dispose();
    apiStreamSubscription?.cancel();
    super.dispose();
  }

  showUsernameError(BuildContext context) {
    LoginProvider.of(context).errorCallback(LoginValidationType.username);
  }

  showPassError(BuildContext context) {
    LoginProvider.of(context).errorCallback(LoginValidationType.pass);
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return loginCard();
  }
}
