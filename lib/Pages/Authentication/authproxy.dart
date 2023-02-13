import 'package:flutter/material.dart';
import 'auth.dart';

class AuthProxy extends StatelessWidget {
  const AuthProxy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/daikin_splash.png"),
                  fit: BoxFit.fill),
            ),
            child: const AuthenticationPage(reset: false,));
  }
}