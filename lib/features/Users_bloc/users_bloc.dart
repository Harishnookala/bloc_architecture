import 'package:bloc_architecture/features/Users_bloc/repository/users_repository.dart';
import 'package:bloc_architecture/features/Users_bloc/users_event.dart';
import 'package:bloc_architecture/features/Users_bloc/users_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Signup_bloc/signup/Model/User.dart';
import '../Signup_bloc/signup/Model/userjson.dart';

class usersbloc extends Bloc<usersEvent, usersState> {
  Fetchusersrepository? fetchusersrepository;
  usersbloc(this.fetchusersrepository) : super(usersintial()) {
    on((event, emit) async {
      User? user;
      if (event is usersEvent) {
         List<userjson> users = await fetchusersrepository!.getUsersdata(user);
         print(users);
         emit(usersFetchCompleted(users));
      }
    });
  }
}