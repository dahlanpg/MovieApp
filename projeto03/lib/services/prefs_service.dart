import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static final String _key = '_key';

  static save() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode({'isAuth': true}));
  }

  static Future<bool> isAuth() async {
    var prefs = await SharedPreferences.getInstance();
    var jsonResult = prefs.getString(_key);
    if (jsonResult != null) {
      Map mapUser = jsonDecode(jsonResult);
      return mapUser['isAuth'];
    }
    return false;
  }

  static logout() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(_key);
  }
}
