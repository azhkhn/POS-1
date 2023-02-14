import 'package:flutter/material.dart';

class OutLetRecyclerView extends StatefulWidget {
  const OutLetRecyclerView({Key? key}) : super(key: key);

  @override
  State<OutLetRecyclerView> createState() => _OutLetRecyclerViewState();
}

class _OutLetRecyclerViewState extends State<OutLetRecyclerView> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.blueGrey,
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  height: 100,
                  width: 200,
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Search',
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15.0)),
                height: 45,
                width: 125,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Submit',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 5.0,
          width: double.infinity,
          color: Colors.white,
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.blueGrey,
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: Checkbox(
                  value: checkBoxValue,
                  activeColor: Colors.black,
                  onChanged: (bool? newValue) {
                    setState(() {
                      checkBoxValue = newValue!;
                    });
                  }),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Dealer Name:'),
                      Text('Electronic'),
                      Text('Paradise'),
                      Text(''),
                      Text('Address: B1 Janakpuri'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [Text('Dealer ID:'), Text('10001')],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
