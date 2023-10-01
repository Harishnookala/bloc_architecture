import 'Model/loginuser.dart';

abstract class loginevent{}

class loginUserevent extends loginevent{
   Loginuser? loginuser;
  loginUserevent(this.loginuser);
}

class LoginForgotpasswordevent extends loginevent{}