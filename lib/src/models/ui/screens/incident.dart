import 'package:flutter/material.dart';
import 'package:polypus_app/src/models/ui/screens/settings.dart';

class Incident extends StatefulWidget {
  @override
  _IncidentState createState() => _IncidentState();
}

class _IncidentState extends State<Incident> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  _password();
                },
                icon: Icon(Icons.settings))
          ],
          title: Text("Incidencias"),
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 35, horizontal: 16),
                child: Text(
                  "¿Tienes alguna duda o suegeriencia?¡Haznoslo saber!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                )),
            Container(
              child: Image.asset(
                'assets/globo.png',
                width: 120.0,
                height: 120.0,
              ),
            ),

            //TEXTFIELD NOMBRE:
            Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: "Nombre",
                  ),
                )),

            //TEXTFIELD EMAIL:
            Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: "Email",
                  ),
                )),
            //TEXTFIELD MESSAGE
            Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextField(
                  maxLines: 8,
                  maxLength: 500,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    hintText: "Mensaje...",
                  ),
                )),
            //BUTTON
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Enviar'),
              ),
            ),
          ],
        ));
  }

  void _password() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Settings()));
  }
}
