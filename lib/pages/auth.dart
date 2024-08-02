import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internship_project/pages/homepage.dart';
//import 'package:internship_project/pages/userlogin.dart';
import 'package:internship_project/pages/loginorregister.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //if user if logged in
          if(snapshot.hasData) {
            return HomePage();
          }

          //if user is not logged in
          else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}