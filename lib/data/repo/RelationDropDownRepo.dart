import 'dart:convert';

import 'package:flutter_ayuvani/data/api/ApiEndPoint.dart';
import 'package:http/http.dart';

class RelationDropDownRepo {
  Future<List<dynamic>> getAllUsers() async {
    try {
      final Response response = await post(
        '${ApiEndpoint.BaseUrl}${ApiEndpoint.relationDropDownList}',
        headers: {
          'content-type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        print(response.statusCode);
        var decodedResponse = jsonDecode(response.body)['data'];
        return decodedResponse;
      } else {
        throw Exception("Error accessing the User API \nStatus Code: " +
            response.statusCode.toString());
      }
    } catch (e) {
      print(e);
    }
  }
}
