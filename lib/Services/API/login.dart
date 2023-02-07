// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../helpers/user_state.dart';
import '../../model/APISchemas/login_schema.dart';


Future<LoginData> authenticateUser() async {
  var tempnote;
  var response = await http.post(
    Uri.parse('https://web.multiplier.co.in/dffts/dfftssr_login.action'/*'https://web.multiplier.co.in/ALFFTS/alfftssr_login.action'*/),
    body: {
      'loginid': UserSimplePreferences.getUserName(),
      'password': UserSimplePreferences.getPassword(),
    },
  );

  if (response.statusCode == 200) {
    try {
      tempnote = jsonDecode(response.body);
      tempnote['loginId'] = UserSimplePreferences.getUserName();
      print('Response with added loginId : $tempnote');
      return LoginData.fromJson(tempnote);
    } catch (e) {
      print(e);
    }
  }
  return LoginData.fromJson(tempnote);
}
