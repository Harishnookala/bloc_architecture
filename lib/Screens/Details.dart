import 'package:bloc_architecture/features/Users_bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/Signup_bloc/signup/Model/User.dart';
import '../features/Signup_bloc/signup/Model/userjson.dart';
import '../features/Users_bloc/repository/users_repositoryimpl.dart';
import '../features/Users_bloc/users_event.dart';
import '../features/Users_bloc/users_state.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  DetailsState createState() => DetailsState();
}

class DetailsState extends State<Details> {
  usersbloc users = usersbloc(usersrepositoryimpl());
  @override
  void initState() {
    super.initState();
    users.add(fetchUsers());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },child:Scaffold(
        body: BlocProvider(
          create: (context) =>users,
          child: BlocConsumer<usersbloc,usersState>(
            listener: (context,state){},
            builder: (context,state){
              if(state is usersintial){
                return const Center(child: CircularProgressIndicator(),);
              }
              if(state is usersFetchCompleted){
                List<userjson> user = state.user;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,),
                    Expanded(child: ListView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        shrinkWrap: true,
                        itemCount: user.length,
                        itemBuilder: (context,index){
                          return Container(
                            margin: const EdgeInsets.only(left: 25.4,right: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: Row(
                                    children: [
                                      const Text("Name : --- "),
                                      Text(user[index].name!),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child:  Row(
                                    children: [
                                      const Text("Surname:---"),
                                      Text(user[index].surname!)
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child:Row(
                                    children: [
                                      const Text("Phonenumber:---"),
                                      Text(user[index].phonenumber!)
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: Row(
                                    children: [
                                      const Text("Email : --"),
                                      Text(user[index].email!)
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: Row(
                                    children: [
                                      const Text("Address: --- "),
                                      Text(user[index].address!)
                                    ],
                                  ),
                                ),
                                const Divider(thickness: 1.5,),
                                const Padding(padding: EdgeInsets.only(bottom: 12.3))
                              ],
                            ),
                          );
                        }))
                  ],
                );
              }return Container();
            },
          )
        ),
    ), );
  }
}
