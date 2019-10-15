import 'package:flutter/cupertino.dart';

class LoginProvider extends InheritedWidget {
  final Function errorCallback;
  final Widget child;

  LoginProvider({this.errorCallback, this.child}) : super(child: child);

  static LoginProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(LoginProvider);

  @override
  bool updateShouldNotify(LoginProvider oldWidget) =>
      errorCallback != oldWidget.errorCallback;
}
