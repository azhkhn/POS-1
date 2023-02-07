// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/global.dart';
import '../../model/APISchemas/trrain.dart';


Future<TrainDetail> gettraindata() async {
  var request = await http.post(
    Uri.parse(
        'https://web.multiplier.co.in/ALFFTS//alfftssr_getTrrainDate.action'),
    body: {
      'branchId': loginglobaldata.first.branchId,
    },
  );

  if (request.statusCode == 200) {
    print(jsonDecode(request.body));
    return TrainDetail.fromJson(jsonDecode(request.body));
  } else {
    return jsonDecode(request.body);
  }
}
