// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';


class InternetConnectionState extends StatefulWidget {
  const InternetConnectionState({Key? key, required this.child}): super(key: key);

  final Widget child;

  @override
  State<InternetConnectionState> createState() =>
      _InternetConnectionStateState();
}

class _InternetConnectionStateState extends State<InternetConnectionState> {

  bool _hasInternet = true;

  late StreamSubscription listener;

  @override
  void initState() {


    check_connection();
    getConnectivity();

    super.initState();
  }

  Future check_connection() async {
    _hasInternet = await InternetConnectionChecker().hasConnection;
    print(' _hasInternet  : $_hasInternet ');
    if(mounted){
      if (_hasInternet == false) {
      setState(() => _hasInternet = false);
      // showDialogBox();
    } else {
      setState(() {
        _hasInternet = true;
      });
    }}
  }

  getConnectivity() {
    listener = Connectivity().onConnectivityChanged.listen(
      (result) async {
        print(' result  : $result ');
        if(mounted){
        result == ConnectivityResult.none 
        ? {setState(() => _hasInternet = false),
          print("after result 1: $_hasInternet",),
          showDialogBox()
          }
        : result == ConnectivityResult.mobile || result == ConnectivityResult.wifi 
            ?{
             setState(() => _hasInternet = true),
              print("after result 2: $_hasInternet"),
             }
            : null;
      }
      },
    );
  }

  // Future CheckUserConnection() async {
  //     try {
  //       final result = await InternetAddress.lookup('google.com');
  //       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //         setState(() {
  //           _hasInternet = true;
  //         });
  //       }
  //     } on SocketException catch (_) {
  //       setState(() {
  //         _hasInternet = false;
  //         showDialogBox();
  //       });
  //     }
  //   }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   listener;
  //   // CheckUserConnection();
  // }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }

  showDialogBox() {
    showCupertinoDialog<String>(
      useRootNavigator: false,
        context: context,
        builder: (context) => CupertinoAlertDialog(
          content: Column(
            children: [
              Lottie.asset(
                'assets/spiral.json',
                width: 50,
                height: 50
              ),
              const Text('Please check your internet connectivity'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                _hasInternet == true ? Navigator.pop(context) : null;
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );}

  @override
  Widget build(BuildContext context) {
    return InternetState(
      internet_connection: _hasInternet,
      child: widget.child,
    );
  }
}

class InternetState extends InheritedWidget {
  const InternetState({Key? key, required Widget child, required this.internet_connection}): super(key: key, child: child);

  final bool internet_connection;

  static InternetState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InternetState>();
  }

  @override
  bool updateShouldNotify(InternetState oldWidget) {
    return oldWidget.internet_connection != internet_connection;
  }
}
