import 'package:flutter/material.dart';
import 'package:pos/Pages/Storevisit/options.dart';
import '../../Constants/global.dart';
import '../../Routing/named_routes.dart';
import '../../Widgets/buidnavbar.dart';

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
          title: const Text("Manage Beat Plan"),
        ),
        drawer: const BuildNavBar(),
        body: const Center(child: Options()));
  }
}
