// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import '../Routing/named_routes.dart';
import '../Services/API/privacy_status.dart';
import '../Widgets/logging_in_center.dart';
import '../Widgets/server_error.dart';
import '../helpers/user_state.dart';

class PrivacyFormTransition extends StatelessWidget {
  const PrivacyFormTransition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    future: privacystatus(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {

      final data = snapshot.data;
      print('snapshot : $data');

      switch (snapshot.connectionState) {
        case ConnectionState.done:
          if (snapshot.hasData) {
            if (data['privacypolicystatus'] == 'N') {
              UserSimplePreferences.setisPrivacyFormChecked(false);
              return FutureBuilder(
                  future: _startWaiting(context),
                  builder: (BuildContext context,AsyncSnapshot snapshot2) {
                    switch (snapshot2.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    default:
                      return const PopUPLoading();
                  }
                  });
            }
            if (data['privacypolicystatus'] == 'Y') {
              UserSimplePreferences.setisPrivacyFormChecked(true);
              return FutureBuilder(
                future: _startnav(context),
                builder: (BuildContext context,AsyncSnapshot snapshot2) {
                  
                  switch (snapshot2.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    default:
                      return const PopUPLoading();
                  }
                }
              );
            }
          }
          if(snapshot.hasError){
            return FutureBuilder(
              future: _startWaiting(context),
              builder: (BuildContext context,AsyncSnapshot snapshot2) {
                return const Center(
                  child: ServerError(),
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

_startWaiting(context) {
  Timer(
      const Duration(
        seconds: 0,
      ),
      () => Navigator.of(context).pushReplacementNamed(privacyPageRoute) );
}

Future<void>_startnav(context) async {
  Timer(
      const Duration(seconds: 0),
      () => Navigator.of(context).pushReplacementNamed(otpScreenRoute)
  );
}
