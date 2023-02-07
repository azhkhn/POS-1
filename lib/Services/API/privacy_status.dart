import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/global.dart';

privacystatus() async {
  var request = await http.post(
    Uri.parse(
        'https://web.multiplier.co.in/ALFFTS/alfftssr_privacypolicystatus.action'),
    body: {'empId': loginglobaldata.first.loginId},
  );

  if (request.statusCode == 200) {
    final response = jsonDecode(request.body);
    return response;
  } else {
    return null;
  }
}
