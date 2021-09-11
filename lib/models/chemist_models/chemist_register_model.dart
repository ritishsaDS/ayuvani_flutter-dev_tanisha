// To parse this JSON data, do
//
//     final chemistRegisterModel = chemistRegisterModelFromJson(jsonString);

import 'dart:convert';

ChemistRegisterModel chemistRegisterModelFromJson(String str) =>
    ChemistRegisterModel.fromJson(json.decode(str));

String chemistRegisterModelToJson(ChemistRegisterModel data) =>
    json.encode(data.toJson());

class ChemistRegisterModel {
  ChemistRegisterModel({
    this.message,
    this.data,
    this.code,
  });

  final String message;
  final Data data;
  final int code;

  ChemistRegisterModel copyWith({
    String message,
    Data data,
    int code,
  }) =>
      ChemistRegisterModel(
        message: message ?? this.message,
        data: data ?? this.data,
        code: code ?? this.code,
      );

  factory ChemistRegisterModel.fromJson(Map<String, dynamic> json) =>
      ChemistRegisterModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
        "code": code,
      };
}

class Data {
  Data({
    this.name,
    this.userName,
    this.phone,
    this.email,
    this.gender,
    this.dob,
    this.height,
    this.weight,
    this.disability,
    this.loginType,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  final String name;
  final String userName;
  final String phone;
  final String email;
  final String gender;
  final DateTime dob;
  final String height;
  final String weight;
  final String disability;
  final String loginType;
  final String status;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  Data copyWith({
    String name,
    String userName,
    String phone,
    String email,
    String gender,
    DateTime dob,
    String height,
    String weight,
    String disability,
    String loginType,
    String status,
    DateTime updatedAt,
    DateTime createdAt,
    int id,
  }) =>
      Data(
        name: name ?? this.name,
        userName: userName ?? this.userName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        dob: dob ?? this.dob,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        disability: disability ?? this.disability,
        loginType: loginType ?? this.loginType,
        status: status ?? this.status,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        userName: json["user_name"],
        phone: json["phone"],
        email: json["email"],
        gender: json["gender"],
        dob: DateTime.parse(json["dob"]),
        height: json["height"],
        weight: json["weight"],
        disability: json["disability"],
        loginType: json["login_type"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "user_name": userName,
        "phone": phone,
        "email": email,
        "gender": gender,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "height": height,
        "weight": weight,
        "disability": disability,
        "login_type": loginType,
        "status": status,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
