import 'dart:convert';

import 'package:flutter_ayuvani/models/chemist_models/chemist_login_model.dart';
import 'package:http/http.dart';

class UserLoginApi {
  ChemistLoginModel chemistLoginModel;
  Future<dynamic> userlogin({String email, String password}) async {
    final map = {'user_name': email, 'password': password};

    print(jsonEncode(map));
    try {
      Response response = await post(
        "http://ayuvani.uplosse.com/api/user/login",
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode(map),
      );

      if (response.statusCode == 200) {
        final decode = jsonDecode(response.body);
        return decode;
      }
    } catch (error) {
      return error;
    }
  }
}
