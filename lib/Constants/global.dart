// ignore_for_file: non_constant_identifier_names

import 'package:pos/model/APISchemas/device_detail.dart';

import '../helpers/listeners.dart';
import '../model/APISchemas/dashboard.dart';
import '../model/APISchemas/login_schema.dart';

List<DashBoard> dashboardglobaldata = [];
List<LoginData> loginglobaldata = [];
List<DeviceData> deviceglobaldata = [];

Listeners listeners = Listeners();

String? tempnoteresult;
String? mimg;
String? eimg;
String? mtime;
String? etime;