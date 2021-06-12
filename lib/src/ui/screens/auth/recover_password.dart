import 'package:flutter/material.dart';

class RecoverPassword extends StatefulWidget {
  @override
  _RecoverPasswordState createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  bool hiddenpasswordA = true;

  bool hiddenpasswordB = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recuperar contraseña"),
      ),
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
              "¡Recupera tu Contraseña!",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
          ),

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
                  labelText: "Escribe la respuesta a la pregunta de seguridad",
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
                        _passwrodVisibleA();
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
              onPressed: () {},
              child: Text('Recuperar Contraseña'),
            ),
          ),
        ]),
      ),
    );
  }

  void _passwrodVisibleA() {
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
