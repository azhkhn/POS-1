import 'package:flutter/material.dart';

class OutLetRecyclerView extends StatefulWidget {
  const OutLetRecyclerView({Key? key}) : super(key: key);

  @override
  State<OutLetRecyclerView> createState() => _OutLetRecyclerViewState();
}

class _OutLetRecyclerViewState extends State<OutLetRecyclerView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: SizedBox(
                height: 150,
                width: 190,
                child: TextField(
                  decoration: InputDecoration(labelText: 'Search'),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20.0)
              ),
              height: 50,
              width: 100,
              child: TextButton(
                onPressed: () {},
                child: const Text('Submit',
                    style: TextStyle(color: Colors.white, fontSize: 20.0)),
              ),
            ),
          ],
        ));
  }
}
