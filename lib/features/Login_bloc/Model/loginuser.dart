class Loginuser {
  String? email;
  String? password;

  Loginuser({this.email, this.password});

  Loginuser.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    password = json["password"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
