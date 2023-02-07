// ignore_for_file: unused_element, avoid_print

import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../../Routing/named_routes.dart';
import '../../Services/Api/covid_form_status.dart';
import '../../Widgets/logging_in.dart';
import '../helpers/user_state.dart';
import 'location_data.dart';


class GetCovidFormTransition extends StatelessWidget {
  const GetCovidFormTransition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: covidfromstatus(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        final data = snapshot.data;
        print('snapahotCovidStatus : $data');

        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasData) {
              if (data['flag'] == 'N') {
                UserSimplePreferences.setisCovidFormChecked(false);
                return FutureBuilder(
                    future: _startnav(context, 0),
                    builder: (BuildContext context, AsyncSnapshot snapshot3) {
                      switch (snapshot3.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                        default:
                          return const LogginIN(value: "Setting Up");
                      }
                    });
              }
              if (data['flag'] == 'Y') {
                UserSimplePreferences.setisCovidFormChecked(true);
                return const DestinationLocationTransition();
                // return FutureBuilder(
                //     future: _startnav2(context, 0),
                //     builder: (BuildContext context, AsyncSnapshot snapshot3) {
                //       switch (snapshot3.connectionState) {
                //         case ConnectionState.none:
                //         case ConnectionState.waiting:
                //         default:
                //           return CupertinoAlertDialog(
                //               title: message != null ? Text(message) : null,
                //               content: imglink != null
                //                   ? Image.network(
                //                       imglink,
                //                       width: 150,
                //                       height: 200,
                //                     )
                //                   : null);
                //       }
                //     });
              }
            }
            if(snapshot.hasError){
              return const DestinationLocationTransition();
              //  return FutureBuilder(
              //       future: _startWaiting(context),
              //       builder: (BuildContext context, AsyncSnapshot snapshot2) {
              //         return const Center(
              //           child: ServerError(),
              //         );
              //       });
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

_startWaiting(context) {
  Timer(
      const Duration(
        seconds: 0,
      ),
      () => Navigator.of(context).pop()
  );
}

Future<void> _startnav(context, int time) async {
  Timer(
      Duration(seconds: time),
      () => Navigator.of(context)
          .pushNamedAndRemoveUntil(covidPageRoute, (route) => false));
}
