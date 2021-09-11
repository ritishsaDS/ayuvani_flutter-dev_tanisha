import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/base/BaseRepository.dart';
import 'package:flutter_ayuvani/data/api/ApiEndPoint.dart';
import 'package:flutter_ayuvani/data/api/ApiHitter.dart';
import 'package:flutter_ayuvani/models/RegisterData.dart';

class RegisterUserRepo extends BaseRepository {
  // BuildContext context;
  Future<RegisterData> registeruser(
    BuildContext context,
    String name,
    String user_name,
    String phone,
    String email,
    String gender,
    String dob,
    String height,
    String weight,
    List<String> disability,
    String login_type,
    String password,
  ) async {
    ApiResponse apiResponse = await apiHitter.getPostApiResponse(
        'user/${ApiEndpoint.register}',
        context: context,
        headers: {
          'content-type': 'application/json'
        },
        data: {
          "name": name,
          "user_name": user_name,
          "phone": phone,
          "email": email,
          "gender": gender,
          "dob": dob,
          "height": height,
          "weight": weight,
          "disability": disability.toString(),
          "login_type": login_type,
          "password": password,
        });

    var value = {
      "name": name,
      "user_name": user_name,
      "phone": phone,
      "email": email,
      "gender": gender,
      "dob": dob,
      "height": height,
      "weight": weight,
      "disability": disability.toString(),
      "login_type": login_type,
      "password": password,
    };

    print(value);

    try {
      if (apiResponse.status) {
        final passEntity = RegisterData.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return RegisterData(message: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}
