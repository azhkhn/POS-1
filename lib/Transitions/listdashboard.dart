// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Services/Api/dashboard.dart';
import '../../Widgets/server_error.dart';
import '../Widgets/logging_in_center.dart';
import '../model/APISchemas/dashboard.dart';
import 'DatabaseCalls/setlistdashboarddata.dart';

class GetDashboardDataTransition extends StatelessWidget {
  const GetDashboardDataTransition({Key? key, required this.otp}) : super(key: key);

  final String otp;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DashBoard>(
        future: dashboard(otp),
        builder: (BuildContext context, AsyncSnapshot<DashBoard> snapshot) {

          final datadashboard = snapshot.data;
          print('snapshotdestinationlocation : $datadashboard');

          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (datadashboard!.status == 'N') {
                  return FutureBuilder(
                  future: _startnav2(context),
                  builder: (BuildContext context,AsyncSnapshot snapshot2) {
                    return const PopUPLoading();
                });
                }
                if (datadashboard.status == 'Y') {
                  return SetDashBoardData(dashboardata: datadashboard);
                }
              }
              if (snapshot.hasError) {
                return FutureBuilder(
                    future: _startnav2(context),
                    builder: (BuildContext context, AsyncSnapshot snapshot2) {
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

Future<void> _startnav2(context) async {
  Timer(
      const Duration(seconds: 0),
      () => Navigator.pop(context)
  );
}
