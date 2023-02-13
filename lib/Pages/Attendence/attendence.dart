import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import '../../Constants/global.dart';
import '../../Constants/style.dart';
import '../../Routing/named_routes.dart';
import '../../Widgets/BottomBar/Components/button_attendence.dart';
import '../../Widgets/BottomBar/Components/button_logout.dart';
import '../../Widgets/BottomBar/Components/store_visit.dart';
import '../../Widgets/buidnavbar.dart';
import '../../Widgets/custom_waiting_screen.dart';
import '../../helpers/location_setter.dart';
import '../Panel/panel_view.dart';
import 'gmap.dart';
import 'scoped.dart';

class AttendencePage extends StatefulWidget {
  const AttendencePage({Key? key}) : super(key: key);

  @override
  State<AttendencePage> createState() => _AttendencePageState();
}

class _AttendencePageState extends State<AttendencePage> {
  final navigatorKey = GlobalKey<NavigatorState>();

  String _titlevalue = profilePageDisplayName;

  String get gettitlevalue => _titlevalue;

  set settitlevalue(String value) {
    _titlevalue = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                listeners.panelitem.setcapture =
                    listeners.panelitem.setremark = false;
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_circle_left_outlined),
            ),
          ],
          title: const Text("Attendence"),
        ),
        drawer: const BuildNavBar(),
        body: StateInherited.of(context).locationData != null
            ? MapView(destlocation: loc)
            : customcontainer(),
        bottomSheet: const PanelWidget());
  }
}
