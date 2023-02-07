

import 'package:flutter/material.dart';

class CovidHeadline extends StatelessWidget {
  const CovidHeadline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: "Covid-19 Self Health Declaration"),
                      TextSpan(text: "   "),
                    ]),
              ),
            );
  }
}