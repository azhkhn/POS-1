import 'package:flutter/material.dart';

class DeclarationTwo extends StatelessWidget {
  const DeclarationTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: const Text(
          "* | am not suffering from flu like symptoms :\n Fever, Cough, Breathlessness, Sore throat etc.",
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
