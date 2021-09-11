class Userdata {
  String message;
  String token;
  MemeberData data;
  int code;

  Userdata({this.message, this.token, this.data, this.code});

  Userdata.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    data = json['data'] != null ? new MemeberData.fromJson(json['data']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

class MemeberData {
  int id;
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
  String status;
  Null deletedAt;
  Null profilePic;
  String createdAt;
  String updatedAt;

  MemeberData(
      {this.id,
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
      this.status,
      this.deletedAt,
      this.profilePic,
      this.createdAt,
      this.updatedAt});

  MemeberData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    status = json['password'];
    deletedAt = json['deleted_at'];
    profilePic = json['profile_pic'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['profile_pic'] = this.profilePic;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
