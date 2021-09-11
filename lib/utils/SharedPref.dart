import 'dart:convert';

import 'package:flutter_ayuvani/models/LoginCred.dart';
import 'package:flutter_ayuvani/models/UserData.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesTest {
  final String login = "login";

  Future<String> checkIsLogin(String value) async {
    String a = "Test";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value == "0") {
      prefs.setString("login", "true");
      return a;
    } else if (value == "1") {
      String tok = prefs.getString("login");
      return tok != null ? tok : "";
    } else {
      prefs.setString("login", "false");
      return a;
    }
  }

  Future<String> userdetails(String type, {Userdata loginEntity}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (type == "set") {
      prefs.setString('userdetail', json.encode(loginEntity.toJson()));
      return "Set";
    } else {
      String userentity = prefs.getString('userdetail');
      return userentity;
    }
  }

  Future<String> logincred(String type, {LoginCred logcred}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (type == "set") {
      prefs.setString('logincred', json.encode(logcred.toJson()));
      return "Set";
    } else {
      String userentity = prefs.getString('logincred');
      return userentity;
    }
  }

  Future<bool> getBool(String key, {defaultValue = false}) async {
    return await getSharedPref().then((pref) {
      return pref.getBool(key) ?? defaultValue;
    });
  }

  saveRegisteredValue(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('registeredValue', value);
  }

  Future<bool> getRegisteredValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('registeredValue') ?? false;
  }

  saveToggleValue(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('toggleValue', value);
  }

  Future<bool> getTogglevalue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('toggleValue') ?? false;
  }

  Future<String> saveuserdata(
    String type,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (type == "set") {
      prefs.setString('userdata', "" /*json.encode(userdata.toJson())*/);
      return "Set";
    } else {
      String userentity = prefs.getString('userdata');
      return userentity;
    }
  }

  Future<String> appversion(String value, String appversion) async {
    String a = "Test";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value == "0") {
      prefs.setString("AppVersion", appversion);
      return a;
    } else if (value == "1") {
      String tok = prefs.getString("AppVersion");
      if (tok == null || tok == "")
        return tok = "1";
      else
        return tok;
    } else {
      prefs.setString("AppVersion", "0");
      return a;
    }
  }
}
