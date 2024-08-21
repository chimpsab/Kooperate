import 'package:flutter/material.dart';
import 'package:internship_project/pages/register.dart';
import 'package:internship_project/pages/userlogin.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  
  //login page
  bool showLoginPage = true;

  //toggle between login and register page
  void togglePage () {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePage,);
    } else {
      return RegisterPage(
        onTap: togglePage ,
      );
    }
  }
}