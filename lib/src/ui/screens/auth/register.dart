import 'package:flutter/material.dart';
import 'package:polypus_app/src/api/api_exception.dart';
import 'package:polypus_app/src/api/api_requests.dart';
import 'package:polypus_app/src/ui/widgets/password_text_field.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  ApiClient client = ApiClient();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(children: [
          SizedBox(height: 16),
          Image.asset(
            'assets/polypus.png',
            width: 140.0,
            height: 190.0,
          ),
          SizedBox(height: 16),
          Text(
            "¡Registrate y crea tu web!",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 16),
          //TextField Usuario
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: "Usuario",
            ),
          ),
          SizedBox(height: 16),
          //TextField Email
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          SizedBox(height: 16),
          //TextField Contraseña
          PasswordTextField(
            text: "Contraseña",
            controller: _passwordController,
          ),
          SizedBox(height: 16),
          //TextField Confirmacion
          PasswordTextField(
            text: "Confirmar Contraseña",
            controller: _confirmController,
          ),
          SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => _registerButton(context),
            child: Text('Registrarse'),
          ),
        ]),
      ),
    );
  }

  Future<void> _registerButton(BuildContext context) async {
    if (_passwordController.text != _confirmController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Las contraseñas no coinciden!")),
      );
    } else {
      try {
        bool status = await client.register(_emailController.text,
            _usernameController.text, _passwordController.text);
        if (status) Navigator.pop(context, true);
      } on ApiException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      } on Exception catch (er, stack) {
        print(er);
        print(stack);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  "Error inesperado, por favor, prueba de nuevo más tarde")),
        );
      }
    }
  }
}
