import 'package:ez/utils/uidata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height * 0.3,
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 3.0,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: UIData.kitGradients)),
              ),
              Opacity(
                opacity: 0.1,
                child: Image.asset(
                  UIData.map_path,
                  fit: BoxFit.cover,
                ),
              ),
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? cardEntries()
                  : FittedBox(
                      child: cardEntries(),
                    ),
              Positioned(
                right: 10.0,
                top: 10.0,
                child: Image.asset(UIData.strings_logo_path),
              ),
              Positioned(
                right: 10.0,
                bottom: 10.0,
                child: Text(
                  "Aizat Rafee",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardEntries() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "2345 9984 9293 2373",
              style: TextStyle(color: Colors.white, fontSize: 22.0),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Balance",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                SizedBox(
                  height: 5.0,
                ),
                Text("RM 3041.65",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white))
              ],
            )
          ],
        ),
      );
}
