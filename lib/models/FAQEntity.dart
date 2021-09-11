class FAQEntity {
  int status;
  String errors;
  List<FAQData> data;
  FAQEntity({this.status,this.errors});

  FAQEntity.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<FAQData>();
      (json['data'] as List).forEach((v) {
        data.add(new FAQData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

}
class FAQData {
  String id;
  String question;
  String answere;
  bool isexpanded;

  FAQData({this.id, this.question,this.answere,this.isexpanded = false});

  FAQData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    question = json['question'];
    answere = json['answere'];
    isexpanded = json['isexpanded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['_id'] = this.id;
    data['question'] = this.question;
    data['answere'] = this.answere;
    data['isexpanded'] = this.isexpanded;
    return data;
  }
}
