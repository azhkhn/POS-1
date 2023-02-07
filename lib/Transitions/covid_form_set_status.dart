// ignore_for_file: unused_element, avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import '../../Services/Api/covid_set_status_call.dart';
import '../../Widgets/logging_in.dart';
import '../Routing/named_routes.dart';
import '../helpers/user_state.dart';
import 'location_data.dart';


class CovidFormSetTransition extends StatelessWidget {
  const CovidFormSetTransition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: covidformsetstatus(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          final data = snapshot.data;
          print('snapshotcovidformaftersetting : $data');

          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (data!['msg'] == 'Fail' || data['msg'] == 'fail') {
                  UserSimplePreferences.setisCovidFormChecked(false);
                  return const DestinationLocationTransition();
                }
                if (data['msg'] == 'Success') {
                  UserSimplePreferences.setisCovidFormChecked(true);
                  return const DestinationLocationTransition();
                }
              }
              if(snapshot.hasError){
                print('${snapshot.error}');
                return const DestinationLocationTransition();
              }
              // if(snapshot.hasError){
              //   return FutureBuilder(
              //       future: _startnav2(context),
              //       builder: (BuildContext context, AsyncSnapshot snapshot2) {
              //         return const Center(
              //           child: ServerError(),
              //         );
              //       }); 
              // }
              return const LogginIN(value: "Loggin In",);
            case ConnectionState.waiting:
            case ConnectionState.none:
            default:
              return const LogginIN(value: "Loggin In");
          }
        });
  }
}

Future<void> _startnav2(context) async {
  Timer(
      const Duration(seconds: 0),
      () => Navigator.of(context).pushNamedAndRemoveUntil(covidPageRoute, (route) => false)
  );
}