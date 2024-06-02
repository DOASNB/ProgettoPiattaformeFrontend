

import 'dart:convert';

import 'package:http/http.dart';
import 'package:progetto_piattaforme_frontend/support/Globals.dart';
import 'package:progetto_piattaforme_frontend/support/constants.dart' as constants;
import '../entities/User.dart';
import 'package:http/http.dart' as http;

import '../support/constants.dart';

class UserManager {
  User? _user;

  String? _token;
  String? _refreshToken;
  bool _loggedIn = false;
  
  static final UserManager _userManager= UserManager._internal();

  factory UserManager(){

    return _userManager;

  }

  UserManager._internal();

  bool get loggedIn => _loggedIn;
  User get user => _user!;

  set user(User value) {
    _user = value;
  }


  String get token => _token!;

  set token(String value) {
    _token = value;
  }

  String get refreshToken => _refreshToken!;

  set refreshToken(String value) {
    _refreshToken = value;
  }

  static UserManager get userManager => _userManager;


  Future<String?> login(String username, String password) async {

    String grantType = "password";
    String clientId = "progetto1";
    String clientSecret = "FUmgHEIJ52djokBSdktPOUWeGvM8qpLJ";
    Uri uri = Uri.http("localhost:8080","/realms/SpringBootKeycloak/protocol/openid-connect/token");


    Map<String, String> requestBody = {
        "grant_type": grantType,
        "client_id": clientId,
        "client_secret": clientSecret,
        "username":username,
        "password":password
      };

    Response response = await http.post(uri,body: requestBody);
    if (response.statusCode == 200) {
      print("keycloak login successful...");
      final jsonResponse = json.decode(response.body);

      _token = jsonResponse["access_token"];
      _refreshToken = jsonResponse["refresh_token"];
      Map<String,String> values={"email":username};
      _loggedIn= true;
      Response risposta = await restManager.makeGetRequest(ADDRESS_STORE_SERVER, "/users/byEmail", values);


      if(risposta.statusCode==200) {
        print(json.decode(risposta.body));

        user = User.fromJson(json.decode(risposta.body));


        print("login successfully: $user");

        return _token;
      }
      else{
        print("unable to get user: ${response.statusCode}");
        reset();
        return null;
      }
    } else {
      print("Error response code: ${response.statusCode}");
      return null;
    }


  }

  void reset(){
    _user = null;
    _token = null;
    _loggedIn = false;
    _refreshToken = null;

  }


  Future<String?> register(User user, String password, String token) async{

    Map<String, dynamic> requestBody = {
      "firstName": user.firstName,
      "lastName": user.lastName,
      "enabled": true,
      "credentials": [
        {
          "type": "password",
          "value": password,
          "temporary": false
        }
      ],
      "email": user.email,
      "groups": ["utente"]
    };

    Response response = await http.post(
      Uri.parse(constants.USER_CREATION_KEYCLOAK),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: json.encode(requestBody),
    );
    print(response.body);
    if (response.statusCode == 201) {
      print("User created successfully on keycloak");


      response = await restManager.makePostRequest(ADDRESS_STORE_SERVER, REQUEST_ADD_USER, user.toJson());
      if(response.statusCode == 200) {
        print(json.decode(response.body));


        return login(user.email!, password);
      }else{
        print("Error backend User create: ${response.statusCode}");
        return null;
      }
    } else {
      print("Error response code: ${response.statusCode}");
      return null;
    }



  }



}