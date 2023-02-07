// ignore_for_file: unused_local_variable, avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import '../../Services/Api/attendence_status.dart';
import '../../Widgets/logging_in.dart';
import '../../Widgets/server_error.dart';
import '../Pages/Attendence/scoped.dart';
import '../Routing/named_routes.dart';

class AttendenceStatusGetter extends StatelessWidget {
  const AttendenceStatusGetter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAttendencetoday('false'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          final data = snapshot.data;
          print('snapshot : $loc');

          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (loc!.status == 'N') {
                  return FutureBuilder(
                      future: _startnav2(context),
                      builder: (BuildContext context,AsyncSnapshot snapshot2) {
                        switch (snapshot2.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                        default:
                          return const LogginIN(value: "Setting Up");
                      }
                      });
                }
                if (loc!.status == 'Y') {
                  return FutureBuilder(
                    future: _startnav2(context),
                    builder: (BuildContext context,AsyncSnapshot snapshot2) {
                      
                      switch (snapshot2.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                        default:
                          return const LogginIN(value: "Setting Up");
                      }
                    }
                  );
                }
              }
              if(snapshot.hasError){
                return FutureBuilder(
                  future: _startnav2(context),
                  builder: (BuildContext context,AsyncSnapshot snapshot2) {
                    return const Center(
                      child: ServerError(),
                    );
                });
              }
              return const LogginIN(value: "Setting Up");
            case ConnectionState.waiting:
            case ConnectionState.none:
            default: 
              return const LogginIN(value: "Setting Up");
          }
        });
  }
}

Future<void> _startnav2(context,) async {
  Timer(
      const Duration(seconds: 0),
      () => Navigator.of(context)
          .pushNamedAndRemoveUntil(routeDeviceSetupStart, (route) => false)
  );
}