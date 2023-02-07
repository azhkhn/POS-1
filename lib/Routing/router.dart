import 'package:flutter/material.dart';
import '../Pages/Report/report.dart';
import '../Pages/Screen4/page4.dart';
import '../Pages/Profile/profile.dart';
import 'named_routes.dart';

// Route<dynamic>? generateRoute(RouteSettings settings) {
//   if (settings.name!.startsWith(routePrefixDeviceSetup)) {
//     final subRoute = settings.name!.substring(routePrefixDeviceSetup.length);
//     return _getPageRoute(SetupFlow(setupPageRoute: subRoute,));
//   } else {
//     switch (settings.name) {
//       case authenticationPageRoute:
//         return _getPageRoute(const AuthProxy());
//       case otpScreenRoute:
//         return _getPageRoute(const OtpScreen());
//       case privacyPageRoute:
//         return _getPageRoute(const PrivacyStatus());
//       case covidPageRoute:
//         return _getPageRoute(const CovidScreen());
//       case launchRoute:
//         return _getPageRoute(const SplashScreen());
//       default:
//         return _getPageRoute(const ResetPassword());
//     }
//   }
// }

Route<dynamic>? onGenerateRoute(RouteSettings settings){
  switch (settings.name) {
    case routeDeviceSetupprofilePageRoute:
      return _getPageRoute(const Profile());
    case routeDeviceSetupreportPageRoute:
      return _getPageRoute(const ReportPage());
    case routeDeviceSetupservicesPageRoute:
      return _getPageRoute(const Page4());
    default:
      return _getPageRoute(const Profile());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}