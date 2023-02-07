// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import '../../Services/Api/privacy_set_status.dart';
import '../Routing/named_routes.dart';
import '../Widgets/logging_in.dart';
import '../Widgets/server_error.dart';

class PrivacyStateTransitoin extends StatelessWidget {
  const PrivacyStateTransitoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: privacysetstatus(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final data = snapshot.data;
          print('snapshot : $data');

          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (data['MSG'] == 'Fail' || data['MSG'] == 'fail') {
                  return FutureBuilder(
                      future: _startWaiting(context),
                      builder: (BuildContext context, AsyncSnapshot snapshot2) {
                        switch (snapshot2.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                          default:
                            return const LogginIN(
                              value: "Loggin In",
                            );
                        }
                      });
                }
                if (data['MSG'] == 'Success') {
                  return FutureBuilder(
                      future: _startnav(context),
                      builder: (BuildContext context, AsyncSnapshot snapshot2) {
                        switch (snapshot2.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                          default:
                            return const LogginIN(
                              value: "Loggin In",
                            );
                        }
                      });
                }
              }
              if (snapshot.hasError) {
                return FutureBuilder(
                    future: _startWaiting(context),
                    builder: (BuildContext context, AsyncSnapshot snapshot2) {
                      return const Center(
                        child: ServerError(),
                      );
                    });
              }
              return const LogginIN(
                value: "Loggin In",
              );
            case ConnectionState.waiting:
            case ConnectionState.active:
            default:
              return const LogginIN(
                value: "Loggin In",
              );
          }
        });
  }
}

_startWaiting(context) {
  Timer(
      const Duration(
        seconds: 0,
      ),
      () => Navigator.of(context).pop()
  );
}

Future<void> _startnav(context) async {
  Timer(const Duration(seconds: 0),
      () => Navigator.of(context).pushReplacementNamed(otpScreenRoute));
}
