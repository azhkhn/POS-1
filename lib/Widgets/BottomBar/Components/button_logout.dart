import 'package:flutter/material.dart';

import '../../exit.dart';

class ButtonLogout extends StatelessWidget {
  const ButtonLogout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
    onPressed: () => showDialog(
        context: context, builder: (context) => isExitDesired(context)),
    child: Column(
      children: const [
        Image(image: AssetImage('assets/logout_drawer.png'),height: 85),
        Text('Logout',style: TextStyle(color: Colors.white,fontSize: 20.0))
      ],
    ),
  );
  }
}
