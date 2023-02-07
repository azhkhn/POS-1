import 'package:flutter/material.dart';

class SubHeadline extends StatelessWidget {
  const SubHeadline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: const TextSpan(
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(text: "l am safe and healthy"),
              TextSpan(text: "   "),
            ]),
      ),
    );
  }
}
