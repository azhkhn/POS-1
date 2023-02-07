
import 'package:flutter/material.dart';

import 'Components/button.dart';
import 'Components/declarations.dart';
import 'Components/headline.dart';
import 'Components/subheadline.dart';
import 'Components/subheadline2.dart';
import 'Components/subheadline3.dart';

class CovidScreen extends StatelessWidget {
  const CovidScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            CovidHeadline(),
            SubHeadline(),
            SubHeadlineSecond(),
            SubHeadlineThird(),
            Declarations(),
            Button()
          ],
        ),
      ),
    );
  }
}
