import 'dart:convert';

import 'package:flutter_ayuvani/data/api/ApiEndPoint.dart';
import 'package:flutter_ayuvani/models/ForgotPasswordEntity.dart';
import 'package:http/http.dart';

class EmailOtpConfirmationRepo {
  Future<ForgotPasswordEntity> getEmailOtpConfirmation(
      String email, String secretCode) async {
    try {
      final Response response = await post(
          '${ApiEndpoint.BaseUrl}${ApiEndpoint.varifyOtpFromEmail}',
          body: {'email': email, 'secret_key': secretCode});
      if (response.statusCode == 200) {
        final passEntity =
            ForgotPasswordEntity.fromJson(jsonDecode(response.body));
        return passEntity;
      } else {
        throw Exception("Sending Otp Error");
      }
    } catch (e) {
      print(e);
    }
  }
}
