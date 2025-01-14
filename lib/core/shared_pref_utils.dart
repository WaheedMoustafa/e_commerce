import 'dart:convert';

import 'package:e_commerce/features/data/models/response/user.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPrefUtils{
  Future saveUser(User appUser) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('current_user', jsonEncode(appUser.toJson()));
  }

  Future getUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user= prefs.getString('current_user');
    if(user == null) return null;
    return User.fromJson(jsonDecode(user));

  }

  Future saveToken(String token) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);

  }

  Future getToken() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');

  }



}