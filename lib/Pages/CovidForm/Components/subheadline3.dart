import 'package:flutter/material.dart';

class SubHeadlineThird extends StatelessWidget {
  const SubHeadlineThird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: const TextSpan(
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          children: <TextSpan>[
            TextSpan(text: "Click to agree"),
          ]),
    );
  }
}
