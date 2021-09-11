class GetProfileModel {
  String message;
  ProfileData data;
  int code;

  GetProfileModel({this.message, this.data, this.code});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
    code = json['code'];
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

class ProfileData {
  int id;
  String name;
  String age;
  String userName;
  String phone;
  String email;
  String gender;
  String dob;
  String height;
  String weight;
  String disability;
  String loginType;
  Null deletedAt;
  String status;
  String profilePic;
  String createdAt;
  String updatedAt;

  ProfileData(
      {this.id,
      this.name,
      this.age,
      this.userName,
      this.phone,
      this.email,
      this.gender,
      this.dob,
      this.height,
      this.weight,
      this.disability,
      this.loginType,
      this.deletedAt,
      this.status,
      this.profilePic,
      this.createdAt,
      this.updatedAt});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    age = json['age'];
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
    deletedAt = json['deleted_at'];
    status = json['status'];
    profilePic = json['profile_pic'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['user_name'] = this.userName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['disability'] = this.disability;
    data['login_type'] = this.loginType;
    data['deleted_at'] = this.deletedAt;
    data['status'] = this.status;
    data['profile_pic'] = this.profilePic;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
