import 'package:bloc_architecture/features/Login_bloc/login_event.dart';
import 'package:bloc_architecture/features/Login_bloc/login_state.dart';
import 'package:bloc_architecture/features/Login_bloc/repository/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<loginevent,loginState>{
  Loginrepository? loginrepository;
  LoginBloc(this.loginrepository) : super(Loginintial()) {
    on((event, emit) async {
      if(event is loginUserevent ){
        emit(Loginintial());
        try{
          var value = await loginrepository!.loginUser(event.loginuser!);
          if(value.email!=null){
            emit(LoginSuccesful(user: value));
          }
        } catch (e) {
          emit(LoginFailed(errormessage: "Email/Password is incorrect"));
        }
      }
    });
  }
}