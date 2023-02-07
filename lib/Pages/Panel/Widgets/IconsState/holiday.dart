import 'package:flutter/material.dart';
import '../../../../Constants/global.dart';
import '../../../../helpers/location_setter.dart';
import '../holiday.dart';

class CustomIconHoliday extends StatelessWidget {
  const CustomIconHoliday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
          valueListenable: StateInherited.of(context).destination_reached,
          builder: (context, bool destReach, Widget? child) {
            return GestureDetector(
              onTap: () {
                switch (tempnoteresult) {
                  case 'N':
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => const HolidayBox());
                    break;
                  case 'holiday':
                  case 'Holiday':
                  default:
                    null;
                }
              },
              child: Column(
                children: [
                  ColorFiltered(
                    colorFilter: (destReach == true || destReach == false) &&
                            (tempnoteresult == 'N' ||
                                (tempnoteresult == 'holiday' ||
                                    tempnoteresult == 'Holiday'))
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
                  const Text("Holiday")
                ],
              ),
            );
          });
  }
}
