import 'package:flutter/material.dart';
import 'package:polypus_app/src/ui/screens/settings.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Perfil"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  _password();
                },
                icon: Icon(Icons.settings))
          ],
          automaticallyImplyLeading: false,
        ),
        body: ListView(children: [
          Column(children: [
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blue.shade800, Colors.blue.shade100])),
                child: Container(
                    width: double.infinity,
                    height: 350.0,
                    child: Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/rostroPerfil.jpg'),
                          radius: 70.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Eduardo Rodriguez",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            clipBehavior: Clip.antiAlias,
                            color: Colors.white,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 22.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    "Polypus Creator",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ))
                                ],
                              ),
                            ))
                      ],
                    )))),
          ]),
          Card(
            child: ListTile(
              title: Text("Fecha de Nacimiento",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("15 de Febrero de 1999"),
              trailing: Icon(Icons.date_range),
            ),
          ),
          Card(
            child: ListTile(
              title:
                  Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Alejandro@polypus.com"),
              trailing: Icon(Icons.email),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Numero de Contacto",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("606589453"),
              trailing: Icon(Icons.call),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Tipo de Cuenta",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Premium"),
              trailing: Icon(Icons.person),
            ),
          )
        ]));
  }

  void _password() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Settings()));
  }
}
