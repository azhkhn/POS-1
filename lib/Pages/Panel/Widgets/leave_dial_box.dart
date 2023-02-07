import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Transitions/save_attendence.dart';

class LeaveBox extends StatefulWidget {
  const LeaveBox({Key? key}) : super(key: key);

  @override
  State<LeaveBox> createState() => _LeaveBoxState();
}

class _LeaveBoxState extends State<LeaveBox> {
  TextEditingController leaveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Apply Leave'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextFormField(
              controller: leaveController,
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Back'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Save'),
          onPressed: () {
            Navigator.of(context).pop();
            showCupertinoDialog(
                context: context,
                builder: (context) => SaveAttendence( remarks:  leaveController.text, attendencetype : 'l',));
          },
        ),
      ],
    );
  }
}
