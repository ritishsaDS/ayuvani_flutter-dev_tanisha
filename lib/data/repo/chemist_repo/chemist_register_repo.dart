import 'dart:convert';

import 'package:flutter_ayuvani/models/chemist_models/chemist_register_model.dart';
import 'package:http/http.dart';

class ChemistResgisterRepo {
  Future<ChemistRegisterModel> registeruser({
    String name,
    userName,
    phone,
    email,
    gender,
    dob,
    height,
    weight,
    loginType,
    address,
    password,
    List<int> disability,
  }) async {
    final map = {
      "name": name,
      "user_name": userName,
      "phone": phone,
      "email": email,
      "gender": gender,
      "dob": dob,
      "password": password,
      "height": height,
      "weight": weight,
      "disability": disability.toString(),
      "login_type": loginType,
      "address": address,
    };

    print(jsonEncode(map));

    try {
      Response response = await post(
        "http://ayuvani.uplosse.com/api/chemist/register",
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode(map),
      );
      if (response.statusCode == 200) {
        final data = chemistRegisterModelFromJson(response.body);
        print('data ${data.message}');
        return data;
      } else {
        throw Exception("Error accessing the API \nStatus Code: " +
            response.statusCode.toString());
      }
    } catch (error) {
      print(error);
    }
  }
}
