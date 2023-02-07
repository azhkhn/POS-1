import 'package:flutter/material.dart';

import '../helpers.dart';
import '../scoped.dart';

class Bar extends StatelessWidget {
  const Bar({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () => tooglepanel(sheetcontroller,context),
          child: Row(
            children: const [
              SizedBox(
                width: 10,
              ),
              Icon(Icons.menu),
              SizedBox(
                width: 16,
              ),
              Text(
                "Tab to Attendence",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
