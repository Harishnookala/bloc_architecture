import 'dart:convert';

import 'package:bloc_architecture/features/Signup_bloc/repository/signuprepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../signup/Model/User.dart';
import '../signup/Model/userjson.dart';

class Signuprepositoryimpl implements Signuprepository{
  var value = FirebaseFirestore.instance.collection("Signup");
  @override
  Future<userjson> addusers(User user) async {
    Map<String,dynamic>data ={
      "name":user.name,
      "phonenumber" : user.phonenumber,
      "surname": user.surname,
      "email" : user.email,
      "address" : user.address,
      "surname": user.surname,
      "password" : user.password
    };
    value.add(data);
    var values = userjson.fromJson(data);
    return values;

  }
}