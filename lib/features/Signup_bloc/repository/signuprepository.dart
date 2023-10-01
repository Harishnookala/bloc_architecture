import '../signup/Model/User.dart';
import '../signup/Model/userjson.dart';

abstract class Signuprepository{
 Future<userjson>addusers(User user);
}