import 'package:flutter/material.dart';
import 'package:pos/Widgets/outlet_recyclerview.dart';
import '../../../Constants/global.dart';
import '../../../Widgets/buidnavbar.dart';

class OutletBeatPlan extends StatefulWidget {
  const OutletBeatPlan({Key? key}) : super(key: key);

  @override
  State<OutletBeatPlan> createState() => _OutletBeatPlanState();
}

class _OutletBeatPlanState extends State<OutletBeatPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Beat Plan By Outlet'),
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
      body: const OutLetRecyclerView(),
    );
  }
}
