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
    return TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text("Alert Dialog Box"),
              content: const Text("You have raised a Alert Dialog Box"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Container(
                    color: Colors.green,
                    padding: const EdgeInsets.all(14),
                    child: const Text("okay"),
                  ),
                ),
              ],
            ),
          );
        },
        child: FutureBuilder<List<Job>>(
          future: _fetchJobs(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Job>? data = snapshot.data;
              return _jobsListView(data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
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

Center _jobsListView(data) {
  return Center(
    child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].position, data[index].company, Icons.work);
        }),
  );
}

ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
      title: Center(
        child: Container(
          width: double.infinity,
          color: Colors.purple,
          child: TextButton(
            onPressed: () {},
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
        ),
      ),
    );
