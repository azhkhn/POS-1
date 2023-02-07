
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../../Constants/global.dart';
import '../../helpers/location_setter.dart';

// final captureKey = GlobalKey<ImageVisibiltyState>();
// final trainingKey = GlobalKey<RemarState>();

tooglepanel(DraggableScrollableController sheetcontroller,context) {
  if (sheetcontroller.size == .6) {
    FocusScope.of(context).unfocus();
    sheetcontroller.jumpTo(.1);
  } else if (sheetcontroller.size < .6) {
    Future.delayed(const Duration(milliseconds: 200)).then((value) => null);
    sheetcontroller.jumpTo(.6);
  } else if (sheetcontroller.size > .6) {
    FocusScope.of(context).unfocus();
    Future.delayed(const Duration(seconds: 1 ));
    listeners.panelitem.setcapture = listeners.panelitem.setremark = false;
    sheetcontroller.jumpTo(.1);
  }
}

Future<String> getaddress(context) async {
  List<Placemark> locationAddress;
  // ignore: non_constant_identifier_names
  Placemark? location_address_exact;

  String address = "";

  locationAddress = await placemarkFromCoordinates(
      StateInherited.of(context).locationData!.latitude!,
      StateInherited.of(context).locationData!.longitude!);

  // setState(() {
  location_address_exact = locationAddress.first;
  // });

  print(location_address_exact);
  String? name = location_address_exact.name;
  String? subLocality = location_address_exact.subLocality;
  String? locality = location_address_exact.locality;
  String? administrativeArea = location_address_exact.administrativeArea;
  String? postalCode = location_address_exact.postalCode;
  String? country = location_address_exact.country;
  address =
      "$name, $subLocality, $locality, $administrativeArea $postalCode, $country";

  return address;
}
