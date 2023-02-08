// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/global.dart';
import '../../model/APISchemas/dashboard.dart';
import '../../model/APISchemas/device_detail.dart';

Future<DeviceData> deviceDetail(String data) async {
  var response = await http.post(
    Uri.parse('https://web.multiplier.co.in/dffts/dfftssr_saveDevicesInfo.action'/*'https://web.multiplier.co.in/ALFFTS/alfftssr_listDashboard.action'*/),
    body: {
      'empId': loginglobaldata.first.loginId,
      'deviceId': loginglobaldata.first.deviceId,
      'appVersion': 2.0,
      'imei1':loginglobaldata.first.imei1,
    },
  );

  if(response.statusCode == 200){
    final tempnote1 = jsonDecode(response.body);
    tempnote1['data'] = data;
    print('Response with added data : $tempnote1');
    return DeviceData.fromJson(tempnote1);
  }

  return DeviceData.fromJson({});

}
