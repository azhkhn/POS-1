import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Transitions/save_attendence.dart';


class WeekOff extends StatelessWidget {
  const WeekOff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('Are you sure for Week Off ?'),
      actions: <Widget>[
        TextButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop();
              showCupertinoDialog(
                  context: context,
                  builder: (context) => const SaveAttendence(remarks: '', attendencetype: 'w'));
            }),
        TextButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
