import 'package:flutter/material.dart';

import 'on_duty_type.dart';


// ignore: constant_identifier_names
enum Duty { BacktoWorkspace, Exhibition, Market, PartnerVisit, SiteRecce, Upcountry, Warehouse, Other}

class OnDutyBox extends StatefulWidget {
  const OnDutyBox({Key? key}) : super(key: key);

  @override
  State<OnDutyBox> createState() => _OnDutyBoxState();
}

class _OnDutyBoxState extends State<OnDutyBox> {
  Duty? _character = Duty.BacktoWorkspace;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(0),
      title: const Text('On Duty In:'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <RadioListTile>[
            RadioListTile<Duty>(
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Back to Workspace'),
              value: Duty.BacktoWorkspace,
              groupValue: _character,
              onChanged: (Duty? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<Duty>(
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Exhibition'),
              value: Duty.Exhibition,
              groupValue: _character,
              onChanged: (Duty? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<Duty>(
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Market'),
              value: Duty.Market,
              groupValue: _character,
              onChanged: (Duty? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<Duty>(
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Partner Visit'),
              value: Duty.PartnerVisit,
              groupValue: _character,
              onChanged: (Duty? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<Duty>(
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Site Recce'),
              value: Duty.SiteRecce,
              groupValue: _character,
              onChanged: (Duty? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<Duty>(
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Upcountry'),
              value: Duty.Upcountry,
              groupValue: _character,
              onChanged: (Duty? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<Duty>(
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Warehouse'),
              value: Duty.Warehouse,
              groupValue: _character,
              onChanged: (Duty? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<Duty>(
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Other'),
              value: Duty.Other,
              groupValue: _character,
              onChanged: (Duty? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ],
        ),
      ),
    actions: <Widget>[
      ElevatedButton(
            child: const Text('back'),
            onPressed: () => Navigator.of(context).pop()
          ),
          ElevatedButton(
            child: const Text('Done'),
            onPressed: () => Navigator.of(context).push(
               MaterialPageRoute(builder: (context) => const DutyType()
              )
            )
          ),
        ],
    );
  }
}
