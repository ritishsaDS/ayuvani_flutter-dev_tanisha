
class SubscriptionStatus {
  String errors;
  int status;
  String message;
  String data;
  SubscriptionStatus({this.errors,this.message});

  SubscriptionStatus.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }

}
