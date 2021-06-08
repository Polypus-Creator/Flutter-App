import 'dart:convert';

import 'package:http/http.dart';

class ApiClient {
  final String _apiUrl = "http://localhost/";

  Future<bool> register(String email, String username, String password) async {
    final url = Uri.parse('$_apiUrl/register.php:80');
    Response response = await post(url, body: {
        "Username": username,
        "Password": password,
        "Email": email,
    });

    Map<String, dynamic> json = jsonDecode(response.body);

    return !json["error"];
  }
}