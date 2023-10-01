import 'package:bloc_architecture/styles/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bloc_architecture/Router/mainrouter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/products.dart';
import 'features/Signup_bloc/repository/signuprepositoryimpl.dart';
import 'features/Signup_bloc/signup/signup_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAt6XFipWRC344K3ViLO4prFLV5Pd78Mts",
          projectId: "blocarchitecture-e3d36",
          appId: '1:870269142939:android:19c08877a43a05b24c033e',
          messagingSenderId: ''));
  Mainrouter().setupRouter();
  SharedPreferences prefs = await SharedPreferences.getInstance();
   var data = prefs.getBool('logging');
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: data==true? const MyButtonGroup():MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  SignupBloc signupBloc = SignupBloc(Signuprepositoryimpl());
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(
        title: 'Flutter Demo',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SignupBloc signupBloc = SignupBloc(Signuprepositoryimpl());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Mainrouter.router.generator,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Learning Bloc Architecture'),
          ),
          body: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12.3,left: 15.3,right: 15.3,bottom: 15),
                  child: const Text(welcome_message,style:
                  TextStyle(color: Colors.black,
                   fontSize: 17,
                    wordSpacing: 1.0
                  ),),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15.3,right: 15.3,bottom: 15),
                  child: const Text(welcome_message1,style:
                  TextStyle(color: Colors.black,
                      fontSize: 17,
                      wordSpacing: 1.0
                  ),),
                ),
                const SizedBox(height: 120,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 2.0,
                      backgroundColor: Colors.purple.shade400,
                      minimumSize: const Size(180, 40),
                      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15))
                    ),
                    onPressed: (){
                      Mainrouter.router.navigateTo(context, "login");
                    }, child: const Text("Login ",style: TextStyle(fontSize: 18),)),
                 const SizedBox(height: 20,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 2.0,
                        backgroundColor: Colors.purple.shade400,
                        minimumSize: const Size(180, 40),
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15))
                    ),
                    onPressed: (){
                       Mainrouter.router.navigateTo(context, "signup");
                    }, child: const Text("Signup",style: TextStyle(fontSize: 18),))
              ],
            ),
          ),
        ));
  }
}
