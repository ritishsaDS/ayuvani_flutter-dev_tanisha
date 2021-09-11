
class InvoiceEntity {
  String errors;
  int status;
  String message;
  InvoiceData data;
  InvoiceEntity({this.errors,this.message});

  InvoiceEntity.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    status = json['status'];
    message = json['message'];

    data = json['data'] != null
        ? json['data'].length>0?new InvoiceData.fromJson(json['data'])
        : null:null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }

}
class InvoiceData {
  String pdf;

  InvoiceData({this.pdf});

  InvoiceData.fromJson(Map<String, dynamic> json) {
    pdf = json['pdf'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pdf'] = this.pdf;

    return data;
  }

}