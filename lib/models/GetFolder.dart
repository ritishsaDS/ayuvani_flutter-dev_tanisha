import 'ContactDetail.dart';

class FolderEntity {
  String errors;
  int status;
  String message;
  String app_version;
  List<FolderDetail> data;
  FolderEntity({this.errors, this.status});

  FolderEntity.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    status = json['status'];
    message = json['message'];
    app_version = json['app_version'].toString();
    if (json['data'] != null)
    {
      data = new List<FolderDetail>();
      (json['data'] as List).forEach((v)
      {
        data.add(new FolderDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FolderDetail {
  String id;
  String foldername;
  String updated_at;
  String created_at;
  String isActive;
  bool isselected = false;
  List<NestedFolder> get_child;

  FolderDetail(
      {this.created_at,
      this.updated_at,
      this.id,
      this.foldername,this.isActive,
      this.isselected = false,this.get_child});

  FolderDetail.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    foldername = json['foldername'];
    updated_at = json['updated_at'];
    isActive = json['isActive'];
    isselected = json['isselected'];
    created_at = json['created_at'];
    if (json['get_child'] != null)
    {
      get_child = new List<NestedFolder>();
      (json['get_child'] as List).forEach((v)
      {
        get_child.add(new NestedFolder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['foldername'] = this.foldername;
    data['updated_at'] = this.updated_at;
    data['isActive'] = this.isActive;
    data['created_at'] = this.created_at;
    data['isselected'] = this.isselected;
    if (this.get_child != null) {
      data['get_child'] = this.get_child.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class NestedFolder{

  String id;
  String foldername;
  String parent_id;
  bool isselected = false;

  NestedFolder(
      {
        this.parent_id,
        this.id,
        this.foldername,this.isselected = false
        });

  NestedFolder.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    foldername = json['foldername'];
    parent_id = json['parent_id'];
    isselected = json['isselected'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['foldername'] = this.foldername;
    data['parent_id'] = this.parent_id;
    data['isselected'] = this.isselected;
    return data;
  }
}