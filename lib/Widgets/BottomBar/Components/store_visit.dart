import 'package:flutter/material.dart';
import 'package:pos/Pages/Storevisit/store_visit.dart';

class StoreVisit extends StatelessWidget {
  const StoreVisit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const StoreVisitData(),
      )),
      child: const Image(image: AssetImage('assets/multiplier.png')),
    );
  }
}
