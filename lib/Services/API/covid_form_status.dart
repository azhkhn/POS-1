import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/global.dart';

covidfromstatus() async {
  var request = await http.post(
    Uri.parse(
        'https://web.multiplier.co.in/ALFFTS/alfftssr_listCovid19SelfDeclaration.action'),
    body: {
      'empId': loginglobaldata.first.loginId,
      'appId': loginglobaldata.first.appId
    }
  );

  if (request.statusCode == 200) {
    final response = jsonDecode(request.body);
    return response;
  } else {
    return {'flag' : 'N'};
  }
}
