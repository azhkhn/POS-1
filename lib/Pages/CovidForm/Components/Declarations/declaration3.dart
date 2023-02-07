import 'package:flutter/material.dart';

class DeclarationThree extends StatelessWidget {
  const DeclarationThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: const Text(
          "* | have not travelled domestically and internationally in last 14 days.",
          maxLines: 2,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          textDirection: TextDirection.ltr,
        ));
  }
}
