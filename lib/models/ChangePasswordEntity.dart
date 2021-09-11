class ChangePassworEntity {
  String errors;
  int status;
  String message;
  String url;
  String is_feedback;
  ChangePassworEntity({this.errors, this.message});

  ChangePassworEntity.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    status = json['status'];
    message = json['message'];
    is_feedback = json['is_feedback'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    data['status'] = this.status;
    data['message'] = this.message;
    data['url'] = this.url;
    return data;
  }
}
