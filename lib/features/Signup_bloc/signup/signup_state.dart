import 'Model/other_details.dart';
import 'Model/userjson.dart';

abstract class SignupState{}


class SignupInitial extends SignupState{}

class SignupValidation extends SignupState {
  String? value;
  SignupValidation(this.value);
}
class SignupLoading extends SignupState {}
class SignupCompleted extends SignupState {
  userjson? user;
  SignupCompleted({this.user});
}
class SignupError extends SignupState {
  String? error;
  SignupError(this.error);
}

//Other details

class Othersvalidation extends SignupState{
  String? value;
  Othersvalidation(this.value);
}

class OthersLoading extends SignupState {}


class OthersCompleted extends SignupState {
  other_details? others;
  OthersCompleted({this.others});
}