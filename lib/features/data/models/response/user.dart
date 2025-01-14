import 'dart:convert';

/// name : "waheed moustafa"
/// email : "waheedmoustafa@gmail.com"
/// role : "user"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      String? name, 
      String? email, 
      String? role,}){
    _name = name;
    _email = email;
    _role = role;
}

  User.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _role = json['role'];
  }
  String? _name;
  String? _email;
  String? _role;
User copyWith({  String? name,
  String? email,
  String? role,
}) => User(  name: name ?? _name,
  email: email ?? _email,
  role: role ?? _role,
);
  String? get name => _name;
  String? get email => _email;
  String? get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['role'] = _role;
    return map;
  }

}