
import 'Model/User.dart';
import 'Model/other_details.dart';
import 'Model/other_details.dart';

abstract class Signupevent{}

class getsignupevent extends Signupevent{
 User? user;

  getsignupevent(this.user);
}

class getotherevent extends Signupevent{
 other_details? otherdetails;

  getotherevent(this.otherdetails);
}