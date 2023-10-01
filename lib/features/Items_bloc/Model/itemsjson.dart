import '../../../jsonconvertible/jsonconvertible.dart';

class itemsjson extends JsonConvertible{
  String? Companyname;
  List ? Images;
  List ? series;
  List ? Prices;

  itemsjson({this.Companyname,this.Images,this.Prices,this.series});

  itemsjson.fromJson(Map<String,dynamic> json){
    Companyname = json['Companyname'];
    Images = json['Images'];
    series = json['series'];
    Prices = json['Prices'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Companyname'] = Companyname;
    data['Images'] = Images;
    data['series'] = series;
    data['Prices'] = Prices;
    return data;
  }
}