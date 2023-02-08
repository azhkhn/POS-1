import 'package:flutter/material.dart';
import 'package:app_version/app_version.dart';
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
              DrawerHeader(
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
              const SizedBox(
                height: 10.0,
              ),
              Container(
                color: Colors.grey,
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Expanded(
                        child: Card(
                      child: ButtonAttendence(),
                    )),
                    Expanded(
                        child: Card(
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
                    const Expanded(
                        child: Card(
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
                    onPressed: () {},
                    child: const Center(
                      child: AppVersion(),
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
