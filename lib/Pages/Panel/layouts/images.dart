import 'package:flutter/material.dart';
import '../../../Constants/global.dart';
import '../Widgets/select_image.dart';

class ImageVisibilty extends StatefulWidget {
  const ImageVisibilty({Key? key, }) : super(key: key);

  @override
  State<ImageVisibilty> createState() => ImageVisibiltyState();
}

class ImageVisibiltyState extends State<ImageVisibilty> {

  @override
  Widget build(BuildContext context) {
    return Visibility(
          visible: listeners.panelitem.getcapture,
          child: const SelectImage(),
        );
      }
}

// class ImageVisibilty extends StatelessWidget {
//   const ImageVisibilty({Key? key}) : super(key: key);

//    @override
//   Widget build(BuildContext context) {
//     bool value2 =  listeners.panelitem.getcapture;
//     return Visibility(
//       key: UniqueKey(),
//           visible: value2,
//           child: const SelectImage(),
//         );
//       }
// }