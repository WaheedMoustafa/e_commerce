import 'dart:convert';

/// name : "waheed moustafa"
/// email : "waheedmoustafa2@gmail.com"
/// password : "waheed@123"
/// phone : "01010700701"

SignUpRequest signUpRequestFromJson(String str) => SignUpRequest.fromJson(json.decode(str));
String signUpRequestToJson(SignUpRequest data) => json.encode(data.toJson());
class SignUpRequest {
  SignUpRequest({
      String? name, 
      String? email, 
      String? password, 
      String? rePassword, 
      String? phone,}){
    _name = name;
    _email = email;
    _password = password;
    _phone = phone;
}

  SignUpRequest.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _phone = json['phone'];
  }
  String? _name;
  String? _email;
  String? _password;
  String? _phone;
SignUpRequest copyWith({  String? name,
  String? email,
  String? password,
  String? rePassword,
  String? phone,
}) => SignUpRequest(  name: name ?? _name,
  email: email ?? _email,
  password: password ?? _password,
  phone: phone ?? _phone,
);
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['phone'] = _phone;
    return map;
  }

}