import 'package:flutter/material.dart';
import '../../../../Constants/global.dart';
import '../../../../helpers/location_setter.dart';
import '../training_dialog.dart';

// class CustomIconTraining extends StatelessWidget {
//   const CustomIconTraining({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//           valueListenable: StateInherited.of(context).destination_reached,
//           builder: (BuildContext context, bool destReach, Widget? child) {
//             return GestureDetector(
//               onTap: () {
//                 switch (tempnoteresult) {
//                   case 'N':
//                     showDialog(
//                         barrierDismissible: false,
//                         context: context,
//                         builder: (context) => const TrainingBox());
//                     break;
//                   case 'Present':
//                     showDialog(
//                         barrierDismissible: false,
//                         context: context,
//                         builder: (context) => const TrainingBox());
//                     break;
//                   case 'training':
//                   case 'Training':
//                   default:
//                     null;
//                 }
//               },
//               child: Column(
//                 children: [
//                   ColorFiltered(
//                     colorFilter: (destReach == true || destReach == false) &&
//                             (tempnoteresult == 'N' ||
//                                 tempnoteresult == 'Training' || tempnoteresult == 'training' ||
//                                 tempnoteresult == 'Present')
//                         ? const ColorFilter.mode(Colors.transparent, BlendMode.hardLight)
//                         : const ColorFilter.mode(Color.fromARGB(255, 146, 124, 124), BlendMode.modulate),
//                     child: const CircleAvatar(
//                       radius: 25.0,
//                       backgroundImage: AssetImage("assets/training.png"),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Text("Training")
//                 ],
//               ),
//             );
//           });
//   }
// }

Widget customicontraining(context) => ValueListenableBuilder(
          valueListenable: StateInherited.of(context).destination_reached,
          builder: (BuildContext context, bool destReach, Widget? child) {
            return GestureDetector(
              onTap: () {
                switch (tempnoteresult) {
                  case 'N':
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => const TrainingBox());
                    break;
                  case 'Present':
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => const TrainingBox());
                    break;
                  case 'training':
                  default:
                    null;
                }
              },
              child: Column(
                children: [
                  ColorFiltered(
                    colorFilter: (destReach == true || destReach == false) &&
                            (tempnoteresult == 'N' ||
                                tempnoteresult == 'Training' || tempnoteresult == 'training' ||
                                tempnoteresult == 'Present')
                        ? const ColorFilter.mode(Colors.transparent, BlendMode.hardLight)
                        : const ColorFilter.mode(Color.fromARGB(255, 146, 124, 124), BlendMode.modulate),
                    child: const CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage("assets/training.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Training")
                ],
              ),
            );
          });
