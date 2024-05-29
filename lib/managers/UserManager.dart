

import 'package:http/http.dart';
import 'package:progetto_piattaforme_frontend/managers/RestManager.dart';

import '../entities/User.dart';

class UserManager {
  User? _user;
  String? _token;
  String? _refreshToken;
  bool loggedIn = false;
  
  static final UserManager _userManager= UserManager._internal();

  factory UserManager(){
    return _userManager;
  }

  UserManager._internal();


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

}