
class UpdateContactEntity {
  String errors;
  int status;
  String message;
  UpdateContactData data;
  UpdateContactEntity({this.errors, this.data, this.status, this.message});

  UpdateContactEntity.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new UpdateContactData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    data['status'] = this.status;
    data['message'] = this.message;

    if (this.data != null) {
      data['schoolData'] = this.data.toJson();
    }
    return data;
  }
}

class UpdateContactData {
  String id;
  String contactName;
  String contactEmail;
  String contactAddress;
  String contactCompany;
  String cellNumber;
  String contactImage;
  String imagePath;
  String userId;
  String updated_at;
  String created_at;

  UpdateContactData(
      {this.id,
      this.contactImage,
      this.cellNumber,
      this.contactCompany,
      this.contactAddress,
      this.contactEmail,
      this.contactName,
      this.created_at,
      this.imagePath,
      this.updated_at,
      this.userId});

  UpdateContactData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    contactImage = json['contactImage'];
    cellNumber = json['cellNumber'];
    contactCompany = json['contactCompany'];
    contactAddress = json['contactAddress'];
    contactEmail = json['contactEmail'];
    contactName = json['contactName'];
    created_at = json['created_at'];
    imagePath = json['imagePath'];
    userId = json['userId'];
    updated_at = json['updated_at'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['contactImage'] = this.contactImage;
    data['cellNumber'] = this.cellNumber;
    data['contactCompany'] = this.contactCompany;
    data['contactAddress'] = this.contactAddress;
    data['contactEmail'] = this.contactEmail;
    data['contactName'] = this.contactName;
    data['created_at'] = this.created_at;
    data['imagePath'] = this.imagePath;
    data['userId'] = this.userId;
    data['updated_at'] = this.updated_at;
    return data;
  }
}
