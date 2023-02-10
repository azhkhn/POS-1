import 'package:flutter/material.dart';
import '../../Constants/global.dart';
import '../../Services/Api/attendence_status.dart';
import 'layouts/bar.dart';
import 'layouts/options.dart';
import 'scoped.dart';

class PanelWidget extends StatefulWidget {
  const PanelWidget({Key? key}) : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {

  @override
  void initState() {
    super.initState();
    listeners.panelitem.setcapture = listeners.panelitem.setremark = false;
    getAttendencetoday('false');
    sheetcontroller = DraggableScrollableController();
  }

  @override
  void didChangeDependencies() {
    tempnoteresult;
    sheetcontroller;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    sheetcontroller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        controller: sheetcontroller,
        initialChildSize: .1,
        minChildSize: .1,
        maxChildSize: 1.0,
        snapSizes: const [.6, 1],
        expand: false,
        builder: (context, ScrollController scrollController) =>
         ListView(
              controller: scrollController,
              children: const <Widget>[
                SizedBox(height: 12.0),
                Bar(),
                SizedBox(height: 30),
                Options(),
                SizedBox(height: 10.0),
              ],
            ));
  }
}
