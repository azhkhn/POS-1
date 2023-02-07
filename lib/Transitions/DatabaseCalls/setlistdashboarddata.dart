// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import '../../../Constants/global.dart';
import '../../../Routing/named_routes.dart';
import '../../../Services/Database/createdashboarddata.dart';
import '../../../Widgets/errordatabase.dart';
import '../../Services/Database/updatedashboarddata.dart';
import '../../Widgets/logging_in_center.dart';
import '../../helpers/user_state.dart';
import '../../model/APISchemas/dashboard.dart';


class SetDashBoardData extends StatelessWidget {
  const SetDashBoardData({Key? key, required this.dashboardata }) : super(key: key);

  final DashBoard dashboardata;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dashboardglobaldata.isEmpty == true ? createdashboarddata(dashboardata) : updatedashboarddata(dashboardata) ,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          final datalocal = snapshot.data;
          print('snapshotdashboarddata : $datalocal');

          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                dashboardglobaldata.isEmpty == true
                ?  dashboardglobaldata.add(datalocal!)
                : null;
                UserSimplePreferences.setDashboardDataState('True');
                 return FutureBuilder(
                  future: _startnavback(context),
                  builder: (BuildContext context,AsyncSnapshot snapshot2) {
                    return const PopUPLoading();
                });
              }
              if(snapshot.hasError){
                return FutureBuilder(
                  future: _startnavback(context),
                  builder: (BuildContext context,AsyncSnapshot snapshot2) {
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

Future<void> _startnavback(context,) async {
  Timer(
      const Duration(seconds: 0),
      () => Navigator.of(context).pushNamedAndRemoveUntil(otpScreenRoute, (route) => false )
  );
}