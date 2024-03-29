import 'package:flutter/material.dart';
import '../Routing/named_routes.dart';
import '../helpers/user_state.dart';

Widget isExitDesired(context) {
  return AlertDialog(
    title: const Text('Promoter Online System'),
    content: const Text('Are you sure you want to logout from Promoter Online System?'),
    actions: [
      TextButton(
        onPressed: () async {
          await UserSimplePreferences.setLoginState('Logged OUT');
          Navigator.of(context).pushNamedAndRemoveUntil(authenticationPageRoute, (route) => false);
        },
        child: const Text('CONFIRM'),
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('CANCEL'),
      ),
    ],
  );
}
