import 'package:flutter/material.dart';

class SubHeadlineSecond extends StatelessWidget {
  const SubHeadlineSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: RichText(
          text: const TextSpan(
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                    text:
                        "Your honest response will ensure your safety as well as that of persons you may contact during the line of duty."),
                TextSpan(text: "   "),
              ]),
        ),
      ),
    );
  }
}
