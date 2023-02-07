

// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/global.dart';
import '../../helpers/user_state.dart';

page4() async {
   var response = await http.post(
    Uri.parse('https://hcm.multiplier.co.in/empess/Login/performLoginByMobileApi'),
    body: {
      'username': loginglobaldata.first.loginId,
      'password': UserSimplePreferences.getPassword(),
    },
   );

   if(response.statusCode == 200){

    try {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
      throw Exception(e);
    }
   }
   else{
    return {'status' : 'N'};
   }
  
}