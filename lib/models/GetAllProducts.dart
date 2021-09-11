import 'package:flutter/cupertino.dart';

class GetProductModel {
  String errors;
  int status;
  List<GetProductlDetail> data;
  GetProductModel({this.errors, this.data, this.status,});

  GetProductModel.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    status = json['status'];
    if (json['data'] != null) {
      data = new List<GetProductlDetail>();
      (json['data'] as List).forEach((v) {
        data.add(new GetProductlDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class GetProductlDetail {
  String id;
  String user_id;
  String name;
  String price;
  String updated_at;
  String created_at;
  int count =0;
  TextEditingController description = new TextEditingController();
  GetProductlDetail({this.id, this.user_id,this.name,this.price,this.created_at,this.updated_at,this.count,this.description});

  GetProductlDetail.fromJson(Map<String, dynamic> json)
  {
    id = json['_id'];
    user_id = json['user_id'];
    name = json['name'];
    price = json['price'].toString();
    updated_at = json['updated_at'];
    created_at = json['created_at'];
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['_id'] = this.id;
    data['user_id'] = this.user_id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['updated_at'] = this.updated_at;
    data['created_at'] = this.created_at;

    return data;
  }
}

