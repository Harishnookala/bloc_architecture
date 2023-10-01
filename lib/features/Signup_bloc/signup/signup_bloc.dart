import 'package:bloc_architecture/features/Signup_bloc/signup/signup_event.dart';
import 'package:bloc_architecture/features/Signup_bloc/signup/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/signuprepository.dart';
import 'Model/userjson.dart';

class SignupBloc extends Bloc<Signupevent, SignupState> {
  Signuprepository? signuprepository;
  SignupBloc(this.signuprepository) : super(SignupInitial()) {
    on((event, emit) async {
      if (event is getsignupevent) {
        userjson user = await signuprepository!.addusers(event.user!);
        emit(SignupCompleted(user: user));
      }
    });
  }
}

//validation for text fieldSign
String validation(getsignupevent data) {
  if (data.user?.name?.isEmpty == true) {
    return 'Please Enter Your name';
  }
  if (data.user?.phonenumber!.isEmpty == true) {
    return 'Please Enter your phone-number';
  }

  return '';
}

String Validation(getotherevent event) {
  if (event.otherdetails?.surname?.isEmpty == true) {
    return 'Please Enter Surname';
  }
  if (event.otherdetails?.address?.isEmpty == true) {
    return 'Please Enter Address';
  }
  return '';
}
