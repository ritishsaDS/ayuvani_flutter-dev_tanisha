import 'dart:convert';

import 'package:flutter_ayuvani/data/api/ApiEndPoint.dart';
import 'package:http/http.dart';

import '.././../models/EditAdded_Relation.dart';

class EditAddedFamilyRepo {
  Future<bool> editAddedRelation(
      String token, EditAddedFamilyRelation editAddedFamilyRelation) async {
    print(jsonEncode(editAddedFamilyRelation.toJson()));
    try {
      final Response response = await post(
          '${ApiEndpoint.BaseUrl}${ApiEndpoint.editAddedRelation}',
          headers: {
            'content-type': 'application/json',
            "Authorization": "Bearer ${token}"
          },
          body: jsonEncode(editAddedFamilyRelation.toJson()));
      print(response.statusCode);
      print('${editAddedFamilyRelation.selectedRelationItemId}');
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception("Error relation is not updated");
      }
    } catch (e) {
      print(e);
    }
  }
}
