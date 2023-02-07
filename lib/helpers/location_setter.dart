// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../Constants/global.dart';


class StateWidget extends StatefulWidget {
  const StateWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {

  Location location = Location();
// LocationAccuracy _locationAccuracy = LocationAccuracy.high;

  LocationData? _locationData;

  StreamSubscription<LocationData>? _getPositionSubscription;
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;

  @override
  void initState() {
  
    permissions();
    getloc();
    subscription();
    super.initState();
  }

  Future<void> permissions() async {
    _serviceEnabled = await location.serviceEnabled();
    if (_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<void> getloc() async {
    _locationData = await location.getLocation();
    setState(() {
      _locationData;
    });
    }

  subscription() {
    _getPositionSubscription =
        location.onLocationChanged.listen((LocationData currentLocation) async {
      setState(() {
        _locationData = currentLocation;
      });
    });
  }

  @override
  void didChangeDependencies() {
    listeners.destination_reached;
    _getPositionSubscription;
    _locationData;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _stopListen();
    super.dispose();
  }

  Future<void> _stopListen() async {
    await _getPositionSubscription?.cancel();
    _getPositionSubscription = null;
  }

  @override
  Widget build(BuildContext context) => StateInherited(
        destination_reached: listeners.destination_reached,
        locationData: _locationData,
        child: widget.child,
      );
}

class StateInherited extends InheritedWidget {

  const StateInherited({
    Key? key,
    required Widget child,
    required this.locationData,
    required this.destination_reached,
  }) : super(key: key, child: child);


  final ValueNotifier<bool> destination_reached;
  final LocationData? locationData;

  static StateInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StateInherited>()!;
  }

  @override
  bool updateShouldNotify(StateInherited oldWidget) {
    return oldWidget.destination_reached != destination_reached;
  }
}
