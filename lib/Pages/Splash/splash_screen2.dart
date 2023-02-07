
// import 'dart:async';

// import 'package:flutter/material.dart';

// import '../../Constants/global.dart';
// import '../../Routing/named_routes.dart';
// import '../../Services/Database/readlogindata.dart';
// import '../../Widgets/server_error.dart';
// import '../../model/APISchemas/login_schema.dart';
// import 'splash_image.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<LoginData>>(
//     future: readAllLoginData(),
//     builder: (BuildContext context, AsyncSnapshot<List<LoginData>> snapshot) {
      
//       final data = snapshot.data  ;

//       switch (snapshot.connectionState) {
//         case ConnectionState.done:
//           if (snapshot.hasData) {
//             if (data.isNotEmpty) {
//               return FutureBuilder(
//                   future: _startWaiting(context),
//                   builder: (BuildContext context, AsyncSnapshot snapshot2) {
//                     switch (snapshot2.connectionState) {
//                       case ConnectionState.none:
//                       case ConnectionState.waiting:
//                       default:
//                         return const SplashImage();
//                     }
//                   });
//             }
//             if (data.isEmpty) {
//               return FutureBuilder(
//                   future: _startnav2(context),
//                   builder: (BuildContext context, AsyncSnapshot snapshot2) {
//                     switch (snapshot2.connectionState) {
//                       case ConnectionState.none:
//                       case ConnectionState.waiting:
//                       default:
//                         return const SplashImage();
//                     }
//                   });
//             }
//           }
//           if (snapshot.hasError) {
//             return FutureBuilder(
//                 future: _startnav2(context),
//                 builder: (BuildContext context, AsyncSnapshot snapshot2) {
//                   return const Center(
//                     child: ServerError(),
//                   );
//                 });
//           }
//           return const SplashImage();
//         case ConnectionState.active:
//         case ConnectionState.waiting:
//         case ConnectionState.none:
//         default:
//           return const SplashImage();
//       }
//     });
//   }
// }

// _startWaiting(context) {
//   Timer(
//       const Duration(
//         seconds: 0,
//       ),
//       () => navigatorKeytop.currentState!.pushReplacementNamed(otpScreenRoute)
//   );
// }

// Future<void> _startnav2(context) async {
//   Timer(
//       const Duration(seconds: 0),
//       () => navigatorKeytop.currentState!.pushReplacementNamed(authenticationPageRoute)
//   );
// }
