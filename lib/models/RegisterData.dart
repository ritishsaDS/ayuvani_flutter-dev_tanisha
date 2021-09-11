class RegisterData {
  String message;
  RegisterDetail data;
  int code;
  String status;

  RegisterData({this.message, this.data, this.code, this.status});

  RegisterData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data =
        json['data'] != null ? new RegisterDetail.fromJson(json['data']) : null;
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

class RegisterDetail {
  String name;
  String userName;
  String phone;
  String email;
  String gender;
  String dob;
  String height;
  String weight;
  String disability;
  String loginType;
  String password;
  // String updatedAt;
  // String createdAt;
  // int id;

  RegisterDetail({
    this.name,
    this.userName,
    this.phone,
    this.email,
    this.gender,
    this.dob,
    this.height,
    this.weight,
    this.disability,
    this.loginType,
    this.password,
    // this.updatedAt,
    // this.createdAt,
    // this.id
  });

  RegisterDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userName = json['user_name'];
    phone = json['phone'];
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    height = json['height'];
    weight = json['weight'];
    disability = json['disability'];
    loginType = json['login_type'];
    password = json['password'];
    // updatedAt = json['updated_at'];
    // createdAt = json['created_at'];
    // id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['user_name'] = this.userName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['disability'] = this.disability;
    data['login_type'] = this.loginType;
    data['password'] = this.password;
    // data['updated_at'] = this.updatedAt;
    // data['created_at'] = this.createdAt;
    // data['id'] = this.id;
    return data;
  }
}
