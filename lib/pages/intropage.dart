import 'package:flutter/material.dart';
import 'package:internship_project/components/button.dart';
//import 'package:internship_project/pages/homepage.dart';
import 'package:internship_project/pages/userlogin.dart';  

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 1, 20),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 25),

          // Icon
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Image.asset('lib/images/3.png'),
          ),

          // Tagline
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Powered By Mr. SaxenaProduction",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                'lib/images/4.png',
                height: 40, // Adjust the height as needed
              ),
            ],
          ),

          const SizedBox(height: 25),

          // Button
          MyButton(
            text: 'Get Started',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage(onTap: () {},))); //ERROR
            },
          ),
        ],
      ),
    );
  }
}
