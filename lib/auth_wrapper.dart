import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future setToken(String userName, String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userName);
    await prefs.setString('userId', userId);
  }

  Future<String?> getUserName(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      String? _userName = await prefs.getString('userName');
      if (_userName == null) return null;
      return _userName;
    } catch (e) {
      print(e.toString());
      // await this.signOut(context);
      return null;
    }
  }

  Future<String?> getUserId(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      String? _userId = await prefs.getString('userId');
      if (_userId == null) return null;
      return _userId;
    } catch (e) {
      print(e.toString());
      // await this.signOut(context);
      return null;
    }
  }

  // Future clearUserData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.clear();
  // }

  Future signOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    //TODO: Naviate to login screen
  }
}
