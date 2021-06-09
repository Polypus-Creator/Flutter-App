import 'dart:convert';

import 'package:polypus_app/src/config/globals.dart';
import 'package:polypus_app/src/models/user.dart';
import 'package:rest_client/rest_client.dart' as rc;
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  final String _apiUrl = "10.0.2.2";
  final client = rc.Client();

  Future<bool> register(String email, String username, String password) async {
    var request = rc.Request(
      url: '$_apiUrl/register.php',
      method: rc.RequestMethod.post,
    );

    var response = await client.execute(request: request);

    return response.body["error"] == false;
  }

  Future<bool> login(String username, String password) async {
    var request = rc.Request(
      url: '$_apiUrl/login.php',
      method: rc.RequestMethod.post,
    );

    var response = await client.execute(request: request);

    if (response.body["error"] == false) {
      Globals.user = User.fromMap(response.body["body"]);
      Globals.token = response.body["body"]["token"];

      //save user to shared prefs
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString(Globals.tokenKey, Globals.token!);
        prefs.setString(Globals.userKey, jsonEncode(Globals.user!.toMap()));
      });
      return true;
    }
    return false;
  }
}
