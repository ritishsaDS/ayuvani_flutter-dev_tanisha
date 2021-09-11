import 'dart:convert';

import 'package:meta/meta.dart';

DropDownMenuModel dropDownMenuModelFromJson(String str) =>
    DropDownMenuModel.fromJson(json.decode(str));

String dropDownMenuModelToJson(DropDownMenuModel data) =>
    json.encode(data.toJson());

class DropDownMenuModel {
  DropDownMenuModel({
    @required this.message,
    @required this.code,
    @required this.data,
  });

  final String message;
  final int code;
  final List<DropDownData> data;

  factory DropDownMenuModel.fromJson(Map<String, dynamic> json) =>
      DropDownMenuModel(
        message: json["message"] == null ? null : json["message"],
        code: json["code"] == null ? null : json["code"],
        data: json["data"] == null
            ? null
            : List<DropDownData>.from(
                json["data"].map((x) => DropDownData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "code": code == null ? null : code,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DropDownData {
  DropDownData({
    @required this.id,
    @required this.name,
  });

  final int id;
  final String name;

  factory DropDownData.fromJson(Map<String, dynamic> json) => DropDownData(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
