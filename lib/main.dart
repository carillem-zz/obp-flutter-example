import 'package:ez/ui/page/login/login_page.dart';
import 'package:ez/utils/uidata.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
    title: UIData.appName,
    theme:
        ThemeData(primaryColor: UIData.appColor, primarySwatch: Colors.amber),
    debugShowCheckedModeBanner: false,
    showPerformanceOverlay: false,
    home: LoginPage(),
  );

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
