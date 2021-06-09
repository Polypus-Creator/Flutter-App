import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? text;

  PasswordTextField({Key? key, this.text, this.controller}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _hidden = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _hidden,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () => setState(() => _hidden = !_hidden),
          icon: _hidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ),
        labelText: widget.text,
      ),
    );
  }
}
