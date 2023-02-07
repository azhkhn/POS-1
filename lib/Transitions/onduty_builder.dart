import 'dart:async';
import 'package:flutter/material.dart';
import '../../Widgets/auth_fail.dart';
import '../Routing/named_routes.dart';
import '../Services/API/onduty.dart';
import '../Widgets/logging_in.dart';
import '../Widgets/server_error.dart';

class OnDutyTransition extends StatelessWidget {

  const OnDutyTransition({
    Key? key, 
    required this.address, 
    required this.agenda, 
    required this.personcontact, 
    required this.remarks,
    required this.sendercontact,
    required this.sendername
    }) : super(key: key);

    final String address;
    final String agenda;
    final String personcontact;
    final String remarks;
    final String sendercontact;
    final String sendername;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    future: saveOnDuty(address, agenda, personcontact, remarks, sendercontact, sendername, context),
    builder: (BuildContext context, AsyncSnapshot snapshot) {

      final data = snapshot.data;

      switch (snapshot.connectionState) {
        case ConnectionState.done:
          if (snapshot.hasData) {
            if (data['msg'] == 'fail' || data['msg'] == 'Fail') {
              return FutureBuilder(
                  future: _startWaiting(context),
                  builder: (context, snapshot2) {
                    return const Center(
                      child: AuthError()
                    );
                  });
            }
            if (data['msg'] == 'Success') {
              return FutureBuilder(
                future: _startnav(context),
                builder: (context,snapshot2) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.active:
                    case ConnectionState.none:
                    case ConnectionState.done:
                    case ConnectionState.waiting:
                    default:
                      return const LogginIN(value: "Saving Attendence",);
                  }
                }
              );
            }
          }
          if(snapshot.hasError){
            return FutureBuilder(
              future: _startWaiting(context),
              builder: (context, snapshot2) {
                return const Center(
                  child: ServerError(),
                );
            });
          }
          return const LogginIN(value: "Saving Attendence",);
        case ConnectionState.waiting:
        case ConnectionState.active:
        default: 
          return const LogginIN(value: "Saving Attendence",);
      }
    });
  }
}

_startWaiting(context) {
  Timer(
      const Duration(
        seconds: 3,
      ),
      () => Navigator.of(context).pop());
}

Future<void>_startnav(context) async {
  Timer(
      const Duration(seconds: 0),
      () => Navigator.of(context).pushNamedAndRemoveUntil(routeDeviceSetupStart , (route) => false)
  );
}
