import 'package:flutter/material.dart';

class DeclarationOne extends StatelessWidget {
  const DeclarationOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: const Text(
          "* l am using Aarogya Setu App.                                             ",
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
