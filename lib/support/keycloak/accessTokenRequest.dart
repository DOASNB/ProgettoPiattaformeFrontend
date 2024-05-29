import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:progetto_piattaforme_frontend/support/constants.dart' as constants;

class AccessTokenRequest {
  static Future<String?> getAccessToken() async {
    String grantType = "client_credentials";
    String clientId = "api-client";
    String clientSecret = "T6u34qhCtH13gA1cJ0xlO5wi62GVbzpc";

    Uri uri = Uri.http("localhost:8080","/realms/SpringBootKeycloak/protocol/openid-connect/token");


    Map<String, String> requestBody = {
      "grant_type": grantType,
      "client_id": clientId,
      "client_secret": clientSecret,
    };



    final response = await http.post(uri, body: requestBody);


    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return jsonResponse["access_token"];
    } else {
      print("Error response code: ${response.statusCode}");
      return null;
    }
  }
}
