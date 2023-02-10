import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/DatabaseModels/beat_plain_data.dart';

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
