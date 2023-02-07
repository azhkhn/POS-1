import 'package:flutter/material.dart';

import '../../exit.dart';

class ButtonLogout extends StatelessWidget {
  const ButtonLogout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
    onPressed: () => showDialog(
        context: context, builder: (context) => isExitDesired(context)),
    child: const Image(image: AssetImage('assets/multiplier.png')),
  );
  }
}
