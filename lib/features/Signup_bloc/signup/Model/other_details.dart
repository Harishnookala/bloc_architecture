class other_details {
  String? surname;
  String? address;

  other_details({this.surname, this.address});

  other_details.fromJson(Map<String, dynamic> json) {
    surname = json['surname'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['surname'] = surname;
    data['address'] = address;
    return data;
  }
}