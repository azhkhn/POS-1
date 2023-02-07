import 'package:flutter/material.dart';
import '../../../../Constants/global.dart';
import '../../../../helpers/location_setter.dart';
import '../weekoffbox.dart';


class CustomIconWeekOff extends StatelessWidget {
  const CustomIconWeekOff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
          valueListenable: StateInherited.of(context).destination_reached,
          builder: (BuildContext context, bool destReach, Widget? child) {
            return GestureDetector(
              onTap: () {
                switch (tempnoteresult) {
                  case 'N':
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => const WeekOff());
                    break;
                  case 'Weekoff':
                  default:
                    null;
                }
              },
              child: Column(
                children: [
                  ColorFiltered(
                    colorFilter: (destReach == true || destReach == false) &&
                            (tempnoteresult == 'N' ||
                                tempnoteresult == 'Weekoff')
                        ? const ColorFilter.mode(Colors.transparent, BlendMode.hardLight)
                        : const ColorFilter.mode(Color.fromARGB(255, 146, 124, 124), BlendMode.modulate),
                    child: const CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage("assets/Leave.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Week Off")
                ],
              ),
            );
          });
  }
}
