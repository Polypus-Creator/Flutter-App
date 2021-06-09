import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:polypus_app/src/config/globals.dart';
import 'package:polypus_app/src/config/routes.dart';
import 'package:polypus_app/src/config/styles.dart';
import 'package:polypus_app/src/models/ui/screens/index.dart';
import 'package:polypus_app/src/models/ui/screens/log_in.dart';
import 'package:polypus_app/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? user = prefs.getString(Globals.userKey);
  if (user != null) {
    Globals.token = prefs.getString(Globals.tokenKey);
    Globals.user = User.fromMap(jsonDecode(user));
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polypus Creator',
      darkTheme: AppStyles.darkTheme,
      theme: AppStyles.mainTheme,
      routes: {
        Routes.logIn: (context) => LogIN(),
        Routes.mainHolder: (context) => Index(),
      },
      supportedLocales: [Locale("es", "es")],
      initialRoute: Globals.user == null ? Routes.logIn : Routes.mainHolder,
    );
  }
}
