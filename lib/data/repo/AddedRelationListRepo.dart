import 'package:flutter_ayuvani/data/api/ApiEndPoint.dart';
import 'package:flutter_ayuvani/models/Added_Relation_List.dart';
import 'package:http/http.dart';

class AddedRelationListRepo {
  Future<AddedRelationList> getAddRelationList({String token}) async {
    try {
      final Response response = await post(
        '${ApiEndpoint.BaseUrl}${ApiEndpoint.addedRelationList}',
        headers: {
          'content-type': 'application/json',
          'Authorization': 'Bearer ${token}',
        },
      );

      if (response.statusCode == 200) {
        AddedRelationList data = addedRelationListFromJson(response.body);
        return data;
      } else {
        throw Exception(
            "Error accessing the AddedRealtionList API \nStatus Code: " +
                response.statusCode.toString());
      }
    } catch (error) {
      print(error);
    }
  }
}
