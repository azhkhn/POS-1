import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Transitions/save_attendence.dart';

class HolidayBox extends StatefulWidget {
  const HolidayBox({Key? key}) : super(key: key);

  @override
  State<HolidayBox> createState() => _HolidayBoxState();
}

class _HolidayBoxState extends State<HolidayBox> {
  TextEditingController holidaycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Holiday'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextFormField(
              controller: holidaycontroller,
              style: Theme.of(context).textTheme.titleLarge,
              inputFormatters: const [],
              maxLines: 7,
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
          child: const Text('Approve'),
          onPressed: () {
            Navigator.of(context).pop();
            showCupertinoDialog(
                context: context,
                builder: (context) => SaveAttendence( remarks: holidaycontroller.text, attendencetype: 'h'));
          },
        ),
      ],
    );
  }
}
