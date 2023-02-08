// ignore_for_file: avoid_print, import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/global.dart';
import '../../model/APISchemas/device_detail.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:device_information/device_information.dart';


Future<DeviceData> deviceDetail(String data) async {
  var response = await http.post(
    Uri.parse('https://web.multiplier.co.in/dffts/dfftssr_saveDevicesInfo.action'/*'https://web.multiplier.co.in/ALFFTS/alfftssr_listDashboard.action'*/),
    body: {
      'empId': loginglobaldata.first.loginId,
      'deviceId': await PlatformDeviceId.getDeviceId,
      'appVersion': await DeviceInformation.platformVersion,
      'imei1': await DeviceInformation.deviceIMEINumber,
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
