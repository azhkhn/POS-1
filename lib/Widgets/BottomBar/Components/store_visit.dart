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
      child: Column(
        children: const [
          Image(image: AssetImage('assets/visit_drawer.png')),
          Text('Store Visit',style: TextStyle(color: Colors.white,fontSize: 20.0))
        ],
      ),
    );
  }
}
