class Items{
  String?Companyname;
  List? Images;
  List ? series;
  List<int> ? Prices;

  Items({this.Companyname,this.Images,this.Prices,this.series});

  Items.fromJson(Map<String,dynamic> json){
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