import 'package:flutter/material.dart';
import '../../../../Constants/global.dart';
import '../../../../helpers/location_setter.dart';
import '../OnDuty/on_duty_box.dart';

class CustomIconOnDuty extends StatelessWidget {
  const CustomIconOnDuty({Key? key}) : super(key: key);

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
                          barrierDismissible: true,
                          context: context,
                          builder: (context) => const OnDutyBox());
                      break;
                    case 'Present':
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => const OnDutyBox());
                      break;
                    default:
                      null;
                  }
                },
                child: Column(
                  children: [
                    ColorFiltered(
                      colorFilter: (destReach == true || destReach == false) &&
                              (tempnoteresult == 'N' ||
                                  tempnoteresult == 'D' ||
                                  tempnoteresult == 'Present')
                          ? const ColorFilter.mode(Colors.transparent, BlendMode.hardLight)
                          : const ColorFilter.mode(Color.fromARGB(255, 146, 124, 124), BlendMode.modulate),
                      child: const CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage("assets/workplace.png"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("On Duty")
                  ],
                ),
              );
            },
          );
  }
}
