
import 'package:flutter/material.dart';

import '../../Constants/global.dart';


class DataView extends StatelessWidget {
  const DataView({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(color: Colors.white),
      itemCount: 1,
      itemBuilder: (BuildContext context, index) {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                  margin: const EdgeInsets.all(0),
                  color: Colors.white,
                  elevation: 6,
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(text: "HELLO!"),
                                    const TextSpan(text: "  "),
                                    TextSpan(
                                        text: loginglobaldata.first.empName,
                                        style: const TextStyle(fontSize: 18))
                                  ]),
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(text: "Designation"),
                                    const TextSpan(text: "    "),
                                    TextSpan(
                                        text: dashboardglobaldata
                                            .first.designation,
                                        style: const TextStyle(fontSize: 15))
                                  ]),
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(text: "EmpId"),
                                    const TextSpan(text: "   "),
                                    TextSpan(
                                        text: loginglobaldata.first.loginId,
                                        style: const TextStyle(fontSize: 15))
                                  ]),
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: "Branch Name"),
                                    TextSpan(text: "    "),
                                    TextSpan(
                                        text: "Delhi",
                                        style: TextStyle(fontSize: 15))
                                  ]),
                            ),
                            const SizedBox(height: 8),
                          ]))),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                  margin: const EdgeInsets.all(0),
                  color: Colors.white,
                  elevation: 6,
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(text: "Dealer Id"),
                                    const TextSpan(text: "   "),
                                    TextSpan(
                                        text: loginglobaldata.first.dealerId,
                                        style: const TextStyle(fontSize: 15))
                                  ]),
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(text: "Dealer Name"),
                                    const TextSpan(text: "        "),
                                    TextSpan(
                                        text: dashboardglobaldata
                                            .first.dealername,
                                        style: const TextStyle(fontSize: 15))
                                  ]),
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(text: "Dealer Address"),
                                    const TextSpan(text: "     "),
                                    TextSpan(
                                        text: dashboardglobaldata
                                            .first.dealeraddress,
                                        style: const TextStyle(fontSize: 15))
                                  ]),
                            ),
                            const SizedBox(height: 8),
                          ]))),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(0),
                color: Colors.white,
                elevation: 6,
                child: Column(
                  children: [
                    Container(
                      height: 80.0,
                      width: double.infinity,
                      padding: const EdgeInsets.all(6.0),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(fontSize: 14.0, color: Colors.black),
                              children: [
                                TextSpan(
                                    text: 'Notice Boards',
                                    style: TextStyle(
                                        fontSize: 18.0, fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                    '\nWelcome back in Promoter Online System\nApplication'),
                              ],
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                  children: [
                    Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(0),
                          color: Colors.black,
                          elevation: 6,
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                                padding: EdgeInsets.zero,
                                child: Column(
                                  children: const [
                                    Image(
                                        image: AssetImage('assets/attendance_blank.png'),height: 85),
                                    Text('Attendance',style: TextStyle(color: Colors.white,fontSize: 20.0),)
                                  ],
                                )),
                          ),
                        ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(0),
                          color: Colors.black,
                          elevation: 6,
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                                padding: EdgeInsets.zero,
                                child: Column(
                                  children: const [
                                    Image(
                                        image: AssetImage('assets/visit.png'),height: 85),
                                    Text('Visit',style: TextStyle(color: Colors.white,fontSize: 20.0))
                                  ],
                                )),
                          ),
                        ),
                    ),
                  ],
                ),
            ),
          ],
        );
      },
    );
  }
}