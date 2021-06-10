import 'package:flutter/material.dart';
import 'package:polypus_app/src/ui/screens/settings.dart';

class DesignWeb extends StatefulWidget {
  @override
  _DesignWebState createState() => _DesignWebState();
}

class _DesignWebState extends State<DesignWeb> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: ListTile(
            leading: Icon(
              Icons.color_lens,
              color: Colors.blue,
            ),
            title: Text(
              "Color primario",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {},
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.color_lens,
              color: Colors.blue,
            ),
            title: Text(
              "Color secundario",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {},
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.title,
              color: Colors.blue,
            ),
            title: Text(
              "Fuente de letra",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
