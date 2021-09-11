class AboutUsDataModel {
  String errors;
  int status;
  String message;
  AboutusData data;
  AboutUsDataModel({this.errors, this.data, this.status, this.message});

  AboutUsDataModel.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new AboutusData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    data['status'] = this.status;
    data['message'] = this.message;

    if (this.data != null) {
      data['schoolData'] = this.data.toJson();
    }
    return data;
  }
}

class AboutusData {
  String id;
  String content;

  AboutusData({this.id, this.content});

  AboutusData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['_id'] = this.id;
    data['content'] = this.content;
    return data;
  }
}
