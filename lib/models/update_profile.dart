class UpdateProfileModel {
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
  dynamic deletedAt;
  String status;
  String profilePic;
  DateTime createdAt;
  DateTime updatedAt;

  UpdateProfileModel(
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
      this.deletedAt,
      this.status,
      this.profilePic,
      this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_name": userName,
        "phone": phone,
        "email": email,
        "gender": gender,
        "dob": dob,
        "height": height,
        "weight": weight,
        "disability": disability,
        "login_type": loginType,
        "deleted_at": deletedAt,
        "status": status,
        "profile_pic": profilePic,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
