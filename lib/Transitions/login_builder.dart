import 'dart:async';

import 'package:flutter/material.dart';
import '../../model/APISchemas/login_schema.dart';
import '../Services/API/login.dart';
import '../Widgets/auth_fail.dart';
import '../Widgets/logging_in_center.dart';
import '../Widgets/server_error.dart';
import 'DatabaseCalls/setlogindata.dart';

class LoginTransition extends StatelessWidget {
  const LoginTransition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LoginData>(
    future: authenticateUser(),
    builder: (BuildContext context, AsyncSnapshot<LoginData> snapshot) {

      final data = snapshot.data;

      switch (snapshot.connectionState) {
        case ConnectionState.done:
          if (snapshot.hasData) {
            if (data!.status == 'N') {
              return FutureBuilder(
                  future: _startWaiting(context),
                  builder: (BuildContext context,AsyncSnapshot snapshot2) {

                    switch (snapshot2.connectionState) {
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                      default:
                        return const Center(
                          child: AuthError(),
                        );
                    }
                  }
              );
            }
            if (data.status == 'Y') {
              return SetLoginData(logindata: data);
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

Future<void> _startWaiting(context) async {
  Timer(
      const Duration(seconds: 3),
      () => Navigator.pop(context)
  );
}