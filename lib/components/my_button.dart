import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final String textofbutton;
  final Color buttoncolor;
  final VoidCallback onpressevent;
  const myButton({
    Key? key,
    required this.textofbutton,
    this.buttoncolor = Colors.grey,
    required this.onpressevent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onpressevent,
          child: Container(
            height: 70,
            decoration: BoxDecoration(color: buttoncolor, shape: BoxShape.circle),
            child: Center(
              child: Text(
                textofbutton,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
