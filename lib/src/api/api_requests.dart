import 'package:rest_client/rest_client.dart' as rc;

class ApiClient {
  final String _apiUrl = "10.0.2.2";
  final client = rc.Client();

  Future<bool> register(String email, String username, String password) async {
    var request =
        rc.Request(url: '$_apiUrl/register.php', method: rc.RequestMethod.post);

    var response = await client.execute(
      authorizer: rc.TokenAuthorizer(token: 'my_token_goes_here'),
      request: request,
    );

    return response.body["error"] == false;
  }
}
