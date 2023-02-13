// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import '../../Constants/global.dart';
import '../../Constants/style.dart';
import '../../Routing/named_routes.dart';
import '../../Widgets/BottomBar/Components/button_attendence.dart';
import '../../Widgets/BottomBar/Components/button_logout.dart';
import '../../Widgets/BottomBar/Components/store_visit.dart';
import '../../Widgets/buidnavbar.dart';
import '../../Widgets/recycler_view.dart';

class BeatPlan extends StatefulWidget {
  const BeatPlan({Key? key}) : super(key: key);

  @override
  State<BeatPlan> createState() => _BeatPlanState();
}

class _BeatPlanState extends State<BeatPlan> {
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
        title: const Text('View Beat Plan With Date'),
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
      ),
      drawer: const BuildNavBar(),
      body: const Center(child: RecyclerViewData()),
    );
  }
}
