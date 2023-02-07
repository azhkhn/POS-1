import 'package:flutter/material.dart';

import '../../../Constants/global.dart';
import '../Widgets/IconsState/attendence.dart';
import '../Widgets/IconsState/holiday.dart';
import '../Widgets/IconsState/leave.dart';
import '../Widgets/IconsState/market_close.dart';
import '../Widgets/IconsState/on_duty.dart';
import '../Widgets/IconsState/training.dart';
import '../Widgets/IconsState/week_off.dart';
import '../Widgets/remark_box.dart';
import '../Widgets/select_image.dart';


class Options extends StatelessWidget{
  const Options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                ImageCapture(),
                CustomIconLeave(),
                CustomIconMarketClose(),
              ],
            ),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // CustomIconTraining(),
                customicontraining(context),
                const CustomIconWeekOff(),
                const CustomIconHoliday(),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                CustomIconOnDuty()
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Visibility(
              visible: listeners.panelitem.getcapture,
              child: const SelectImage(),
            ),
            Visibility(
              visible: listeners.panelitem.getremark,
              child: const RemarkBox(),
            )
          ],
        ),
      ),
    );
  }
}
