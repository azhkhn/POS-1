// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/global.dart';
import '../../model/APISchemas/dashboard.dart';

Future<DashBoard> dashboard(String otp) async {
   var response = await http.post(
    Uri.parse('https://web.multiplier.co.in/dffts/dfftssr_listDashboard.action'/*'https://web.multiplier.co.in/ALFFTS/alfftssr_listDashboard.action'*/),
    body: {
      'empId': loginglobaldata.first.loginId,
      'appId': loginglobaldata.first.appId,
    },
   );

   if(response.statusCode == 200){
    final tempnote2 = jsonDecode(response.body);
    tempnote2['otp'] = otp;
    print('Response with added otp : $tempnote2');
    return DashBoard.fromJson(tempnote2);
   }

   return DashBoard.fromJson({});
  
}
