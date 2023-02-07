// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import '../../../Constants/global.dart';
import '../../../Routing/named_routes.dart';
import '../../../Services/Database/createloginuserdata.dart';
import '../../../Widgets/errordatabase.dart';
import '../../../helpers/user_state.dart';
import '../../../model/APISchemas/login_schema.dart';
import '../../Services/Database/updatelogindata.dart';
import '../../Widgets/logging_in_center.dart';
import '../privacy_form_transition.dart';


class SetLoginData extends StatelessWidget {
  const SetLoginData({Key? key, required this.logindata}) : super(key: key);

  final LoginData logindata;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loginglobaldata.isEmpty == true
            ? createlogindata(logindata)
            : updatelogindata(logindata),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final datalocal = snapshot.data;
          print('snapshotlogindata : $datalocal');

          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                loginglobaldata.isEmpty == true
                    ? loginglobaldata.add(datalocal!)
                    : null;
                UserSimplePreferences.setLoginState("Logged IN");
                UserSimplePreferences.setUserLoginDataState("True");
                if(UserSimplePreferences.getPrivacyFormstatus() == true){
                  return FutureBuilder(
                        future: _startnav(context),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot2) {
                          switch (snapshot2.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                            default:
                              return const PopUPLoading();
                          }
                        });
                }else{
                  return const PrivacyFormTransition();
                }
              }
              if (snapshot.hasError) {
                return FutureBuilder(
                    future: _startnavback(context),
                    builder: (BuildContext context, AsyncSnapshot snapshot2) {
                      return const Center(
                        child: ErrorDatabase(),
                      );
                    });
              }
              return const PopUPLoading();
            case ConnectionState.waiting:
            case ConnectionState.none:
            default:
              return const PopUPLoading();
          }
        });
  }
}

Future<void> _startnavback(
  context,
) async {
  Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context)
          .pushNamedAndRemoveUntil(authenticationPageRoute, (route) => false));
}

Future<void> _startnav(context) async {
  Timer(const Duration(seconds: 0),
      () => Navigator.of(context).pushReplacementNamed(otpScreenRoute));
}
