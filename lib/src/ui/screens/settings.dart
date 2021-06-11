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
              Icons.info_outline,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              "Información",
            ),
            onTap: () => Navigator.pushNamed(context, Routes.info),
          )),
          Card(
              child: ListTile(
            leading: Icon(
              Icons.help_outline,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              "Ayuda",
            ),
            onTap: () {},
          )),
          Card(
              child: ListTile(
            leading: Icon(
              Icons.task_outlined,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              "Términos de servicio",
            ),
            onTap: () {},
          )),
          Card(
              child: ListTile(
            leading: Icon(
              Icons.policy_outlined,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              "Privacidad",
            ),
            onTap: () {},
          )),
          Card(
              child: ListTile(
                leading: Icon(
              Icons.logout,
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              "Cerrar sesión",
            ),
            onTap: () => _logout(context),
          )),
        ]),
      ),
    );
  }

  void _logout(BuildContext context) {
    ApiClient().logout().then((value) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, Routes.logIn);
    });
  }
}
