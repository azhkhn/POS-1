import 'package:flutter/material.dart';
import '../../../../Constants/global.dart';
import '../../../../helpers/location_setter.dart';
import '../market_close.dart';

class CustomIconMarketClose extends StatelessWidget {
  const CustomIconMarketClose({Key? key}) : super(key: key);

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
                        builder: (context) => const MarketCloseBox());
                    break;
                  case 'Market Close':
                  default:
                    null;
                }
              },
              child: Column(
                children: [
                  ColorFiltered(
                    colorFilter: (destReach == true || destReach == false) &&
                            (tempnoteresult == 'N' ||
                                tempnoteresult == 'Market Close')
                        ? const ColorFilter.mode(Colors.transparent, BlendMode.hardLight)
                        : const ColorFilter.mode(Color.fromARGB(255, 146, 124, 124), BlendMode.modulate),
                    child: const CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage("assets/market.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Market Close")
                ],
              ),
            );
          });
  }
}
