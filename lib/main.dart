import 'package:flutter/material.dart';
import 'package:polypus_app/src/models/ui/screens/log_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polypus_App',
    darkTheme: ThemeData(
      brightness: Brightness.dark
    ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogIN(),
    );
  }
}

