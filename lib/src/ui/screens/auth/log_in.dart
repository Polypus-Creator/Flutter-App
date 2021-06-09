import 'package:flutter/material.dart';
import 'package:polypus_app/src/api/api_exception.dart';
import 'package:polypus_app/src/api/api_requests.dart';
import 'package:polypus_app/src/config/routes.dart';

class LogIn extends StatefulWidget {
  LogIn();

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool hiddenpassword = true;

  var passwordController = TextEditingController();
  var usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset(
                'assets/polypus.png',
                width: 140.0,
                height: 190.0,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextField(
                controller: usernameController,
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
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextField(
                controller: passwordController,
                obscureText: hiddenpassword,
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
                          // _passwrodVisible();
                        },
                        icon: hiddenpassword
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  _signIn();
                },
                child: Text('Iniciar sesion'),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.register).then((value) {
                    if (value != null && value == true) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Has sido registrado correctamente, " +
                              "por favor inicia sesión para continuar")));
                    }
                  });
                },
                child: Text("¿Todavía no tienes cuenta? ¡Registrate!")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.recoverPassword);
                },
                child: Text("¿Has olvidado tu contraseña?"))
          ],
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    var api = ApiClient();
    try {
      var result =
          await api.login(usernameController.text, passwordController.text);
      if (result) {
        Navigator.pushReplacementNamed(context, Routes.mainHolder);
      }
    } on ApiException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    }
  }
}
