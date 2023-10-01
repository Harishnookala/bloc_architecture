
import '../../../../jsonconvertible/jsonconvertible.dart';

class userjson  extends JsonConvertible{
  String? name;
  String? phonenumber;
  String?surname;
  String? address;
  String? email;
  String? id;
  String?password;
  userjson({this.name, this.phonenumber,this.surname,this.address,
    this.email,this.id,this.password});

  userjson.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phonenumber = json['phonenumber'];
    surname = json ['surname'];
    address = json['address'];
    email = json ['email'];
    id = json['id'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone-number'] = phonenumber;
    data['surname'] = surname;
    data['address'] = address;
    data['email'] = address;
    data['id'] = id;
    data['password'] = password;
    return data;
  }
}