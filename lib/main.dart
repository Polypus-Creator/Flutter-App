import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:polypus_app/src/config/globals.dart';
import 'package:polypus_app/src/config/routes.dart';
import 'package:polypus_app/src/config/styles.dart';
import 'package:polypus_app/src/models/user.dart';
import 'package:polypus_app/src/ui/screens/auth/log_in.dart';
import 'package:polypus_app/src/ui/screens/auth/recover_password.dart';
import 'package:polypus_app/src/ui/screens/auth/register.dart';
import 'package:polypus_app/src/ui/screens/main_holder.dart';
import 'package:polypus_app/src/ui/screens/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? user = prefs.getString(Globals.userKey);
  if (user != null) {
    print("loading user");
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
        Routes.logIn: (context) => LogIn(),
        Routes.register: (context) => Register(),
        Routes.recoverPassword: (context) => RecoverPassword(),
        Routes.mainHolder: (context) => MainHolder(),
        Routes.settings: (context) => Settings(),
      },
      initialRoute: Globals.user == null ? Routes.logIn : Routes.mainHolder,
    );
  }
}
