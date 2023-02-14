import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class OutLetBeatPlanNavBar extends StatefulWidget {
  const OutLetBeatPlanNavBar({Key? key}) : super(key: key);
  @override
  State<OutLetBeatPlanNavBar> createState() => _OutLetBeatPlanNavBarState();
}

class _OutLetBeatPlanNavBarState extends State<OutLetBeatPlanNavBar> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: TextButton(
                      onPressed: () {},
                      child: const TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "dd/mm/yyyy",
                            hintStyle: TextStyle(color: Colors.white)),
                      ))),
              label: ""),
          BottomNavigationBarItem(
              icon: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: TextButton(
                      onPressed: () {
                        showAlertDialog(BuildContext context) {
                          Widget cancelButton = TextButton(
                            child: const Text("CANCEL"),
                            onPressed: () {},
                          );
                          Widget continueButton = TextButton(
                            child: const Text("OK"),
                            onPressed: () {},
                          );
                          var alert = AlertDialog(
                            title: TableCalendar(
                              focusedDay: DateTime.now(),
                              firstDay: DateTime(DateTime.now().year - 1),
                              lastDay: DateTime(DateTime.now().year + 1),
                            ),
                            actions: [
                              cancelButton,
                              continueButton,
                            ],
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        }

                        showAlertDialog(context);
                      },
                      child: const Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ))),
              label: ""),
          BottomNavigationBarItem(
              icon: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ))),
              label: ""),
        ],
        currentIndex: index,
        onTap: (int i) {
          setState(() {
            index = i;
          });
        },
        fixedColor: Colors.white,
      ),
    );
  }
}
