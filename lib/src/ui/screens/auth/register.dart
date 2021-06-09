import 'package:flutter/material.dart';
import 'package:polypus_app/src/api/api_exception.dart';
import 'package:polypus_app/src/api/api_requests.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool hiddenpasswordA = true;
  bool hiddenpasswordB = true;
  ApiClient client = ApiClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Image.asset(
              'assets/polypus.png',
              width: 140.0,
              height: 190.0,
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                "¡Registrate y crea tu web!",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              )),

          // Textfield Nombre
          Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: "Nombre",
                ),
              )),

          //TextField Email
          Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: "Email",
                ),
              )),
          //TextField Usuario
          Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: "Usuario",
                ),
              )),
          //TextField Contraseña
          Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextField(
                obscureText: hiddenpasswordA,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    labelText: "Contraseña",
                    suffixIcon: IconButton(
                      onPressed: () {
                        _passwrodVisible();
                      },
                      icon: hiddenpasswordA
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    )),
              )),
          //TextField Confirmacion

          Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextField(
                obscureText: hiddenpasswordB,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _passwrodVisibleB();
                    },
                    icon: hiddenpasswordB
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  labelText: "Confirmar Contraseña",
                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ElevatedButton(
              onPressed: () async {
                try {
                  bool status = await client.register(
                      "email", "username", "passwodfsgfgrd");
                  if (status) Navigator.pop(context, true);
                } on ApiException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.message)),
                  );
                }
              },
              child: Text('Registrarse'),
            ),
          ),
        ]),
      ),
    );
  }

  void _passwrodVisible() {
    setState(() {
      hiddenpasswordA = !hiddenpasswordA;
    });
  }

  void _passwrodVisibleB() {
    setState(() {
      hiddenpasswordB = !hiddenpasswordB;
    });
  }
}
