import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../Constants/constants.dart';
import '../../Constants/global.dart';
import '../../Widgets/custom_waiting_screen.dart';
import '../../helpers/location_setter.dart';
import '../../model/APISchemas/location.dart';
import '../Pages/Attendence/scoped.dart';

class SmallMap extends StatefulWidget {
  const SmallMap({Key? key, required this.destlocation}) : super(key: key);
  final LocationDataDestination? destlocation;
  @override
  State<SmallMap> createState() => _SmallMapState();
}
class _SmallMapState extends State<SmallMap> {
  final Completer<GoogleMapController> _controller = Completer();
  LocationData? _currentPosition;
  String? _address,_dateTime;
  late List<Marker> _updatedpos = [];
  @override
  void didChangeDependencies() {
    refreshlocation();
    _destination(
        LatLng(StateInherited.of(context).locationData!.latitude!,
            StateInherited.of(context).locationData!.longitude!),
        destination_latlng,
        diamemter_km);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller;
    _updatedpos;
    super.dispose();
  }

  void refreshlocation() {
    _updatedpos = [];
    _updatedpos.add(Marker(
        markerId: MarkerId(StateInherited.of(context).locationData.toString()),
        position: LatLng(StateInherited.of(context).locationData!.latitude!,
            StateInherited.of(context).locationData!.longitude!),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)));
  }

  @override
  Widget build(BuildContext context) {
    return (widget.destlocation != null || widget.destlocation?.status != 'N')
        ? Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.blueGrey
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 20.0),
        child: SafeArea(
          child: Container(
            color: Colors.blueGrey.withOpacity(.8),
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    height:  MediaQuery.of(context).size.height/2.5,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                              StateInherited.of(context).locationData!.latitude!,
                              StateInherited.of(context).locationData!.longitude!),
                          zoom: 16),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      markers: Set.from(_updatedpos),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  if (_dateTime != null)
                    Text(
                      "Date/Time: $_dateTime",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),

                  const SizedBox(
                    height: 3,
                  ),
                  if (_currentPosition != null)
                    Text(
                      "Latitude: ${_currentPosition!.latitude}, Longitude: ${_currentPosition!.longitude}",
                      style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  const SizedBox(
                    height: 3,
                  ),
                  if (_address != null)
                    Text(
                      "Address: $_address",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  const SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    )
        : customcontainer();
  }

  _destination(LatLng dragEndPosition, LatLng kLake, km) {
    km = km / 1000;
    var ky = 40000 / 360;
    var kx = math.cos(math.pi * kLake.latitude / 180.0) * ky;
    var dx = (kLake.longitude - dragEndPosition.longitude) * kx;
    var dy = (kLake.latitude - dragEndPosition.latitude) * ky;
    setState(() {
      math.sqrt(dx * dx + dy * dy) <= km
          ? {
        listeners.setlisteners = ValueNotifier(true),
      }
          : {
        listeners.setlisteners = ValueNotifier(false),
      };
    });
  }
}