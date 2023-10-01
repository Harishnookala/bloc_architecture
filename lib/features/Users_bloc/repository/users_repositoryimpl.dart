import 'dart:typed_data';

import 'package:bloc_architecture/features/Signup_bloc/signup/Model/userjson.dart';
import 'package:bloc_architecture/features/Users_bloc/repository/users_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Signup_bloc/signup/Model/User.dart';

class usersrepositoryimpl implements Fetchusersrepository{
  @override
  Future<List<userjson>> getUsersdata(User? user) async {
    List<userjson> items =[];

    var data  = await FirebaseFirestore.instance.collection("Signup").get();
    for(int i=0;i<data.docs.length;i++) {
      var name  = data.docs[i].get("name");
      var surname = data.docs[i].get("surname");
      var email = data.docs[i].get("email");
      var phonenumber = data.docs[i].get("phonenumber");
      var address = data.docs[i].get("address");
      var id =  data.docs[i].id;
      var password = data.docs[i].get("password");
      items.add(userjson(name: name,email: email,surname:
      surname,address:address,phonenumber: phonenumber, id:id,
       password: password
      ));
    }
   return items;
  }


}