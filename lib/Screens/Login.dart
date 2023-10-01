import 'package:bloc_architecture/Router/mainrouter.dart';
import 'package:bloc_architecture/Screens/products.dart';
import 'package:bloc_architecture/features/Login_bloc/Model/loginuser.dart';
import 'package:bloc_architecture/features/Login_bloc/login_bloc.dart';
import 'package:bloc_architecture/features/Login_bloc/login_event.dart';
import 'package:bloc_architecture/features/Login_bloc/repository/login_respositoryimpl.dart';
import 'package:bloc_architecture/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/Login_bloc/login_state.dart';
import '../features/items_bloc/Model/items.dart';
import 'Details.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: BlocProvider(
          create: (context) => LoginBloc(loginrepositoryimpl()),
          child: BlocConsumer<LoginBloc, loginState>(listener: (context, state)  {
            if (state is Loginintial) {
              const CircularProgressIndicator();
            }
            if (state is LoginSuccesful) {
               /*  emailController.clear();
                passwordController.clear();*/
                var value = state.user;
                 SharedPreferences.getInstance().then((prefs) {
                   prefs.setBool("logging", true);
                   print(value!.email);
                   Mainrouter.router.navigateTo(context, "products");
                 });

            }
               if (state is LoginFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                     content: Text(state.errormessage!),
                   ),
                );
               }
          }, builder: (context, state) {
            return Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.greenAccent,
                        Colors.cyan,
                        Colors.orangeAccent,
                      ],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  child: Container(
                      margin: const EdgeInsets.only(top: 12.3, left: 12.4),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_sharp,
                              color: Colors.purpleAccent,
                              size: 25,
                            ),
                            padding:
                                const EdgeInsets.only(left: 12.3, right: 12.5),
                          ),
                          const Text(
                            "Login",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                fontSize: 21),
                          ),
                        ],
                      )),
                ),
                Expanded(
                    child: Form(
                  key: formKey,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.15,
                      child: Center(
                        heightFactor: 4.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(bottom: 11),
                              child: const Text(
                                "Email",
                                style: TextStyle(color: Colors.deepOrangeAccent,
                                 fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Center(
                              child: TextFormField(
                                cursorColor: Colors.black,
                                controller: emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please Enter email address';
                                  }
                                  return null;
                                },
                                decoration: textFieldDecoration,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(bottom: 11),
                              child: const Text(
                                "Password",
                                style: TextStyle(color: Colors.deepOrangeAccent,
                                fontSize: 15, fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                            Center(
                                child: TextFormField(
                              controller: passwordController,
                              cursorColor: Colors.black,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please Enter email address';
                                }
                                return null;
                              },
                              decoration: textFieldDecoration,
                            )),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/2,
                              height: MediaQuery.of(context).textScaleFactor*44,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 2.0,
                                    backgroundColor: Colors.indigoAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(loginUserevent(Loginuser(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    )));
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 0.3,
                                            fontSize: 20)),
                                    Container(
                                      margin: const EdgeInsets.only(left: 9.3),
                                      child: const Icon(
                                        Icons.arrow_forward_outlined,
                                        size: 27,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                ))
              ],
            );
          })),
    );
  }
}
