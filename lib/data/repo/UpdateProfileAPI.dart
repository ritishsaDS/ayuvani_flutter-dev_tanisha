import 'dart:convert';

import 'package:flutter_ayuvani/data/api/ApiEndPoint.dart';
import 'package:flutter_ayuvani/models/update_profile.dart';
import 'package:http/http.dart';

class AddFamilyRepo {
  static Future<List<UpdateProfileModel>> getAllRegisteredUsers(
      String token, UpdateProfileModel updateProfileModel) async {
    try {
      final Response response = await post(
          '${ApiEndpoint.BaseUrl}/user/${ApiEndpoint.updateprofile}',
          headers: {
            'content-type': 'application/json',
            "Authorization": "Bearer ${token}"
          },
          body: jsonEncode(updateProfileModel.toJson()));
      if (response.statusCode == 200) {
        print('member has been added');
      } else {
        throw Exception("Error member is not added");
      }
    } catch (e) {
      print(e);
    }
  }
}
