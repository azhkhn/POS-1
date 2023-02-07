import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class ErrorDatabase extends StatelessWidget {
  const ErrorDatabase({Key? key}) : super(key: key);

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
              const Text('Database Error'),
            ],
          ),
        );
  }
}