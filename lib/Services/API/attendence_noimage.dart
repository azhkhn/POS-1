// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/global.dart';
import '../../helpers/location_setter.dart';


saveattendencetoday(String remarks, String attendanceType, context) async {
  print("  'empId': ${loginglobaldata[0].loginId} ");
  print("  'appId': ${loginglobaldata[0].appId} ");

  print("  'branchId': ${loginglobaldata[0].branchId} ");

  print(
      "  'latitude': ${StateInherited.of(context).locationData!.latitude.toString()} ");
  print(
      "  'longitude': ${StateInherited.of(context).locationData!.longitude.toString()} ");
  print("  'remarks': $remarks ");
  print("  'attendanceType': $attendanceType ");
  print("  'tlId': ${loginglobaldata[0].loginId} ");

  var response = await http.post(
    Uri.parse(
        'https://web.multiplier.co.in/ALFFTS/alfftssr_saveAttendance.action'),
    body: {
      'empId'           : loginglobaldata[0].loginId,
      'appId'           : loginglobaldata[0].appId,
      'branchId'        : loginglobaldata[0].branchId,
      'fnImg'           : '1.txt',
      'latitude'        : StateInherited.of(context).locationData!.latitude.toString(),
      'longitude'       : StateInherited.of(context).locationData!.longitude.toString(),
      'remarks'         : remarks,
      'attendanceType'  : attendanceType,
      'dealerId'        : loginglobaldata[0].dealerId,
      'tlId'            : loginglobaldata[0].tlId,
    },
  );

  if (response.statusCode == 200) {
    // var responseString = await response.stream.bytesToString();
    print('response : ${response.body}');
    print(jsonDecode(response.body).runtimeType);
    return jsonDecode(response.body);
  } else {
    return jsonDecode(response.body);
  }
}
