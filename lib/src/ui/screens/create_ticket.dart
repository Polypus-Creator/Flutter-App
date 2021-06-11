import 'package:flutter/material.dart';
import 'package:polypus_app/src/api/api_exception.dart';
import 'package:polypus_app/src/api/api_requests.dart';

class CreateTicket extends StatefulWidget {
  @override
  _CreateTicketState createState() => _CreateTicketState();
}

class _CreateTicketState extends State<CreateTicket> {
  bool _urgent = false;
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  ApiClient _api = ApiClient();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: Text(
                  "¿Tienes alguna duda o sugeriencia? ¡Háznoslo saber!",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Icon(
                Icons.feedback_sharp,
                color: Theme.of(context).accentColor,
                size: 50,
              ),
            ],
          ),
          SizedBox(height: 32),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: "Descripción",
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _messageController,
            maxLines: 8,
            maxLength: 500,
            decoration: InputDecoration(
              labelText: "Mensaje",
            ),
          ),
          CheckboxListTile(
            value: _urgent,
            title: Text("Es una incidencia urgente?"),
            contentPadding: EdgeInsets.zero,
            onChanged: (value) => setState(() => _urgent = value ?? false),
          ),
          SizedBox(height: 16),
          //BUTTON
          ElevatedButton(
            onPressed: () => sendTicket(),
            child: Text('Enviar'),
          ),
        ],
      ),
    );
  }

  void sendTicket() async {
    try {
      await _api.sendTicket(
        _descriptionController.text,
        _messageController.text,
        _urgent,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Incidencia enviada!"),
      ));
      setState(() {
      _descriptionController.text = "";
      _messageController.text = "";
      _urgent = false;
    });
    } on ApiException {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "No se ha podido enviar la incidencia, por favor, inténtalo más tarde."),
      ));
    }
  }
}
