import 'package:flutter/material.dart';
import 'package:polypus_app/src/api/api_requests.dart';
import 'package:polypus_app/src/config/routes.dart';
import 'package:polypus_app/src/ui/screens/password.dart';
import 'package:polypus_app/src/ui/screens/sign_up.dart';

class LogIN extends StatefulWidget {
  LogIN();

  @override
  _LogINState createState() => _LogINState();
}

class _LogINState extends State<LogIN> {
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
                  _singUp();
                },
                child: Text("¿Todavía no tienes cuenta?¡Registrate!")),
            TextButton(
                onPressed: () {
                  _password();
                },
                child: Text("¿Has olvidado tu contraseña?"))
          ],
        ),
      ),
    );
  }

  void _password() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PasswordReturn()));
  }

  void _singUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SingUp()));
  }

  Future<void> _signIn() async {
    var api = ApiClient();
    var result =
        await api.login(usernameController.text, passwordController.text);
    if (result) {
      Navigator.pushNamed(context, Routes.mainHolder);
    }
  }
}
