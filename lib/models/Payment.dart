class PaymentEntity
{
  String errors;
  int status;
  String message;
  PaymentDetail data;
  PaymentEntity({this.errors, this.message});

  PaymentEntity.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null && json['data'].length > 0) {
      data = PaymentDetail.fromJson(json['data']);
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
class PaymentDetail
{

  String id;
  PaymentDetail({this.id,});

  PaymentDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}