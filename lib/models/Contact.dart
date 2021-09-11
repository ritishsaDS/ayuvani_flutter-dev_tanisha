import 'ContactDetail.dart';

class ContactEntity {
  String errors;
  int status;
  List<ContactDetail> data;
  ContactEntity({this.errors, this.status});

  ContactEntity.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    status = json['status'];
    if (json['data'] != null) {
      data = new List<ContactDetail>();
      (json['data'] as List).forEach((v) {
        data.add(new ContactDetail.fromJson(v));
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
