// import 'dart:convert';

// import 'package:http/http.dart' as http;

// import '../../Constants/global.dart';
// import '../../helpers/location_setter.dart';

// uploadImage(String imagepath, context) async {

//   String responseString;
//   var request = http.MultipartRequest(
//       'POST',
//       Uri.parse(
//           'https://web.multiplier.co.in/ALFFTS/alfftssr_saveAttendance.action'));

//   request.fields['empId'] = notes![0].loginId;
//   request.fields['appId'] = notes![0].appId;
//   request.fields['branchId'] = notes![0].branchId;
//   request.fields['fnImg'] = '1.txt';
//   request.fields['latitude'] =
//       StateInherited.of(context).locationData!.latitude.toString();
//   request.fields['longitude'] =
//       StateInherited.of(context).locationData!.longitude.toString();
//   request.fields['remarks'] = '';
//   request.fields['attendanceType'] = 'p';
//   request.fields['dealerId'] = notes![0].dealerId;
//   request.fields['tlId'] = notes![0].tlId;

//   //create multipart using filepath, string or bytes
//   http.MultipartFile pic = await http.MultipartFile.fromPath('img', imagepath);
//   //add multipart to request
//   request.files.add(pic);

//   var response = await request.send();

//   if (response.statusCode == 200) {
//     responseString =  await response.stream.bytesToString();
//     print(responseString.runtimeType);
//     print(responseString);

//     // return responseString;

//     return jsonDecode(responseString);
    
//     // return {"msg" : "Success"};
//   } 

//   return {"msg" : "Fail"};
// }
