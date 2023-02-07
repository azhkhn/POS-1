// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import '../../Routing/named_routes.dart';
import '../../Services/Api/attendence_noimage.dart';
import '../../Widgets/logging_in.dart';
import '../Widgets/auth_fail.dart';
import '../Widgets/server_error.dart';

class SaveAttendence extends StatelessWidget {
  const SaveAttendence({Key? key, required this.remarks ,required this.attendencetype }) : super(key: key);

  final String remarks;
  final String attendencetype;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: saveattendencetoday(remarks, attendencetype, context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        final data = snapshot.data;
        print('snapshot : ${snapshot.data}');

        switch (snapshot.connectionState) {

          case ConnectionState.done:

            if (snapshot.hasData) {
              if (data?['msg'] == 'fail' || data['msg'] == 'Fail') {

                return FutureBuilder(
                    future: _startWaiting(context),
                    builder: (BuildContext context,AsyncSnapshot snapshot2) {
                      return const Center(
                        child: AuthError(),
                      );
                    });
              }
              if (data['msg'] == 'Success') {
                return FutureBuilder(
                    future: _startnav(context),
                    builder: (BuildContext context,AsyncSnapshot snapshot2) {

                      switch (snapshot2.connectionState) {
                        case ConnectionState.active:
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                        default:
                          return const LogginIN(
                            value: "Saving Attendence",
                          );
                      }
                    });
              }
            }
            if (snapshot.hasError) {
              return FutureBuilder(
                  future: _startWaiting(context),
                  builder: (BuildContext context,AsyncSnapshot snapshot2) {
                    return const Center(
                      child: ServerError(),
                    );
                  });
            }
            return const LogginIN(
              value: "Saving Attendence",
            );

          case ConnectionState.none:
          case ConnectionState.waiting:
          default:
            return const LogginIN(
              value:
                  "Saving Attendence",
            );
        }
      });
  }
}

Future<void> _startWaiting(context) async {
  Timer(
      const Duration(
        seconds: 3,
      ),
      () => Navigator.of(context).pop());
}

Future<void> _startnav(context) async {
  Timer(
      const Duration(seconds: 0),
      () => Navigator.of(context).pushNamedAndRemoveUntil(routeDeviceSetupStart, (route) => false)
  );
}
