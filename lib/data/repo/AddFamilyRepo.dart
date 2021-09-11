import 'dart:convert';

import 'package:flutter_ayuvani/data/api/ApiEndPoint.dart';
import 'package:http/http.dart';

import '.././../models/AddFamilyRelation.dart';

class AddFamilyRepo {
  Future<bool> addFamilyRelatioins(
      String token, AddFamilyRelation addFamilyRelation) async {
    print(jsonEncode(addFamilyRelation.toJson()));
    try {
      final Response response = await post(
          '${ApiEndpoint.BaseUrl}${ApiEndpoint.userRelationAdd}',
          headers: {
            'content-type': 'application/json',
            "Authorization": "Bearer ${token}"
          },
          body: jsonEncode(addFamilyRelation.toJson()));
      print(response.statusCode);
      print('${addFamilyRelation.relationId}');
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception("Error member is not added");
      }
    } catch (e) {
      print(e);
    }
  }
}
