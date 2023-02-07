import 'package:flutter/material.dart';

import '../../Routing/named_routes.dart';
import '../../helpers/internet_handler.dart';
import '../Authentication/authproxy.dart';
import '../OTP/otp.dart';
import '../Privacy/privacy_screen.dart';
import '../CovidForm/covid_form.dart';
import '../Splash/splash_screen.dart';
import 'root_layout.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: launchRoute,
      routes: {
        authenticationPageRoute: (settings) => const InternetConnectionState(child: AuthProxy()),
        otpScreenRoute: (settings) => const InternetConnectionState(child: OtpScreen()),
        routeDeviceSetupStart: (settings) => const InternetConnectionState( 
                        child: SetupFlow(setupPageRoute: routeDeviceSetupprofilePageRoute,)),
        launchRoute: (settings) => const SplashScreen(),
        privacyPageRoute: (settings) => const InternetConnectionState(child: PrivacyStatus()),
        covidPageRoute: (settings) => const InternetConnectionState(child: CovidScreen()),
      },
    );
  }
}
