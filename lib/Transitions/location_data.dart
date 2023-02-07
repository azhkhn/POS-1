
// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Services/Api/location.dart';
import '../../Widgets/logging_in.dart';
import '../../model/APISchemas/location.dart';
import '../Pages/Attendence/scoped.dart';
import 'train_box.dart';


class DestinationLocationTransition extends StatelessWidget {
  const DestinationLocationTransition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LocationDataDestination>(
        future: targetdest(),
        builder: (BuildContext context, AsyncSnapshot<LocationDataDestination> snapshot) {
          loc = snapshot.data;
          print('snapshotdestinationlocation : $loc');

          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (loc!.status == 'N') {
                  return const TrainTransition();
                }
                if (loc!.status == 'Y') {
                  destination_latlng = LatLng(double.parse(loc!.latitude!),double.parse(loc!.longitude!));
                  return const TrainTransition();
                }
              }
              if (snapshot.hasError) {
                loc = null;
                return const TrainTransition();
                // return FutureBuilder(
                //     future: _startnav2(context),
                //     builder: (BuildContext context, AsyncSnapshot snapshot2) {
                //       return const Center(
                //         child: ServerError(),
                //       );
                //     });
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