import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../Constants/constants.dart';
import '../../Constants/global.dart';
import '../../Widgets/custom_waiting_screen.dart';
import '../../helpers/location_setter.dart';
import '../../model/APISchemas/location.dart';
import 'scoped.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key, required this.destlocation}) : super(key: key);

  final LocationDataDestination? destlocation;

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer();

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
        ? Column(children: [
            const Divider(
              height: 2,
              color: Colors.black,
              thickness: 5,
            ),
            Expanded(
              flex: 2,
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
                circles: {
                  Circle(
                    zIndex: 0,
                    circleId: const CircleId('currentCircle'),
                    center: LatLng(double.parse(widget.destlocation!.latitude!),double.parse(widget.destlocation!.longitude!)),
                    radius: 100,
                    fillColor: Colors.red.shade100.withOpacity(0.7),
                    strokeColor: Colors.blue.shade100.withOpacity(0.4),
                    strokeWidth: 4,
                  ),
                },
                markers: Set.from(_updatedpos),
              ),
            ),
            const Divider(
              height: 2,
              color: Colors.black,
              thickness: 5,
            ),
          ])
        : customcontainer();
  }

  _destination(LatLng dragEndPosition, LatLng kLake, km) {
    km = km / 1000;
    var ky = 40000 / 360;
    var kx = math.cos(math.pi * kLake.latitude / 180.0) * ky;
    var dx = (kLake.longitude - dragEndPosition.longitude) * kx;
    // dx < 0 ? (-1)*dx : dx;
    var dy = (kLake.latitude - dragEndPosition.latitude) * ky;
    // dy < 0 ? (-1)*dy : dy;

    setState(() {
      math.sqrt(dx * dx + dy * dy) <= km
          ? {
              listeners.setlisteners = ValueNotifier(true),
            }
          : {
              listeners.setlisteners = ValueNotifier(false),
            };
    });
    // return math.sqrt(dx * dx + dy * dy) <= km;
  }
}
