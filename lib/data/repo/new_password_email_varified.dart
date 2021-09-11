import 'dart:convert';

import 'package:flutter_ayuvani/data/api/ApiEndPoint.dart';
import 'package:flutter_ayuvani/models/ForgotPasswordEntity.dart';
import 'package:http/http.dart';

class NewPassWordEmailRepo {
  Future<ForgotPasswordEntity> getEmailOtpConfirmation(
      {String email, String password, String confirmPassword}) async {
    try {
      final Response response = await post(
          '${ApiEndpoint.BaseUrl}${ApiEndpoint.newAndconfirPassword}',
          body: {
            'email': email,
            'password': password,
            'confirm_password': confirmPassword
          });
      if (response.statusCode == 200) {
        final passEntity =
            ForgotPasswordEntity.fromJson(jsonDecode(response.body));
        return passEntity;
      } else {
        throw Exception("Error:");
      }
    } catch (e) {
      print(e);
    }
  }
}
