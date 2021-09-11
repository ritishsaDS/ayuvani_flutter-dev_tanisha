class UpdateProfile {
  String message;
  int code;

  UpdateProfile({this.message,this.code});

  UpdateProfile.fromJson(Map<String, dynamic> json) {
    message = json['message'];

    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

