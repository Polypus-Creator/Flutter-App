import 'package:flutter/material.dart';
import 'package:polypus_app/src/models/ui/screens/design_web.dart';
import 'package:polypus_app/src/models/ui/screens/graphics.dart';
import 'package:polypus_app/src/models/ui/screens/incident.dart';
import 'package:polypus_app/src/models/ui/screens/profile.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    Graphics(),
    DesignWeb(),
    Incident(),
    Profile(),

    // Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pageList[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.add_chart), label: "Estadistica"),
            BottomNavigationBarItem(
                icon: Icon(Icons.color_lens), label: "Diseño"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_alert), label: "Incidencias"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          ],
          selectedItemColor: Colors.blue,
          backgroundColor: Colors.red[300],
          unselectedItemColor: Colors.blueGrey,
          showUnselectedLabels: true,
        ));
  }
}
