/*"_id": "5b87b8552b59c156cb7d74b2",
"contactName": "test user",
"contactEmail": "gg@gg.com",
"contactAddress": "Pakistan Town, Rawalpindi, Pakistan",
"contactCompany": "abc",
"cellNumber": "4287",
"contactImage": "",
"imagePath": "",
"userId": "5b87b2422b59c1563d3ef442",
"updated_at": "2018-09-14 15:52:54",
"created_at": "2018-08-30 14:56:45"*/

class ContactDetail {
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
  bool isselected = false;

  ContactDetail(
      {this.id,
        this.contactName,
        this.contactEmail,
        this.contactAddress,
        this.contactCompany,
        this.cellNumber,
        this.contactImage,
        this.imagePath,
        this.userId,
        this.updated_at,this.isselected});

  ContactDetail.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    contactName = json['contactName'];
    contactEmail = json['contactEmail'];
    contactAddress = json['contactAddress'];
    contactCompany = json['contactCompany'];
    cellNumber = json['cellNumber'];
    contactImage = json['contactImage'];
    imagePath = json['imagePath'];
    userId = json['userId'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['contactName'] = this.contactName;
    data['contactEmail'] = this.contactEmail;
    data['contactAddress'] = this.contactAddress;
    data['contactCompany'] = this.contactCompany;
    data['cellNumber'] = this.cellNumber;
    data['contactImage'] = this.contactImage;
    data['userId'] = this.userId;
    data['updated_at'] = this.updated_at;

    return data;
  }
}