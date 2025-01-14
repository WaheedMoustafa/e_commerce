import 'user.dart';
import 'dart:convert';

/// message : "success"
/// user : {"name":"waheed moustafa","email":"waheedmoustafa@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3NDRjMGNlODAzZTg4OGUwNTRhNzIxZCIsIm5hbWUiOiJ3YWhlZWQgbW91c3RhZmEiLCJyb2xlIjoidXNlciIsImlhdCI6MTczMjU1OTA4MCwiZXhwIjoxNzQwMzM1MDgwfQ.8--ENVsdfVWpvfTVhDxwPEU3NzCXlaIeCVkYo2xlWw8"

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));
String authResponseToJson(AuthResponse data) => json.encode(data.toJson());
class AuthResponse {
  AuthResponse({
      String? message, 
      User? user, 
      String? token,}){
    _message = message;
    _user = user;
    _token = token;
}

  AuthResponse.fromJson(dynamic json) {
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
  }
  String? _message;
  User? _user;
  String? _token;
AuthResponse copyWith({  String? message,
  User? user,
  String? token,
}) => AuthResponse(  message: message ?? _message,
  user: user ?? _user,
  token: token ?? _token,
);
  String? get message => _message;
  User? get user => _user;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    return map;
  }

}