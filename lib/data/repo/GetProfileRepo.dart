import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/base/BaseRepository.dart';
import 'package:flutter_ayuvani/data/api/ApiEndPoint.dart';
import 'package:flutter_ayuvani/data/api/ApiHitter.dart';
import 'package:flutter_ayuvani/models/GetProfileModel.dart';

class GetProfileRepo extends BaseRepository {
  // BuildContext context;
  Future<GetProfileModel> getprofile(BuildContext context, String token) async {
    ApiResponse apiResponse = await apiHitter.getPostApiResponse(
      'user/${ApiEndpoint.getprofile}',
      context: context,
      headers: {
        'content-type': 'application/json',
        "Authorization": "Bearer ${token}"
      },
    );
    try {
      if (apiResponse.status) {
        final passEntity = GetProfileModel.fromJson(apiResponse.response.data);
        return passEntity;
      } else {
        return GetProfileModel(message: apiResponse.msg);
      }
    } catch (error, stacktrace) {}
  }
}
