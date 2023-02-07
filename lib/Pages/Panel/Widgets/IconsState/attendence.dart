import 'package:flutter/material.dart';
import '../../../../Constants/global.dart';
import '../../../../Constants/messages.dart';
import '../../../../helpers/location_setter.dart';
import '../../scoped.dart';


class ImageCapture extends StatefulWidget {
  const ImageCapture({Key? key}) : super(key: key);

  @override
  State<ImageCapture> createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: StateInherited.of(context).destination_reached,
        builder: (context, bool destReach, Widget? child) {
          return GestureDetector(
            onTap: () {
              if((tempnoteresult == 'N' || tempnoteresult == 'Present') && destReach == true /* && destReach == true */){
                setState(() {
                  listeners.panelitem.setremark = false;
                  listeners.panelitem.setcapture = true;
                });
                sheetcontroller.jumpTo(1);
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: Column(
              children: [
                ColorFiltered(
                  colorFilter: destReach == true &&
                          (tempnoteresult == 'N' || tempnoteresult == 'Present')
                      ? const ColorFilter.mode(Colors.transparent, BlendMode.hardLight)
                      : const ColorFilter.mode(Color.fromARGB(255, 146, 124, 124), BlendMode.modulate),
                  child: const CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage("assets/immigration.png"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Attendence")
              ],
            ),
          );
        });
  }
}
