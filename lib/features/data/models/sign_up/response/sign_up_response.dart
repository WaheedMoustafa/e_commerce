import 'user.dart';
import 'dart:convert';

/// message : "success"
/// user : {"name":"waheed moustafa","email":"waheedmoustafa2@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3NWIxNmI1OTAzYWU2OGQ0ZGRlZmU3NSIsIm5hbWUiOiJ3YWhlZWQgbW91c3RhZmEiLCJyb2xlIjoidXNlciIsImlhdCI6MTczNDAyMjgzOCwiZXhwIjoxNzQxNzk4ODM4fQ.pS9Dvnz08Huw_C3fnDxvg50k_89LW5mxL_g9X2PB3OM"

SignUpResponse signUpResponseFromJson(String str) => SignUpResponse.fromJson(json.decode(str));
String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());
class SignUpResponse {
  SignUpResponse({
      String? message, 
      User? user, 
      String? token,}){
    _message = message;
    _user = user;
    _token = token;
}

  SignUpResponse.fromJson(dynamic json) {
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
  }
  String? _message;
  User? _user;
  String? _token;
SignUpResponse copyWith({  String? message,
  User? user,
  String? token,
}) => SignUpResponse(  message: message ?? _message,
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