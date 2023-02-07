import 'package:flutter/material.dart';
import 'Declarations/declaration1.dart';
import 'Declarations/declaration2.dart';
import 'Declarations/declaration3.dart';
import 'Declarations/declaration4.dart';
import 'Declarations/declaration5.dart';

class Declarations extends StatelessWidget {
  const Declarations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            DeclarationOne(),
            DeclarationTwo(),
            DeclarationThree(),
            DeclarationFour(),
            DeclarationFive(),
          ],
        ),
      ),
    );
  }
}
