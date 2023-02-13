import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).scaffoldBackgroundColor,
                      BlendMode.modulate),
                  child: Image.asset(
                    "assets/daikin_splash.png",
                    width: 200,
                    height: 200,
                  ),
                );
  }
}