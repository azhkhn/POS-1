import 'package:flutter/material.dart';
import '../../../Constants/global.dart';
import '../scoped.dart';

// class TrainingBox extends StatefulWidget {
//   const TrainingBox({Key? key}) : super(key: key);

//   @override
//   State<TrainingBox> createState() => _TrainingBoxState();
// }

// class _TrainingBoxState extends State<TrainingBox> {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//         content: const Text('Are you sure you are on Training ?'),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('Yes'),
//             onPressed: () {
//               setState(() {
//                 listeners.panelitem.setcapture = false;
//                 listeners.panelitem.setremark = true;
//               });
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             child: const Text('No'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ); 
//   }
// }

class TrainingBox extends StatelessWidget {
  const TrainingBox({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: const Text('Are you sure you are on Training ?'),
        actions: <Widget>[
          StatefulBuilder(
            builder: (context, setState) => TextButton(
              child: const Text('Yes'),
              onPressed: () {
                setState(() {
                  listeners.panelitem.setcapture = false;
                  listeners.panelitem.setremark = true;
                });
                sheetcontroller.jumpTo(1);
                Navigator.of(context).pop();
              },
            ),
          ),
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ); 
  }
}