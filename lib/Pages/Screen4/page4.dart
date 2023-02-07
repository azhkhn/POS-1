// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:async';
import 'package:flutter/material.dart';

import '../../Services/API/page4.dart';
import '../../Widgets/auth_fail.dart';
import '../../Widgets/logging_in.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key,}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {

  var valueprofile;

  @override
  void initState() {
    valueprofile = page4();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
      future: valueprofile,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
    
        final data = snapshot.data;
        print('snapshot : $data');
    
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasData) {
              if (data['status'] == 'N') {
                return FutureBuilder(
                    future: _startWaiting(context),
                    builder: (BuildContext context,AsyncSnapshot snapshot2) {
                      return const Center(
                        child: AuthError(),
                      );
                    });
              }
              if (data['status'] == 'Y') {
                return Text("$data");
              }
            }
            if(snapshot.hasError){
              return Text('${snapshot.error}');  //"Your Email and Password is Wrong"
            }
            return const LogginIN(value: "Loading",);
          case ConnectionState.waiting:
          case ConnectionState.none:
          default: 
            return const LinearProgressIndicator();
        }
      }),
    );
  }

  _startWaiting(context) {
  Timer(
      const Duration(
        seconds: 3,
      ),
      () => Navigator.of(context).pop());
}
}


//  Future<void>_startnav(context) async {
//   Timer(
//       const Duration(seconds: 0),
//       () => Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => const OtpScreen()),
//   ));
// }
