import 'package:flutter/material.dart';

import '../Widgets/remark_box.dart';

class Remar extends StatefulWidget {
  const Remar({Key? key, }) : super(key: key);

  @override
  State<Remar> createState() => RemarState();
}

class RemarState extends State<Remar> {

  bool value1 = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: value1,
      child: const RemarkBox(),
    );
  }
}

// class Remar extends StatelessWidget {
//   const Remar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool value1 = listeners.panelitem.getremark;
//     return Visibility(
//       key: UniqueKey(),
//       visible: value1,
//       child: const RemarkBox(),
//     );
//   }
// }