// ignore_for_file: file_names, constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Transitions/save_attendence.dart';

enum Duty {
  MarKetCloseDueToCovid19,
  StoreOpenIamnotavailableLWP,
  StoreOpenIamincontainmentZone,
  StoreOpenOwnerdidnotallowmetocome
}

class MarketCloseBox extends StatefulWidget {
  const MarketCloseBox({Key? key}) : super(key: key);

  @override
  State<MarketCloseBox> createState() => _MarketCloseBoxState();
}

class _MarketCloseBoxState extends State<MarketCloseBox> {
  Duty? _character = Duty.MarKetCloseDueToCovid19;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Market Close:'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RadioListTile<Duty>(
            title: const Text('MarKet Close Due To Covid-19'),
            value: Duty.MarKetCloseDueToCovid19,
            groupValue: _character,
            onChanged: (Duty? value) {
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<Duty>(
            title: const Text('Store Open- I am not available - LWP'),
            value: Duty.StoreOpenIamnotavailableLWP,
            groupValue: _character,
            onChanged: (Duty? value) {
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<Duty>(
            title: const Text('Store Open- I am in containment Zone'),
            value: Duty.StoreOpenIamincontainmentZone,
            groupValue: _character,
            onChanged: (Duty? value) {
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<Duty>(
            title: const Text('Store Open- Owner did not allow me to come'),
            value: Duty.StoreOpenOwnerdidnotallowmetocome,
            groupValue: _character,
            onChanged: (Duty? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
            child: const Text('Back'),
            onPressed: () => Navigator.of(context).pop()),
        ElevatedButton(
            child: const Text('Done'),
            onPressed: () => {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) => SaveAttendence( remarks: _character.toString(), attendencetype:  'mc'))
                }),
      ],
    );
  }
}
