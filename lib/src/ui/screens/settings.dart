import 'package:flutter/material.dart';
import 'package:polypus_app/src/api/api_requests.dart';
import 'package:polypus_app/src/config/routes.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
      ),
      body: Center(
        child: ListView(children: [
          Card(
              child: ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.blue,
            ),
            title: Text(
              "Información",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {},
          )),
          Card(
              child: ListTile(
            leading: Icon(
              Icons.help,
              color: Colors.blue,
            ),
            title: Text(
              "Ayuda",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {},
          )),
          Card(
              child: ListTile(
            leading: Icon(
              Icons.security,
              color: Colors.blue,
            ),
            title: Text(
              "Seguridad",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {},
          )),
          Card(
              child: ListTile(
            leading: Icon(
              Icons.lock,
              color: Colors.blue,
            ),
            title: Text(
              "Privacidad",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {},
          )),
          Card(
              child: ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.blue,
            ),
            title: Text(
              "Cerrar sesión",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              ApiClient().logout().then((value) {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacementNamed(context, Routes.logIn);
              });
            },
          )),
        ]),
      ),
    );
  }
}
