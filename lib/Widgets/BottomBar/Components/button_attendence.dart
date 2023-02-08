import 'package:flutter/material.dart';

import '../../../Pages/Attendence/attendence.dart';

class ButtonAttendence extends StatelessWidget {
  const ButtonAttendence({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
    onPressed: () => Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AttendencePage(),
    )),
    child: const Image(image: AssetImage('assets/multiplier.png')),
  );
  }
}