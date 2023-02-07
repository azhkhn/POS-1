import 'package:flutter/material.dart';

class PopUPLoading extends StatelessWidget {
  const PopUPLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Center(
          heightFactor: 1,
          child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.transparent)),
    );
  }
}
