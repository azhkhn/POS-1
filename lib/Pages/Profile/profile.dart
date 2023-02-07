import 'package:flutter/material.dart';
import '../../Constants/global.dart';
import 'data_view.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
        body: (loginglobaldata.isEmpty || dashboardglobaldata.isEmpty)
            ? Column(
                children: [
                  Text(
                    "No Profile Yet",
                    style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Center(child: CircularProgressIndicator()),
                ],
              )
            : const Padding(
                padding: EdgeInsets.all(12),
                child: DataView()
              ),
      );}
}
