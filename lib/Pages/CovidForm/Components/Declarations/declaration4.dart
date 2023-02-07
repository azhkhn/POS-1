import 'package:flutter/material.dart';

class DeclarationFour extends StatelessWidget {
  const DeclarationFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: const TextSpan(
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(text: "   "),
              TextSpan(
                  text:
                      "* | have not come in contact with any Covid-19 cases in last 14 days."),
            ]),
      ),
    );
  }
}
