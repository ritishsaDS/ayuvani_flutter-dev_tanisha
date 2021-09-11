class LoginCred {
  String email;
  String password;
  bool rememberme;
  LoginCred({this.email,this.password,this.rememberme});

  LoginCred.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    rememberme = json['rememberme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['rememberme'] = this.rememberme;
    return data;
  }
}