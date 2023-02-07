import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/global.dart';

privacysetstatus() async {
  var request = await http.post(
    Uri.parse(
        'https://web.multiplier.co.in/ALFFTS/alfftssr_saveprivacypolicy.action'),
    body: {
      'loginid': loginglobaldata.first.loginId,
      'privacystatus' : 'Y'
    },
  );

  if (request.statusCode == 200) {
    final response = jsonDecode(request.body);
    return response;
  } else {
    return null;
  }
}
