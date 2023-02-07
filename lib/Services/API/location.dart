// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/global.dart';
import '../../model/APISchemas/location.dart';

Future<LocationDataDestination> targetdest() async {
  var request = await http.post(
    Uri.parse(
        'https://web.multiplier.co.in/ALFFTS/alfftssr_get_Location.action'),
    body: {
      'empId': loginglobaldata.first.loginId
    },
  );

  if (request.statusCode == 200) {
    print(jsonDecode(request.body));
    return LocationDataDestination.fromJson(jsonDecode(request.body));
  } else {
    return LocationDataDestination.fromJson(jsonDecode(request.body));
  }
}
