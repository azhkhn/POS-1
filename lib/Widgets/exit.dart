import 'package:flutter/material.dart';
import 'package:pos/Constants/global.dart';
import '../Routing/named_routes.dart';
import '../helpers/user_state.dart';

Widget isExitDesired(context) {
  return AlertDialog(
    title: const Text('Promoter Online System'),
    content: const Text('Are you sure you want to logout from Promoter Online System?'),
    actions: [
      TextButton(
        onPressed: () async {
          await UserSimplePreferences.setLoginState('Logged OUT');
          loginglobaldata.first.empName.replaceAll(RegExp('[^A-Za-z0-9]'), '');
          loginglobaldata.first.agency.replaceAll(RegExp('[^A-Za-z0-9]'), '');
          loginglobaldata.first.appId.replaceAll(RegExp('[^A-Za-z0-9]'), '');
          loginglobaldata.first.branchId.replaceAll(RegExp('[^A-Za-z0-9]'), '');
          loginglobaldata.first.dealerId.replaceAll(RegExp('[^A-Za-z0-9]'), '');
          loginglobaldata.first.loginId.replaceAll(RegExp('[^A-Za-z0-9]'), '');
          loginglobaldata.first.tlId.replaceAll(RegExp('[^A-Za-z0-9]'), '');
          Navigator.of(context).pushNamedAndRemoveUntil(authenticationPageRoute, (route) => false);
        },
        child: const Text('CONFIRM'),
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('CANCEL'),
      ),
    ],
  );
}
