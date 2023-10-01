import 'package:bloc_architecture/features/Signup_bloc/signup/Model/userjson.dart';

abstract class usersState{}


class usersintial extends usersState{}

class usersFetchCompleted extends usersState{
  List<userjson>user;
  usersFetchCompleted(this.user);
}

