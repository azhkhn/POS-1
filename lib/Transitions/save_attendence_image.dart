// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../Constants/messages.dart';
import '../../Routing/named_routes.dart';
import '../../helpers/location_setter.dart';
import '../Constants/global.dart';
import '../Pages/Panel/scoped.dart';


class SaveAttendenceImage extends StatefulWidget {
  const SaveAttendenceImage({Key? key, required this.latitude, required this.longitude}) : super(key: key);

  final double latitude;
  final double longitude;

  @override
  State<SaveAttendenceImage> createState() => _SaveAttendenceImageState();
}

class _SaveAttendenceImageState extends State<SaveAttendenceImage> {

  @override
  void initState() {
    uploadImage(imagefileUpload, context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    StateInherited.of(context).locationData;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(height: 20),
              Text(
                'Uploading Image',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              CircularProgressIndicator(),
              SizedBox(height: 32),
              Text("Uploading..."),
            ],
          ),
        ),
      ),
    );
  }

  uploadImage(String imagepath, context) async {
    String responseString;
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://web.multiplier.co.in/ALFFTS/alfftssr_saveAttendance.action'));

    request.fields['empId'] = loginglobaldata[0].loginId;
    request.fields['appId'] = loginglobaldata[0].appId;
    request.fields['branchId'] = loginglobaldata[0].branchId;
    request.fields['fnImg'] = '1.txt';
    request.fields['latitude'] = widget.latitude.toString();
    request.fields['longitude'] = widget.longitude.toString();
    request.fields['remarks'] = '';
    request.fields['attendanceType'] = 'p';
    request.fields['dealerId'] = loginglobaldata[0].dealerId;
    request.fields['tlId'] = loginglobaldata[0].tlId;

    //create multipart using filepath, string or bytes
    http.MultipartFile pic = await http.MultipartFile.fromPath('img', imagepath);
    //add multipart to request
    request.files.add(pic);

    var response = await request.send();

    if (response.statusCode == 200) {
      responseString = await response.stream.bytesToString();
      print(responseString.runtimeType);
      print(responseString);

      if (mounted) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(routeDeviceSetupStart, (route) => false);
      }
      // return jsonDecode(responseString);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar_UplaodError);
        Navigator.pop(context);
      }
    }
  }
}
