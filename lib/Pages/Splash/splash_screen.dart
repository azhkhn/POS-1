// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import '../../Constants/global.dart';
import '../../Routing/named_routes.dart';
import '../../Services/Database/readlogindata.dart';
import '../../helpers/user_state.dart';
import 'splash_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late Future<bool>? gottoOtp;

  @override
  void initState() {
    super.initState();
    gottoOtp = null;
    refreshNote();
  }

  refreshNote() async {
    loginglobaldata = await readAllLoginData();
    print('loginglobaldata : $loginglobaldata');
    if (UserSimplePreferences.getLoginState() == 'Logged IN' && loginglobaldata.isNotEmpty){
      gottoOtp = Future.delayed(const Duration(seconds: 0), () => true );
      setState(() {
        gottoOtp;
      });
    }
    else {
      gottoOtp = Future.delayed(const Duration(seconds: 0), () => false );
      setState(() {
        gottoOtp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: gottoOtp,
        builder: (BuildContext context,AsyncSnapshot snapshot) {

          switch (snapshot.connectionState) {
            case ConnectionState.done:

              if(snapshot.data == true){
                return FutureBuilder(
                  future: _startWaiting(context),
                  builder: (BuildContext context,AsyncSnapshot snapshot2){
                    switch (snapshot2.connectionState) {

                      case ConnectionState.waiting:
                      case ConnectionState.none:
                      default:
                        return const SplashImage();
                    }
                  }
                );
              }
              if(snapshot.data == false){
                return FutureBuilder(
                  future: _startnav(context),
                  builder: (BuildContext context,AsyncSnapshot snapshot2){
                    switch (snapshot2.connectionState) {

                      case ConnectionState.waiting:
                      case ConnectionState.none:

                      default:
                        return const SplashImage();
                    }
                  }
                );
              }
              return const SplashImage();
              
            case ConnectionState.none:
            case ConnectionState.waiting:
            default:
              return const SplashImage();
          }
        }
      ),
    );
  }
}


Future<void> _startWaiting(context) async {
  Timer(
      const Duration(
        seconds: 0,
      ),
      () => Navigator.of(context).pushReplacementNamed(otpScreenRoute)
  );
}

 Future<void> _startnav(context) async {
  Timer(
      const Duration(seconds: 0),
      () => Navigator.of(context).pushReplacementNamed(authenticationPageRoute)
  );
}