class EditAddedFamilyRelation {
  int relationId;
  String name;
  String dob;
  String address = "abcd";
  int phone;
  int age;
  String email;
  int selectedRelationItemId;

  EditAddedFamilyRelation(
      {this.name,
      this.relationId,
      this.dob,
      this.address,
      this.age,
      this.phone,
      this.email,
      this.selectedRelationItemId});

  EditAddedFamilyRelation.fromJson(Map<String, dynamic> json) {
    relationId = json['relation_id'];
    dob = json['dob'];
    age = json[age];
    address = json['address'];
    phone = json['phone_no'];
    email = json['email'];
    name = json['name'];
    selectedRelationItemId = json['user_realtion_id'];
  }

  Map<String, dynamic> toJson() => {
        "relation_id": relationId,
        "dob": dob,
        "address": address,
        "phone_no": phone,
        "email": email,
        "name": name,
        "age": age,
        "user_relation_id": selectedRelationItemId,
      };
}
