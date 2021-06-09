import 'package:flutter/material.dart';

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
              Icons.favorite,
              color: Colors.blue,
            ),
            title: Text(
              "Centro de Información sobre el COVID-19",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {},
          )),
        ]),
      ),
    );
  }
}
