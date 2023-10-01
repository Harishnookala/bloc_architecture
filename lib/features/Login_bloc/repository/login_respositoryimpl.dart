import 'package:bloc_architecture/features/Login_bloc/Model/loginuser.dart';

import 'package:bloc_architecture/features/Signup_bloc/signup/Model/userjson.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login_repository.dart';

class loginrepositoryimpl implements Loginrepository{
  @override
  Future<userjson> loginUser(Loginuser user) async {
    var data  = await FirebaseFirestore.instance.collection("Signup").get();
    for(int i=0;i<data.docs.length;i++){
      var email = user.email;
      var password = user.password;
      if(email == data.docs[i].get("email") && password == data.docs[i].get("password")){
        Map<String,dynamic>values ={
          "email":data.docs[i].get("email"),
          "phonenumber":data.docs[i].get("phonenumber"),
          "id":data.docs[i].id,
          "name" :data.docs[i].get("name"),
          "address" : data.docs[i].get("address")
        };
        var value = userjson.fromJson(values);
        return value;
      }
    }
    return null!;
  }
}