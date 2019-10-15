import 'package:flutter/cupertino.dart';

import 'login_card.dart';

class LoginWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(child: Center(child: LoginCard())),
    );
  }
}
