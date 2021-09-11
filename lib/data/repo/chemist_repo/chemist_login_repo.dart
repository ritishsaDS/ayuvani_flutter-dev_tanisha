import 'dart:convert';

import 'package:flutter_ayuvani/models/chemist_models/chemist_login_model.dart';
import 'package:http/http.dart';

class ChemistLoginRepo {
  ChemistLoginModel chemistLoginModel;
  Future<dynamic> loginChemist({String email, String password}) async {
    final map = {'user_name': email, 'password': password};

    print(jsonEncode(map));
    try {
      Response response = await post(
        "http://ayuvani.uplosse.com/api/chemist/login",
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode(map),
      );

      if (response.statusCode == 200) {
        // ChemistLoginModel chemistLoginModel =
        //     chemistLoginModelFromJson(response.body);
        final decode = jsonDecode(response.body);
        return decode;
      }
    } catch (error) {
      return error;
    }
  }
}
