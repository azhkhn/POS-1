// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/global.dart';
import '../../helpers/location_setter.dart';

saveOnDuty(
  String address, String agenda, String personcontact, String remarks,
    String sendercontact, String sendername, context) async {
  var response = await http.post(
    Uri.parse('https://web.multiplier.co.in/ALFFTS/alfftssr_saveOnDuty.action'),
    body: {
      'empId': loginglobaldata[0].loginId,
      'location': address,
      'appId': loginglobaldata[0].appId,
      'branchId': loginglobaldata[0].branchId,
      'agenda': agenda,
      'contactno': personcontact,
      'isSubmitted': 'Y',
      'latitude': StateInherited.of(context).locationData!.latitude.toString(),
      'longitude':
          StateInherited.of(context).locationData!.longitude.toString(),
      'remarks': remarks,
      'transportType': 'test',
      'visitType': 'car',
      'senderMobile': sendercontact,
      'senderName': sendername,
    },
  );

  if (response.statusCode == 200) {
    print(response.body);
    return jsonDecode(response.body);
  } else {
    return jsonDecode(response.body);
  }
}
