class AddProductModel {
  String errors;
  int status;
  String message;
  AddProductDetail data;
  AddProductModel({
    this.errors,
    this.data,
    this.status,
  });

  AddProductModel.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null && json['data'].length > 0) {
      data = AddProductDetail.fromJson(json['data']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}

class AddProductDetail {
  String id;
  String user_id;
  String name;
  String price;
  String updated_at;
  String created_at;

  AddProductDetail({this.id, this.user_id});

  AddProductDetail.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    user_id = json['user_id'];
    name = json['name'];
    price = json['price'];
    updated_at = json['updated_at'];
    created_at = json['created_at'];
  }

  Map<String, dynamic> toJson() {
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
