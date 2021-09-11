import 'ContactDetail.dart';

class DocumentEntity {
  String errors;
  int status;
  String message;
  DocData data;
  // List<DocumentDetail> data;
  DocumentEntity({this.errors, this.status});

  DocumentEntity.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null && json['data'].length > 0) {
      data = DocData.fromJson(json['data']);
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

class DocData {
  List<DocumentDetail> document;
  List<DocumentDetail> folder;

  DocData({this.document, this.folder});

  DocData.fromJson(Map<String, dynamic> json) {
    if (json['document'] != null) {
      document = new List<DocumentDetail>();
      (json['document'] as List).forEach((v) {
        document.add(new DocumentDetail.fromJson(v));
      });
    }
    if (json['folder'] != null) {
      folder = new List<DocumentDetail>();
      (json['folder'] as List).forEach((v) {
        folder.add(new DocumentDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.document != null) {
      data['document'] = this.document.map((v) => v.toJson()).toList();
    }
    if (this.folder != null) {
      data['folder'] = this.folder.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DocumentDetail {
  String id;
  String foldername;
  String docName;
  String docType;
  String path;
  String isActive;
  bool isselected = false;

  DocumentDetail(
      {this.id, this.docType, this.docName, this.path, this.isselected});

  DocumentDetail.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    docName = json['docName'];
    foldername = json['foldername'];
    docType = json['docType'];
    path = json['path'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['docName'] = this.docName;
    data['docType'] = this.docType;
    data['isActive'] = this.isActive;
    data['foldername'] = this.foldername;
    data['path'] = this.path;
    return data;
  }
}
