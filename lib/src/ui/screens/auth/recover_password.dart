import 'package:flutter/material.dart';
import 'package:polypus_app/src/ui/widgets/password_text_field.dart';

class RecoverPassword extends StatefulWidget {
  @override
  _RecoverPasswordState createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recuperar contraseña"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Image.asset(
              'assets/polypus.png',
              width: 140.0,
              height: 190.0,
            ),
            Text(
              "¡Recupera tu Contraseña!",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "Usuario",
              ),
            ),
            SizedBox(height: 16),
            //TextField Email
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            SizedBox(height: 16),
            //TextField Usuario
            TextField(
              decoration: InputDecoration(
                labelText: "Respuesta de la pregunta de seguridad",
              ),
            ),
            SizedBox(height: 16),
            //TextField Contraseña
            PasswordTextField(
              text: "Nueva contraseña",
            ),
            SizedBox(height: 16),
            //TextField Confirmacion
            PasswordTextField(
              text: "Confirmar Contraseña",
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Recuperar contraseña'),
            ),
          ],
        ),
      ),
    );
  }
}
