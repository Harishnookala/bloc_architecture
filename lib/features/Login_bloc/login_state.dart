import '../Signup_bloc/signup/Model/User.dart';
import '../Signup_bloc/signup/Model/userjson.dart';

abstract class loginState{}


class Loginintial extends loginState{}
class LoginSuccesful extends loginState{
  userjson? user;
  LoginSuccesful({this.user});
}
class LoginFailed extends loginState{
  String?errormessage;
  LoginFailed({this.errormessage});
}