import 'package:bloc_architecture/features/Items_bloc/Model/items.dart';
import 'package:bloc_architecture/features/Items_bloc/Model/itemsjson.dart';
import 'package:bloc_architecture/features/Items_bloc/repository/itemsrepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class itemsrepositoryimpl implements itemsrepository{
  @override
  Future<itemsjson> getdata(Items? items) async {
    print("jagiodg");
   var data = await FirebaseFirestore.instance.collection("items").
   doc("Mobiles").get();
   var values = data.data();
   var jsondata = itemsjson.fromJson(values!);
   print(jsondata.series);
    if(jsondata!=null){
      return jsondata;
    }
    return null!;
  }
}