import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/DatabaseModels/beat_plain_data.dart';

class RecyclerViewData extends StatefulWidget {
  const RecyclerViewData({Key? key}) : super(key: key);

  @override
  State<RecyclerViewData> createState() => _RecyclerViewDataState();
}

class _RecyclerViewDataState extends State<RecyclerViewData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 110.0),
      color: Colors.white,
      child: FutureBuilder<List<Job>>(
        future: _fetchJobs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Job>? data = snapshot.data;
            return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return TextButton(
                      onPressed: () {
                        showAlertDialog(BuildContext context) {
                          Widget cancelButton = TextButton(
                            child: const Text("Cancel",
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          );
                          Widget continueButton = TextButton(
                            child: const Text(
                              "Continue",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          );
                          AlertDialog alert = AlertDialog(
                            insetPadding: const EdgeInsets.all(5.0),
                            scrollable: true,
                            content: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      color: Colors.black,
                                      child: const Center(
                                          child: Text(
                                        "Selected Date is : 01/02/23",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0),
                                      ))),
                                  Container(
                                    height: 5.0,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 10.0)),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 380,
                                          child: ListView.builder(
                                              itemCount: 6,
                                              itemBuilder: (context, i) {
                                                return Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              18.0),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                'Dealer Name:'),
                                                            const Text(
                                                                'Electronic Paradise'),
                                                            const Text(''),
                                                            const Text(
                                                                'Address : B1 Janakpuri'),
                                                            const Text(''),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          40.0),
                                                              child: ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: const ButtonStyle(
                                                                      backgroundColor: MaterialStatePropertyAll<
                                                                              Color>(
                                                                          Colors
                                                                              .grey)),
                                                                  child: const Text(
                                                                      'Edit')),
                                                            ),
                                                          ]),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                            'Dealer ID:'),
                                                        const Text('10001'),
                                                        const Text(''),
                                                        const Text(''),
                                                        const Text(''),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 50.0),
                                                          child: ElevatedButton(
                                                              style: const ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStatePropertyAll<
                                                                              Color>(
                                                                          Colors
                                                                              .black)),
                                                              onPressed: () {},
                                                              child: const Text(
                                                                  'Visit')),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 10.0,
                                    color: Colors.white,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {},
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll<
                                                      Color>(Colors.black)),
                                          child: cancelButton),
                                      ElevatedButton(
                                          onPressed: () {},
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll<
                                                      Color>(Colors.black)),
                                          child: continueButton),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
                      child: _tile(data[index].position, data[index].company,
                          Icons.work));
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}

Future<List<Job>> _fetchJobs() async {
  const jobsListAPIUrl = 'https://mock-json-service.glitch.me/';
  final response = await http.get(Uri.parse(jobsListAPIUrl));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => Job.fromJson(job)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}

ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
      title: Container(
        color: Colors.black,
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
