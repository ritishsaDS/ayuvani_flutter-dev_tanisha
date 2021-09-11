import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/base/BaseRepository.dart';
import 'package:flutter_ayuvani/data/api/ApiEndPoint.dart';
import 'package:flutter_ayuvani/data/api/ApiHitter.dart';
import 'package:flutter_ayuvani/models/UserData.dart';

class LoginUserRepo extends BaseRepository {
  // BuildContext context;
  Future<Userdata> loginuser(
      String email, String password, BuildContext context,
      {String usertoken}) async {
    ApiResponse apiResponse = await apiHitter.getPostApiResponse(
        'user/${ApiEndpoint.login}',
        context: context,
        headers: {
          'content-type': 'application/json'
        },
        data: {
          "user_name": email,
          "password": password,
        });
    try {
      if (apiResponse.status) {
        final passEntity = Userdata.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return Userdata(message: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}
