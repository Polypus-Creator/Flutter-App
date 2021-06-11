import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:polypus_app/src/config/globals.dart';
import 'package:polypus_app/src/config/styles.dart';
import 'package:polypus_app/src/util/util.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    String _avatarUrl = "https://eu.ui-avatars.com/api/"
        "?name=${Globals.user!.username}&size=512"
        "&background=${AppStyles.primaryColor.toHex()}";
    DateFormat _dateFormatter =
        DateFormat.yMMMMEEEEd(Localizations.localeOf(context).languageCode);
    return ListView(
      children: [
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                CircleAvatar(
                  backgroundImage: NetworkImage(_avatarUrl),
                  radius: 70.0,
                ),
                SizedBox(height: 10.0),
                Text(
                  Globals.user!.username,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ],
        ),
        Card(
          child: ListTile(
            title: Text("Miembro desde",
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(_dateFormatter.format(Globals.user!.createDate)),
            trailing: Icon(
              Icons.date_range,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(Globals.user!.email),
            trailing: Icon(
              Icons.email,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Tipo de Cuenta",
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("Premium"),
            trailing: Icon(
              Icons.person,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ],
    );
  }
}
