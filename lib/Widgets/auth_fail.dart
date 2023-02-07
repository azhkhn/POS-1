

import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class AuthError extends StatelessWidget {
  const AuthError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
          content: Column(
            children: [
              Lottie.asset(
                'assets/spiral.json',
                width: 50,
                height: 50
              ),
              const Text('Please check your credentials'),
            ],
          ),
        );
  }
}