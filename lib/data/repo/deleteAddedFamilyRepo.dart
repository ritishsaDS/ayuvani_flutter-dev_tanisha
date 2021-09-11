import 'package:flutter_ayuvani/data/api/ApiEndPoint.dart';
import 'package:http/http.dart';

class DeleteAddedRelationRepo {
  Future<bool> deleteAddedRelation(String token, int id) async {
    print('item id $id');
    try {
      final Response response = await post(
          '${ApiEndpoint.BaseUrl}${ApiEndpoint.deleteAddedRelation}',
          headers: {
            // 'content-type': 'application/json',
            "Authorization": "Bearer ${token}"
          },
          body: {
            "user_realtion_id": id.toString(),
          });
      print(response.statusCode);
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
