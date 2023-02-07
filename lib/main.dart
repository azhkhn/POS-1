// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Pages/Screens/myapp.dart';
import 'helpers/appstatemanager.dart';
import 'helpers/internet_handler.dart';
import 'helpers/location_setter.dart';
import 'helpers/user_state.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

  HttpOverrides.global = MyHttpOverrides();

  await UserSimplePreferences.initState();

  runApp(
    const AppSystemManager(
      child: InternetConnectionState(
        child: StateWidget(
          child: MyApp()
        ),
      ),
    ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}