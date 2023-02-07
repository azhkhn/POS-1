import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class ServerError extends StatelessWidget {
  const ServerError({Key? key}) : super(key: key);

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
              const Text('Unable to Request Server currently'),
              const Text('Server Error'),
              const Text('Please try again later .....'),
            ],
          ),
        );
  }
}