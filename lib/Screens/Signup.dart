import 'package:bloc_architecture/features/Signup_bloc/signup/signup_bloc.dart';
import 'package:bloc_architecture/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/Signup_bloc/repository/signuprepositoryimpl.dart';
import '../features/Signup_bloc/signup/Model/User.dart';
import '../features/Signup_bloc/signup/signup_event.dart';
import '../features/Signup_bloc/signup/signup_state.dart';
import 'Details.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var surnameController = TextEditingController();
  var addressController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(Signuprepositoryimpl()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: BlocConsumer<SignupBloc, SignupState>(
              listener: (context, state) {
            if (state is SignupCompleted) {
              formKey.currentState!.reset();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Details()),
              );
            }
          }, builder: (context, state) {
            return Column(
              children: [
                Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.amber,
                          Colors.lightBlue,
                        ],
                        tileMode: TileMode.clamp,
                      ),
                    ),
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
                        padding: const EdgeInsets.only(left: 12.3,right: 12.5),
                        ),
                        const Text(
                          "Signup",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              fontSize: 20.6),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 18.5, right: 18.5),
                    child: Form(
                        key: formKey,
                        child: ListView(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 11),
                              child: const Text("Name"),
                            ),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: textFieldDecoration,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  value = "Name should not be Empty";
                                  return value;
                                }
                                return null;
                              },
                              controller: nameController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 11),
                              child: const Text("phone-number"),
                            ),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              decoration: textFieldDecoration,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Phone-number should not be empty";
                                }
                                if (value.length != 10) {
                                  value = "phone-number should be 10 digits";
                                  return value;
                                }

                                return null;
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              //maxLength: 10,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 11),
                              child: const Text("surname"),
                            ),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: surnameController,
                              decoration: textFieldDecoration,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  value = "Surname should not be Empty";
                                  return value;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 11),
                              child: const Text("Email"),
                            ),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: emailController,
                              decoration: textFieldDecoration,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter email address";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 11),
                              child: const Text("Address"),
                            ),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: addressController,
                              decoration: textFieldDecoration,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Address";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: const Text("Password"),
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: passwordController,
                              decoration: textFieldDecoration,
                              validator: (password) {
                                if (password!.isEmpty) {
                                  return 'please Enter Password';
                                }
                                if (password.length < 6) {
                                  return 'Please Enter atleast 6 characters';
                                }
                                return null;
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(190, 45),
                                    elevation: 4.0,
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18))),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<SignupBloc>(context).add(
                                        getsignupevent(User(
                                            name: nameController.text,
                                            phonenumber: phoneController.text,
                                            address: addressController.text,
                                            surname: surnameController.text,
                                            email: emailController.text,
                                            password:
                                                passwordController.text)));
                                  }
                                },
                                child: const Text("Submit",
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 1.2,
                                        fontSize: 18.5)),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        )),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
