// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../../../Constants/global.dart';
import '../../../Services/Api/api.dart';

class EveningImage extends StatelessWidget {
  const EveningImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imagestringevening =
        ApiService().baseurl + ApiService().arvind + eimg!;
    print(imagestringevening);
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            imagestringevening,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        Text(etime!),
        const SizedBox(height: 5),
        const Text(
          "Out",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}
