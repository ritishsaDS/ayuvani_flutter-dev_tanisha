import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/base/BaseRepository.dart';
import 'package:flutter_ayuvani/data/api/ApiEndPoint.dart';
import 'package:flutter_ayuvani/data/api/ApiHitter.dart';
import 'package:flutter_ayuvani/models/UpdateProfile.dart';

class UpdateProfileRepo extends BaseRepository {
  // BuildContext context;
  Future<UpdateProfile> updateprofile(
      {BuildContext context,
      String token,
      String name,
      String user_name,
      String phone,
      String email,
      String gender,
      String dob,
      String height,
      String weight,
      String image}) async {
    FormData formData = new FormData.fromMap({
      "name": name,
      "user_name": user_name,
      "phone": phone,
      "email": email,
      "gender": gender,
      "dob": dob,
      "height": height,
      "weight": weight,
    });

    print(json.encode({
      "name": name,
      "user_name": user_name,
      "phone": phone,
      "email": email,
      "gender": gender,
      "dob": dob,
      'profile_pic': image,
      "height": height,
      "weight": weight,
    }));

    if (image != null && image != "") {
      var mcDocsFileName = image.split('/').last;
      if (!image.contains(".")) {
        mcDocsFileName = image + ".jpg";
      }

      formData.files.add(MapEntry("profile_pic",
          await MultipartFile.fromFile(image, filename: mcDocsFileName)));
    }

    ApiResponse apiResponse = await apiHitter.getPostApiResponse(
        'user/${ApiEndpoint.updateprofile}',
        context: context,
        headers: {"Authorization": "Bearer ${token}"},
        isformdata: true,
        formdata: formData);
    try {
      if (apiResponse.status) {
        final passEntity = UpdateProfile.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return UpdateProfile(message: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}
