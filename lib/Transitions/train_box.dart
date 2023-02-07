// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/cupertino.dart';
import '../../Routing/named_routes.dart';
import '../../Services/API/traindata.dart';
import '../../Widgets/server_error.dart';
import '../../model/APISchemas/trrain.dart';
import '../Services/API/imagelink.dart';
import '../Widgets/logging_in.dart';

class TrainTransition extends StatelessWidget {
  const TrainTransition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TrainDetail>(
        future: gettraindata(),
        builder: (BuildContext context, AsyncSnapshot<TrainDetail> snapshot) {

          print('snapshot : ${snapshot.data}');
          final trainDetail = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (trainDetail!.status == 'N' || trainDetail.status == 'n') {
                  return FutureBuilder(
                      future: _startnav2(context, 0),
                      builder: (BuildContext context, AsyncSnapshot snapshot2) {
                        switch (snapshot2.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                          default:
                            return const LogginIN(value: "Setting Up");
                        }
                      });
                }
                if (trainDetail.status == 'Y' || trainDetail.status == 'y') {
                  return FutureBuilder(
                      future: getimage(trainDetail.imglink!),
                      builder: (BuildContext context, AsyncSnapshot snapshot2) {

                        final data = snapshot2.data;
                        print('snapshot2 : ${snapshot2.data}');

                        switch (snapshot2.connectionState) {
                          case ConnectionState.done:
                            if (snapshot.hasData) {
                              if (data!['status'] == 'N') {
                                return FutureBuilder(
                                    future: _startnav2(context, 3),
                                    builder: (BuildContext context,AsyncSnapshot snapshot2) {
                                      switch (snapshot2.connectionState) {
                                        case ConnectionState.none:
                                        case ConnectionState.waiting:
                                        default:
                                          return CupertinoAlertDialog(
                                                        title: trainDetail.message != null ? Text(trainDetail.message!): null);
                                      }
                                    });
                              }
                              if (data['msg'] == 'Success') {
                                return FutureBuilder(
                                    future: _startnav2(context, 3),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot2) {
                                      switch (snapshot2.connectionState) {
                                        case ConnectionState.none:
                                        case ConnectionState.waiting:
                                        default:
                                           return CupertinoAlertDialog(
                                                        title: trainDetail.message != null ? Text(trainDetail.message!) : null,
                                                        content: trainDetail.imglink != null
                                                            ? Image.network(
                                                                trainDetail.imglink!,
                                                                width: 150,
                                                                height: 200,
                                                              )
                                                            : null);
                                      }
                                    });
                              }
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
              if (snapshot.hasError) {
                return FutureBuilder(
                    future: _startnav2(context,0),
                    builder: (BuildContext context, AsyncSnapshot snapshot2) {
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

Future<void> _startnav2(context, int time) async {
  Timer(
      Duration(seconds: time),
      () => Navigator.of(context)
          .pushNamedAndRemoveUntil(routeDeviceSetupStart, (route) => false));
}
