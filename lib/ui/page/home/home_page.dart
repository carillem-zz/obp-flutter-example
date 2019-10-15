import 'package:flutter/cupertino.dart';

import 'ez_card_widget.dart';

class HomePage extends StatelessWidget {
  static const String title = "Home";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ExCardWidget(),
        Padding(
          padding: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}
