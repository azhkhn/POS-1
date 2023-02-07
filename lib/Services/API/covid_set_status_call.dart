// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/global.dart';

covidformsetstatus() async {
  var request = await http.post(
    Uri.parse(
        'https://web.multiplier.co.in/ALFFTS/alfftssr_saveCovid19SelfDeclaration.action'),
    body: {
      'empId': loginglobaldata.first.loginId,
      'appId': loginglobaldata.first.loginId,
      'isAgree' : 'Y'
    }
  );

  if (request.statusCode == 200) {
    final response = jsonDecode(request.body);
    print(response);
    return response;
  } else {
    return {'msg' : 'Fail'};
  }
}
