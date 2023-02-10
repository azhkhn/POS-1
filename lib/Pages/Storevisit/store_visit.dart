import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:pos/Pages/Storevisit/options.dart';
import '../../Constants/global.dart';
import '../../Constants/style.dart';
import '../../Routing/named_routes.dart';
import '../../Widgets/BottomBar/Components/button_attendence.dart';
import '../../Widgets/BottomBar/Components/button_logout.dart';
import '../../Widgets/BottomBar/Components/store_visit.dart';
import '../../Widgets/custom_waiting_screen.dart';
import '../../helpers/location_setter.dart';

class StoreVisitData extends StatefulWidget {
  const StoreVisitData({Key? key}) : super(key: key);

  @override
  State<StoreVisitData> createState() => _StoreVisitDataState();
}

class _StoreVisitDataState extends State<StoreVisitData> {
  final navigatorKey = GlobalKey<NavigatorState>();

  String _titlevalue = profilePageDisplayName;

  String get gettitlevalue => _titlevalue;

  set settitlevalue(String value) {
    _titlevalue = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
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
              child: const Icon(Icons.arrow_circle_left_outlined),
            ),
          ],
          title: const Text("Manage Beat Plan"),
        ),
        drawer: buildMyNavBar(),
        body: StateInherited.of(context).locationData != null
            ? const Center(child: Options())
            : customcontainer());
  }

  buildMyNavBar() {
    return Drawer(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: light,
        ),
        child: SingleChildScrollView(
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
                                child: Image.asset(
                                  'assets/multiplier.png',
                                  height: 21.0,
                                )),
                            const SizedBox(height: 15.0),
                            SizedBox(
                                child: Text(
                                    'USER ID: ${loginglobaldata.first.loginId}')),
                          ],
                        ),
                      ),
                      accountEmail: Center(
                        child: Container(
                            padding: const EdgeInsets.only(left: 1.0),
                            child: Text(
                                'Designation: ${dashboardglobaldata.first.designation}')),
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
                            onPressed: () {
                              setState(() {
                                settitlevalue = reportPageDisplayName;
                              });
                              navigatorKey.currentState!
                                  .pushNamedAndRemoveUntil(
                                  reportPageRoute, (route) => false);
                              Navigator.of(context).pop();
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
                              navigatorKey.currentState!
                                  .pushNamedAndRemoveUntil(
                                  servicesPageRoute, (route) => false);
                              Navigator.of(context).pop();
                            },
                            child: const Image(
                                image: AssetImage('assets/multiplier.png'))),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    const Expanded(
                      child: Card(
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
                height: 80.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.purple)),
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
      ),
    );
  }
}