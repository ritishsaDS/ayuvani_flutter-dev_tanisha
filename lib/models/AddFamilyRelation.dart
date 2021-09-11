class AddFamilyRelation {
  int relationId;
  String name;
  String dob;
  String address = "abcd";
  int phone;
  int age;
  String email;
  int userRealtionId;

  AddFamilyRelation(
      {this.name,
      this.relationId,
      this.dob,
      this.address,
      this.age,
      this.phone,
      this.email,
      this.userRealtionId});

  AddFamilyRelation.fromJson(Map<String, dynamic> json) {
    relationId = json['relation_id'];
    dob = json['dob'];
    age = json[age];
    address = json['address'];
    phone = json['phone_no'];
    email = json['email'];
    name = json['name'];
    userRealtionId = json['id'];
  }

  Map<String, dynamic> toJson() => {
        "relation_id": relationId,
        "dob": dob,
        "address": address,
        "phone_no": phone,
        "email": email,
        "name": name,
        "age": age,
        "id": userRealtionId,
      };
}
