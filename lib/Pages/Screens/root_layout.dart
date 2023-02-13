// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import '../../Constants/global.dart';
import '../../Constants/style.dart';
import '../../Widgets/BottomBar/Components/button_attendence.dart';
import '../../Widgets/BottomBar/Components/button_logout.dart';
import '../../Routing/named_routes.dart';
import '../../Routing/router.dart';
import '../../Widgets/BottomBar/Components/store_visit.dart';
import '../../Widgets/buidnavbar.dart';

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
    print(
        "App Name : $appName, App Package Name: $packageName,App Version: $version, App build Number: $buildNumber");
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
      drawer: const BuildNavBar(),
    );
  }
}
