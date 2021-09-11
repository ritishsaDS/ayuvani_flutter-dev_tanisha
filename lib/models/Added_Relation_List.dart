import 'dart:convert';

AddedRelationList addedRelationListFromJson(String str) =>
    AddedRelationList.fromJson(json.decode(str));

String addedRelationListToJson(AddedRelationList data) =>
    json.encode(data.toJson());

class AddedRelationList {
  AddedRelationList({
    this.message,
    this.code,
    this.data,
  });

  String message;
  int code;
  List<UserData> data;

  factory AddedRelationList.fromJson(Map<String, dynamic> json) =>
      AddedRelationList(
        message: json["message"],
        code: json["code"],
        data:
            List<UserData>.from(json["data"].map((x) => UserData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class UserData {
  UserData({
    this.id,
    this.userId,
    this.relationId,
    this.dob,
    this.age,
    this.address,
    this.phoneNo,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  int id;
  int userId;
  int relationId;
  String name;
  String dob;
  dynamic age;
  String address;
  int phoneNo;
  String email;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        relationId: json["relation_id"],
        dob: json["dob"] == null ? null : json["dob"],
        age: json["age"],
        address: json["address"],
        phoneNo: json["phone_no"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "relation_id": relationId,
        "dob": dob == null ? null : dob,
        "age": age,
        "name": name,
        "address": address,
        "phone_no": phoneNo,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
