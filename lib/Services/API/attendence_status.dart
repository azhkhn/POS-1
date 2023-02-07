// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Constants/global.dart';

getAttendencetoday(String forimagetime) async {
  final datetime = DateTime.now();
  final date = '${datetime.year}-${datetime.month}-${datetime.day}';
  print(date);
  var response = await http.post(
    Uri.parse('https://web.multiplier.co.in/ALFFTS/alfftssr_showAttendance_Duty.action'),
    body: {
      'appId'    : loginglobaldata.first.appId,
      'empId'    : loginglobaldata.first.loginId,
      'branchId' : loginglobaldata.first.branchId,
      'date'     : date
    },
  );

  if (response.statusCode == 200) {
    print(response.body);
    final temp = jsonDecode(response.body);
    if(forimagetime == 'true'){
      if(temp['status'] == 'N'){
        return {
          'mTime' : '', 
          'eTime' : ''
        };
      }
      if(temp['attendanceType'] == 'Present'){
        return temp;
      }
    }
    else{
      temp['status'] == 'Y'  
    ? {
      tempnoteresult = temp['attendanceType'],
      mimg = temp['mImg'],
      eimg = temp['eImg'],
      mtime = temp['mTime'],
      etime = temp['eTime']
      }
    : tempnoteresult = temp['status'];
    }
  } else {
    print("unable to get attendence info");
  }
}