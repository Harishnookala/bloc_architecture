import '../../Signup_bloc/signup/Model/User.dart';
import '../../Signup_bloc/signup/Model/userjson.dart';

abstract class Fetchusersrepository{
  Future<List<userjson>> getUsersdata(User? user);
}