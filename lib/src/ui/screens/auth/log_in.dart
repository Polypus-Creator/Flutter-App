import 'package:flutter/material.dart';
import 'package:polypus_app/src/api/api_exception.dart';
import 'package:polypus_app/src/api/api_requests.dart';
import 'package:polypus_app/src/config/routes.dart';
import 'package:polypus_app/src/ui/widgets/password_text_field.dart';

class LogIn extends StatefulWidget {
  LogIn();

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var _passwordController = TextEditingController();
  var _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textButtonTheme = Theme.of(context)
        .textTheme
        .headline6!
        .copyWith(color: Theme.of(context).primaryColor);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            SizedBox(height: 32),
            Image.asset(
              'assets/polypus.png',
              width: 140.0,
              height: 190.0,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Usuario",
              ),
            ),
            SizedBox(height: 16),
            PasswordTextField(
              text: "Contraseña",
              controller: _passwordController,
            ),
            SizedBox(height: 48),
            ElevatedButton(
              onPressed: () => _signIn(),
              child: Text('Iniciar sesion'),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () => _registerClick(context),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "¿Todavía no tienes cuenta? ¡Registrate!",
                  style: textButtonTheme,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, Routes.recoverPassword),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "¿Has olvidado tu contraseña?",
                  style: textButtonTheme,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _registerClick(BuildContext context) {
    Navigator.pushNamed(context, Routes.register).then((value) {
      if (value != null && value == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Has sido registrado correctamente, por favor inicia sesión para continuar",
            ),
          ),
        );
      }
    });
  }

  void _signIn() async {
    var api = ApiClient();
    try {
      var result =
          await api.login(_usernameController.text, _passwordController.text);
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
