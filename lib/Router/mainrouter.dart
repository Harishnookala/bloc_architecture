import 'package:bloc_architecture/Screens/Signup.dart';
import 'package:bloc_architecture/Screens/products.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../Screens/Details.dart';
import '../Screens/Login.dart';

class Mainrouter{
  static FluroRouter router = FluroRouter();

  var registerHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const Register();
  });
  var loginHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const Login();
  });
  var detailsHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const Details();
  });
  var productsHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return  const MyButtonGroup();
  });
  void setupRouter() {
    router.define("signup", handler: registerHandler);
    router.define("login", handler: loginHandler);
    router.define("details", handler: detailsHandler);
    router.define("products", handler: productsHandler);
  }
}
