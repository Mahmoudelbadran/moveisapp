import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moveisapp/prestion/screens/Home_screens/home_screen.dart';
import 'package:moveisapp/prestion/screens/Login_Screens/login_screens.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            return HomeScreenApp();
          } else {
            return LoginScreens();
          }
        },
      ),
    );
  }
}