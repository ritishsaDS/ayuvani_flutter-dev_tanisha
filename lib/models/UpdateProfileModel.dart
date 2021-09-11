class UpdateProfileDataModel {
  String errors;
  int status;
  String message;
  UpdatedData data;
  String is_feedback;
  UpdateProfileDataModel({this.errors, this.data, this.status, this.message});

  UpdateProfileDataModel.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    status = json['status'];
    message = json['message'];
    is_feedback = json['is_feedback'];
    if (json['data'] != null) {
      data =
          json['data'] != null ? new UpdatedData.fromJson(json['data']) : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    data['status'] = this.status;
    data['message'] = this.message;

    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class UpdatedData {
  String id;
  String userEmail;
  String userPassword;
  int signupType;
  int is_verified;
  int is_blocked;
  int is_deleted;
  int paid;

  UpdatedData(
      {this.id,
      this.userEmail,
      this.signupType,
      this.is_verified,
      this.is_blocked,
      this.is_deleted,
      this.paid});

  UpdatedData.fromJson(Map<String, dynamic> json) {
    /*	contactNo = json['contact_no'];
		latitude = json['latitude'] == 0 ? 0.0 : json['latitude'];*/
    id = json['_id'];
    userEmail = json['userEmail'];
    signupType = json['signupType'];
    is_verified = json['is_verified'];
    is_blocked = json['is_blocked'];
    is_deleted = json['is_deleted'];
    paid = json['paid'];
    /*email = json['email'];
		longitude = json['longitude'] == 0 ? 0.0 : json['longitude'];*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    /*data['contact_no'] = this.contactNo;
		data['latitude'] = this.latitude;*/
    data['_id'] = this.id;
    data['userEmail'] = this.userEmail;
    data['signupType'] = this.signupType;
    data['is_verified'] = this.is_verified;
    data['is_blocked'] = this.is_blocked;
    data['is_deleted'] = this.is_deleted;
    data['paid'] = this.paid;
    /*	data['email'] = this.email;
		data['longitude'] = this.longitude;*/
    return data;
  }
}

/*
"_id": "5fc0cd0bf96bdd50c8249c34",
"userEmail": "p@yopmail.com",
"userPassword": "QWRtaW5AMTIz",
"": 0,
"is_verified": 1,
"is_blocked": 0,
"is_deleted": 0,
"paid": 0,
"device_type": null,
"userDeviceToken": "ssssss",
"expiry_date": "2020-12-27",
"updated_at": "2020-12-01 15:59:17",
"created_at": "2020-11-27 15:25:23",
"access_token": "4u16k0b15vuocs0sss00ocok8csg0c0",
"name": "vikas",
"companyAddress": "mohaligdgt",
"PhoneNumber": "789654123555",
"companyName": "softuvo",
"faxNumber": "fax123456",
"city": "banga",
"state": "pun",
"zip": "144505",
"dotNo": "15",
"MCNo": "mvno456",
"trailerNo": "trailno908",
"truckNumber": "78945222",
"buisinessType": "bustype456",
"mailingAddress": "mailaddreee3333@gmail.com",
"initials": "initials123",
"title": "title333",
"bankName": "yes bank",
"bankCity": "changdigarh",
"bankState": "punjab",
"BankABANo": "4587",
"accountNo": "65150107266",
"cellNumber": "cellmio456987",
"CarrierNumber": "741258963555",
"TaxIdNo": "",
"insuranceNo": "",
"companyEmail": "",
"location": "",
"cancel_subscription": 0,
"MCNoImage": "",
"taxIdImage": "",
"insuranceImage": "",
"SignatureImage": "",
"companyLogo": "",
"mcno_image_name": "",
"tax_mage_name": "",
"insurance_image_name": "",
"signature_mage_name": "",
"company_logo_name": ""
*/
