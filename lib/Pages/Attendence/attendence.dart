import 'package:flutter/material.dart';
import '../../Constants/global.dart';
import '../../Constants/style.dart';
import '../../Routing/named_routes.dart';
import '../../Widgets/BottomBar/Components/button_attendence.dart';
import '../../Widgets/BottomBar/Components/button_logout.dart';
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
          backgroundColor: Colors.purple,
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                listeners.panelitem.setcapture =
                    listeners.panelitem.setremark = false;
                Navigator.pop(context);
              },
              // onDoubleTap: () => Navigator.of(context).pushNamedAndRemoveUntil( routeDeviceSetupStart, (route) => false),
              child: const Icon(Icons.arrow_back_ios),
            ),
          ],
          title: const Text("Attendence"),
        ),
        drawer: buildMyNavBar(),
        body: StateInherited.of(context).locationData != null
            ? MapView(destlocation: loc)
            : customcontainer(),
        bottomSheet: const PanelWidget());
  }

  buildMyNavBar() {
    return Drawer(
      width: 200,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: light,
        ),
        child: Card(
          margin: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.purple,
                ),
                child: UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(color: Colors.purple),
                    currentAccountPicture: Container(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: CircleAvatar(
                            child: Image.asset('assets/multiplier.png'))),
                    accountName: Container(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: const Text('USER ID: 10001')),
                    accountEmail: Container(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: const Text('Designation: ISD'))),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                color: Colors.grey,
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Card(
                      child: TextButton(
                          onPressed: () {}, child: const ButtonAttendence()),
                    )),
                    Expanded(
                        child: Card(
                      child: TextButton(
                          onPressed: () {},
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                settitlevalue = reportPageDisplayName;
                              });
                              navigatorKey.currentState!
                                  .pushNamedAndRemoveUntil(
                                      reportPageRoute, (route) => false);
                            },
                            icon: const Image(
                                image: AssetImage('assets/multiplier.png')),
                          )),
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                color: Colors.grey,
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Card(
                      child: TextButton(
                        onPressed: () {},
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                settitlevalue = profilePageDisplayName;
                              });
                              navigatorKey.currentState!
                                  .pushNamedAndRemoveUntil(
                                      servicesPageRoute, (route) => false);
                            },
                            icon: const Image(
                                image: AssetImage('assets/multiplier.png'))),
                      ),
                    )),
                    Expanded(
                      child: Card(
                        child: TextButton(
                            onPressed: () {}, child: const ButtonLogout()),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 300.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Version 1.0',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
