import 'package:flutter/material.dart';
import 'package:polypus_app/src/ui/screens/create_ticket.dart';
import 'package:polypus_app/src/ui/screens/design_web.dart';
import 'package:polypus_app/src/ui/screens/profile.dart';
import 'package:polypus_app/src/ui/screens/stats.dart';

class MainHolder extends StatefulWidget {
  @override
  _MainHolderState createState() => _MainHolderState();
}

class _MainHolderState extends State<MainHolder> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    Stats(),
    DesignWeb(),
    CreateTicket(),
    Profile(),

    // Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pageList[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          type: BottomNavigationBarType.fixed,
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
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.blueGrey,
          showUnselectedLabels: true,
        ));
  }
}
