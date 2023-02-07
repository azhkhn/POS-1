// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:gmap_latlng_demo/Routing/named_routes.dart';

// import '../../../Services/Database/readlogindata.dart';
// import '../../../Widgets/logging_in.dart';
// import '../../../Widgets/server_error.dart';
// import '../../../model/APISchemas/login_schema.dart';


// Widget userdata() => FutureBuilder<List<LoginData>>(
//     future: readAllLoginData(),
//     builder: (BuildContext context, AsyncSnapshot<List<LoginData>> snapshot) {
//       final data = snapshot.data;
//       print('snapshotNote : $data');

//       switch (snapshot.connectionState) {
//         case ConnectionState.done:
//           if (snapshot.hasData) {
//             if (data!.isNotEmpty) {
//               return FutureBuilder(
//                   future: _startnav2(context),
//                   builder: (BuildContext context, AsyncSnapshot snapshot2) {
//                     switch (snapshot2.connectionState) {
//                       case ConnectionState.none:
//                       case ConnectionState.waiting:
//                       default:
//                         return const LogginIN(value: "Setting Up");
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
//                         return const LogginIN(value: "Setting Up");
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
//           return const LogginIN(value: "Setting Up");
//         case ConnectionState.waiting:
//         case ConnectionState.none:
//         default:
//           return const LogginIN(value: "Setting Up");
//       }
//     });

// Future<void> _startnav2(context) async {
//   Timer(
//       const Duration(seconds: 0),
//       () => Navigator.of(context)
//           .pushNamedAndRemoveUntil(rootRoute, (route) => false));
// }
