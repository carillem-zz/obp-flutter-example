import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  static const String appName = "ez";
  static const String API_HOST = "https://apisandbox.openbankproject.com/"; // Strings => "https://apisandbox.strings.my/";
  static const String CONSUMER_KEY = "kuiknznqavm02ai452njrbko4zeqdvxecdhdlzbm"; // Strings => "agimlpwjfrl32yvibqj3gp11nkedfy20kovi1f5z";
  static const String BANK_ID = "inv.01.us.inv"; // Strings => "CIBBMYKL";

  static const String enter_valid_username_password = "Enter valid username and password";

  //assets path
  static const String imageDir = "assets/images";
  static const String strings_logo_path = "$imageDir/strings_logo.png";
  static const String avatar_path = "$imageDir/avatar.png";
  static const String map_path = "$imageDir/map.png";

  //login
  static const String enter_username_hint = "Enter username";
  static const String enter_username_label = "Username";
  static const String enter_pass_hint = "Enter password";
  static const String enter_pass_label = "Password";
  static const String next = "Next";
  static const String login = "login";

  //accounts
  static const String no_account = "You dont have any bank account. Please create one..";

  //gneric
  static const String error = "Error";
  static const String success = "Success";
  static const String ok = "OK";
  static const String balance = "Balance";

  //colors
  static List<Color> kitGradients = [appColor, Colors.red.shade800];
  static List<Color> bgGradients = [Colors.red.shade900, Colors.red.shade100];
  static const Color appColor = Color(0xFFe35c55);

}
