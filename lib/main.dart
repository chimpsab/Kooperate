import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'pages/intropage.dart';
import 'pages/homepage.dart'; 
import 'pages/servicepage.dart'; 
import 'pages/portfoliopage.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBtpEC02TOYhQ6UZsHcmO06L2gMmXgAGvg",
        authDomain: "kooperate.firebaseapp.com",
        projectId: "kooperate",
        storageBucket: "kooperate.appspot.com",
        messagingSenderId: "709146513745",
        appId: "1:709146513745:web:ad15b3407bd402448c0370",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/homepage': (context) => const HomePage(),
        '/servicepage': (context) => const ServicePage(),
        '/portfoliopage': (context) => PortfolioPage(),
      },
    );
  }
}
