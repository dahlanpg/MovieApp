// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:movieapp/services/prefs_service.dart';

class LoginController {
  String? _user;
  String? _password;
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  setLogin(String value) {
    _user = value;
  }

  setPassword(String value) {
    _password = value;
  }

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 1));
    inLoader.value = false;

    if (_user == 'seed' && _password == 'dees') {
      PrefsService.save();
      return true;
    }
    return false;
  }
}
