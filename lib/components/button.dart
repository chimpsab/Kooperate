import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: widget.onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        shadowColor: Colors.blueGrey,
        minimumSize: Size(30, 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200),
          
        ),
        backgroundColor: Color.fromARGB(255, 2, 0, 54), // Background color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(
            widget.text,
            style: const TextStyle(color: Colors.white, fontSize: 23),
          ),
          const SizedBox(width: 5),
          // Icon
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
