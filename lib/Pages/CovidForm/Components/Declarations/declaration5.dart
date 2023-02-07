
import 'package:flutter/material.dart';

class DeclarationFive extends StatelessWidget {
  const DeclarationFive({Key? key}) : super(key: key);

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
                              "* | understand that, while Multiplier Brand Solutions Pvt. Ltd. is taking all necessary safety and hygiene precautions, it can not be held liable in the unfortunate event of any person or customer diagnosed with COVID-19."),
                    ]),
              ),
            );
  }
}