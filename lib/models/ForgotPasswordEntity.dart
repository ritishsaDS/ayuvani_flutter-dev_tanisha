class ForgotPasswordEntity {
  String email;
  int status;
  String message;
  ForgotPasswordEntity({this.email, this.message});

  ForgotPasswordEntity.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    status = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['code'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
