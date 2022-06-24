import 'package:flutter/cupertino.dart';
import 'package:projeto01/services/prefs_service.dart';

class LoginController {
  String? _user;

  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  setLogin(String value) {
    _user = value;
  }

  String? _password;

  setPassword(String value) {
    _password = value;
  }

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 1));
    inLoader.value = false;
    if (_user == 'admin' && _password == '123') {
      PrefsService.save(_user!);
      return true;
    }
    return false;
  }
}
