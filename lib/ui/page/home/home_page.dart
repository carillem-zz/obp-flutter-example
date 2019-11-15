import 'package:ez/utils/constants.dart';
import 'package:flutter/cupertino.dart';

import 'card_viewpager_widget.dart';

class  HomePage extends StatelessWidget {
  static const String title = Constants.home;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Wrap(
          children: <Widget>[
            CardViewpagerWidget()
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}
