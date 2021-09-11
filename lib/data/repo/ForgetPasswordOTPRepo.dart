import 'dart:convert';

import 'package:flutter_ayuvani/base/BaseRepository.dart';
import 'package:flutter_ayuvani/data/api/ApiEndPoint.dart';
import 'package:flutter_ayuvani/models/ForgotPasswordEntity.dart';
import 'package:http/http.dart';

class ForgotPasswordOtpRepo extends BaseRepository {
  Future<ForgotPasswordEntity> getforgotPassword(String email) async {
    print(email);
    try {
      final Response response = await post(
          '${ApiEndpoint.BaseUrl}${ApiEndpoint.forgetPassEmail}',
          body: {'email': email});
      print(response.statusCode);
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
