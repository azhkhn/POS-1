import 'package:flutter/material.dart';

import '../../../../Constants/messages.dart';
import '../../../../Widgets/custom_text.dart';

class ForgotPass extends StatelessWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(snackBar_undefined);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: const CustomText(
          text: "Forgot Password?",
          color: Colors.blue,
          size: 15,
          weight: FontWeight.w400,
        ),
      ),
    );
  }
}
