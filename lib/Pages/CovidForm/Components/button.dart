import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Transitions/covid_form_set_status.dart';
import '../../../Widgets/custom_text.dart';

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoDialog(
            context: context,
            builder: (BuildContext context) => const CovidFormSetTransition());
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          width: 140,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: const CustomText(
            text: "I AGREE",
            color: Colors.black,
            size: 15,
            weight: FontWeight.w400,
          )),
    );
  }
}
