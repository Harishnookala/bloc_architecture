import '../../Signup_bloc/signup/Model/userjson.dart';
import '../Model/loginuser.dart';

abstract class Loginrepository{
  Future<userjson> loginUser(Loginuser user);
}