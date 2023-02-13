// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../../../Constants/global.dart';
import '../../../Services/API/api.dart';

class MorningImage extends StatelessWidget {
  const MorningImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imagestring = ApiService().baseurl + ApiService().arvind + mimg!;
    print(imagestring);
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            imagestring,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        Text(mtime!),
        const SizedBox(height: 5),
        const Text(
          "In",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}
