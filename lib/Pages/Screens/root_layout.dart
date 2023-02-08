// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import '../../Constants/global.dart';
import '../../Constants/style.dart';
import '../../Widgets/BottomBar/Components/button_attendence.dart';
import '../../Widgets/BottomBar/Components/button_logout.dart';
import '../../Routing/named_routes.dart';
import '../../Routing/router.dart';

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
    print("App Name : ${appName}, App Package Name: ${packageName },App Version: ${version}, App build Number: ${buildNumber}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
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

  buildMyNavBar() {
    return Drawer(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: light,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                color: Colors.purple,
                margin: const EdgeInsets.all(0),
                elevation: 6.0,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                  ),
                  child: UserAccountsDrawerHeader(
                      decoration: const BoxDecoration(color: Colors.purple),
                      accountName: Center(
                        child: Column(
                          children: [
                            SizedBox(
                                child: Image.asset('assets/multiplier.png',height: 21.0,)),
                            const SizedBox(height: 15.0),
                            SizedBox(
                                child: Text('USER ID: ${loginglobaldata.first.loginId}')),
                          ],
                        ),
                      ),
                      accountEmail: Center(
                        child: Container(
                            padding: const EdgeInsets.only(left: 1.0),
                            child: Text('Designation: ${dashboardglobaldata
                                .first.designation}')),
                      )),
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
                          elevation: 6.0,
                      child: ButtonAttendence(),
                    ),
                    ),
                    const SizedBox(width: 5.0),
                    Expanded(
                        child: Card(
                          elevation: 6.0,
                      child: TextButton(
                            onPressed: (){
                              setState(() {
                                settitlevalue = reportPageDisplayName;
                              });
                              navigatorKey.currentState!.pushNamedAndRemoveUntil(
                                  reportPageRoute, (route) => false);
                            },
                            child: const Image(
                                image: AssetImage('assets/multiplier.png')),
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
                          elevation: 6.0,
                      child: TextButton(
                            onPressed: () {
                              setState(() {
                                settitlevalue = profilePageDisplayName;
                              });
                              navigatorKey.currentState!.pushNamedAndRemoveUntil(
                                  servicesPageRoute, (route) => false);
                            },
                            child: const Image(
                                image: AssetImage('assets/multiplier.png'))),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    const Expanded(
                        child: Card(
                          elevation: 6.0,
                      child: ButtonLogout()
                    ))
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
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple)
                    ),
                    onPressed: () {},
                      child: FutureBuilder<PackageInfo>(
                        future: PackageInfo.fromPlatform(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.done:
                              return Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  'Version: ${snapshot.data!.version.replaceRange(3, 5, '')}',),
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
