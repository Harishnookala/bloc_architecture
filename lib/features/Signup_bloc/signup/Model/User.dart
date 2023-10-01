class User  {
  String? name;
  String? phonenumber;
  String?surname;
  String? address;
  String? email;
  String? id;
  String?password;
  User({this.name, this.phonenumber,this.address,this.surname,this.email,
    this.id,this.password});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phonenumber = json['phonenumber'];
    surname = json['surname'];
    address = json ['address'];
    email = json['email'];
    id = json['id'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone-number'] = phonenumber;
    data['surname'] = surname;
    data['address'] = address;
    data['email'] = email;
    data['id'] = id;
    data['password'] = password;
    return data;
  }
}