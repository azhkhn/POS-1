import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/custom_text.dart';
import '../../Authentication/auth.dart';

class ForgotPin extends StatelessWidget {
  const ForgotPin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () {
          showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return const AuthenticationPage(
                  reset: true,
                );
              });
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: const CustomText(
            text: "Forgot Pin?",
            color: Colors.blue,
            size: 20,
            weight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
