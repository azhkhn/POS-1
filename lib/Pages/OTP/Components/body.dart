import 'package:flutter/material.dart';
import '../../../Constants/global.dart';
import '../../../helpers/user_state.dart';
import '../Widgets/logo.dart';
import '../Widgets/relogin.dart';
import 'otp_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const AppLogo(),
                Text(
                  "Welcome Back : ${loginglobaldata.first.empName}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                UserSimplePreferences.getDashboardDataState() == 'True' 
                    ? const Text(
                        "Please Enter your 4 digit PIN",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    : const Text(
                        "Please Generate your 4 digit PIN",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                const SizedBox(height: 20),
                const OtpForm(),
                
              ],
            ),
          ),
         const Relogin()
        ],
      ),
    );
  }
}