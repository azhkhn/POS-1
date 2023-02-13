// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import '../../Constants/global.dart';
import '../../Widgets/BottomBar/Components/button_attendence.dart';
import '../../Widgets/BottomBar/Components/button_logout.dart';
import '../../Routing/named_routes.dart';
import '../../Routing/router.dart';
import '../../Widgets/BottomBar/Components/store_visit.dart';

@immutable
class SetupFlow extends StatefulWidget {
  static SetupFlowState of(BuildContext context) {
    return context.findAncestorStateOfType<SetupFlowState>()!;
  }

  const SetupFlow({
    super.key,
    required this.setupPageRoute,
  });

  final String setupPageRoute;

  @override
  SetupFlowState createState() => SetupFlowState();
}

class SetupFlowState extends State<SetupFlow> {
  final navigatorKey = GlobalKey<NavigatorState>();

  String _titlevalue = profilePageDisplayName;

  String get gettitlevalue => _titlevalue;

  set settitlevalue(String value) {
    _titlevalue = value;
  }

  @override
  void didChangeDependencies() {
    gettitlevalue;
    super.didChangeDependencies();
  }

  PackageInfo? packageInfo;
  @override
  void initState() {
    super.initState();
    getPackage();
  }

  void getPackage() async {
    packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo!.appName;
    String packageName = packageInfo!.packageName;
    String version = packageInfo!.version;
    String buildNumber = packageInfo!.buildNumber;
    print("App Name : $appName, App Package Name: $packageName,App Version: $version, App build Number: $buildNumber");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(gettitlevalue),
      ),
      body: Navigator(
        key: navigatorKey,
        initialRoute: widget.setupPageRoute,
        onGenerateRoute: onGenerateRoute,
      ),
      drawer: buildMyNavBar(),
    );
  }

  buildMyNavBar(){
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.white,
              height: 145.0,
              child: DrawerHeader(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'USER ID: ${loginglobaldata.first.loginId}',style: const TextStyle(color: Colors.black)),
                      const SizedBox(height: 15.0,),
                      Text(
                          'Designation: ${dashboardglobaldata.first.designation}',style: const TextStyle(color: Colors.black))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Card(
                      color: Colors.black,
                      elevation: 6.0,
                      child: ButtonAttendence(),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: Card(
                        color: Colors.black,
                        elevation: 6.0,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              settitlevalue = reportPageDisplayName;
                            });
                            navigatorKey.currentState!
                                .pushNamedAndRemoveUntil(
                                reportPageRoute, (route) => false);
                            Navigator.of(context).pop();
                          },
                          child: Column(
                            children: const [
                              Image(
                                  image: AssetImage('assets/reports_drawer.png'),height: 85),
                              Text('Reports',style: TextStyle(color: Colors.white,fontSize: 20.0),)
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.black,
                      elevation: 6.0,
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              settitlevalue = profilePageDisplayName;
                            });
                            navigatorKey.currentState!
                                .pushNamedAndRemoveUntil(
                                servicesPageRoute, (route) => false);
                            Navigator.of(context).pop();
                          },
                          child: Column(
                            children: const [
                              Image(
                                  image: AssetImage('assets/profile_drawer.png'),height: 85),
                              Text('Profile',style: TextStyle(color: Colors.white,fontSize: 20.0))
                            ],
                          )),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  const Expanded(
                    child: Card(
                      color: Colors.black,
                      elevation: 6.0,
                      child: ButtonLogout(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Card(
                      color: Colors.black,
                      elevation: 6.0,
                      child: StoreVisit(),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                      },
                      child: const Image(
                          image: AssetImage('assets/white.png'),
                          height: 120.0),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 160.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.black)),
                  onPressed: () {},
                  child: FutureBuilder<PackageInfo>(
                    future: PackageInfo.fromPlatform(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Version: ${snapshot.data!.version.replaceRange(3, 5, '')}',
                            ),
                          );
                        default:
                          return const SizedBox();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
