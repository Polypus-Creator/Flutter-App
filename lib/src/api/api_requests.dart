import 'dart:convert';

import 'package:polypus_app/src/api/api_exception.dart';
import 'package:polypus_app/src/config/globals.dart';
import 'package:polypus_app/src/models/user.dart';
import 'package:polypus_app/src/models/website_design.dart';
import 'package:rest_client/rest_client.dart' as rc;
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  final String _apiUrl = "http://polypus-api.eudald.me";
  final client = rc.Client();

  Future<bool> register(String email, String username, String password) async {
    var request = rc.Request(
      url: '$_apiUrl/register.php',
      method: rc.RequestMethod.post,
      body: jsonEncode({
        "Username": username,
        "Password": password,
        "Email": email,
      }),
    );

    var response = await client.execute(request: request);

    var error = response.body["error"];
    if (error != false) {
      throw ApiException(error);
    }
    return true;
  }

  Future<bool> login(String username, String password) async {
    var request = rc.Request(
      url: '$_apiUrl/login.php',
      method: rc.RequestMethod.post,
      body: jsonEncode({
        "Username": username,
        "Password": password,
      }),
    );

    var response = await client.execute(request: request);
    var error = response.body["error"];
    if (error != false) {
      throw ApiException(error);
    }

    Globals.user = User.fromMap(response.body["body"]);
    Globals.token = response.body["body"]["token"];

    //save user to shared prefs
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(Globals.tokenKey, Globals.token!);
      prefs.setString(Globals.userKey, jsonEncode(Globals.user!.toMap()));
    });
    return true;
  }

  Future<void> logout() async {
    var request = rc.Request(
      url: '$_apiUrl/logout.php',
      method: rc.RequestMethod.get,
    );

    await client.execute(
      request: request,
      authorizer: rc.TokenAuthorizer(token: Globals.token ?? ""),
    );

    Globals.user = null;
    Globals.token = null;

    //Unset shared prefs
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove(Globals.tokenKey);
      prefs.remove(Globals.userKey);
    });
  }

  Future<bool> sendTicket(
      String description, String message, bool urgent) async {
    var request = rc.Request(
      url: '$_apiUrl/add_ticket.php',
      method: rc.RequestMethod.post,
      body: jsonEncode({
        "title": description,
        "description": message,
        "urgent": urgent,
      }),
    );

    var response = await client.execute(
      request: request,
      authorizer: rc.TokenAuthorizer(token: Globals.token ?? ""),
    );
    var error = response.body["error"];
    if (error != false) {
      throw ApiException(error);
    }

    return true;
  }

  Future<WebsiteDesign> getDesign() async {
    var request = rc.Request(
      url: '$_apiUrl/get_design.php',
      method: rc.RequestMethod.get,
    );

    var response = await client.execute(
      request: request,
      authorizer: rc.TokenAuthorizer(token: Globals.token ?? ""),
    );
    var error = response.body["error"];
    if (error != false) {
      throw ApiException("Unexpected error");
    }

    return WebsiteDesign.fromMap(response.body["body"]);
  }

  Future<bool> updateDesign(WebsiteDesign design) async {
    var request = rc.Request(
      url: '$_apiUrl/update_design.php',
      method: rc.RequestMethod.post,
      body: jsonEncode(design.toMap()),
    );

    var response = await client.execute(
      request: request,
      authorizer: rc.TokenAuthorizer(token: Globals.token ?? ""),
    );
    var error = response.body["error"];
    if (error != false) {
      throw ApiException(error);
    }

    return true;
  }
}
