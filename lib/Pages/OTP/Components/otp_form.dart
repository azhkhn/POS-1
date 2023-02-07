// ignore_for_file: non_constant_identifier_names, avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../Constants/global.dart';
import '../../../Constants/messages.dart';
import '../../../Services/Database/readdashboarddata.dart';
import '../../../Transitions/covid_form_tranisition.dart';
import '../../../Transitions/listdashboard.dart';
import '../../../Widgets/custom_text.dart';
import '../../../helpers/internet_handler.dart';
import '../../../helpers/user_state.dart';
import '../Widgets/forgotpin.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key }) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  
  String? otp_value;

  bool saving_otp = false;

  bool isotpvisible = false;

  final _formKeyotp = GlobalKey<FormState>();

  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();

  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    refreshNote();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  refreshNote() async {
    dashboardglobaldata = await readAllDashboardData();
    print('dashboardglobaldata : $dashboardglobaldata');
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin1.dispose();
    pin2.dispose();
    pin3.dispose();
    pin4.dispose();
  }

  void nextField(String value) {
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    if (value.isEmpty) {
      FocusScope.of(context).requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Form(
        key: _formKeyotp,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    controller: pin1,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0))),
                        counterText: '',
                        hintStyle:
                            TextStyle(color: Colors.black, fontSize: 20.0)),
                    onChanged: (value) => nextField(value),
                    style: Theme.of(context).textTheme.titleLarge,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    obscureText: isotpvisible,
                    textAlign: TextAlign.center,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Error!!';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    controller: pin2,
                    focusNode: pin2FocusNode,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0))),
                        counterText: '',
                        hintStyle:
                            TextStyle(color: Colors.black, fontSize: 20.0)),
                    onChanged: (value) => nextField(value),
                    style: Theme.of(context).textTheme.titleLarge,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    obscureText: isotpvisible,
                    textAlign: TextAlign.center,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Error!!';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    controller: pin3,
                    focusNode: pin3FocusNode,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0))),
                        counterText: '',
                        hintStyle:
                            TextStyle(color: Colors.black, fontSize: 20.0)),
                    onChanged: (value) => nextField(value),
                    style: Theme.of(context).textTheme.titleLarge,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    obscureText: isotpvisible,
                    textAlign: TextAlign.center,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Error!!';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    controller: pin4,
                    focusNode: pin4FocusNode,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0))),
                        counterText: '',
                        hintStyle:
                            TextStyle(color: Colors.black, fontSize: 20.0)),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).unfocus();
                      } else {
                        FocusScope.of(context).requestFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.titleLarge,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    obscureText: isotpvisible,
                    textAlign: TextAlign.center,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Error!!';
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                if (_formKeyotp.currentState!.validate()) {
                  setState(() {
                    saving_otp = !saving_otp;
                  });
                  otp_value = pin1.text + pin2.text + pin3.text + pin4.text;
                  gotoprofile2();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar_LoginError);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: (InternetState.of(context)?.internet_connection ==
                                false ||
                            InternetState.of(context)?.internet_connection ==
                                null)
                        ? Colors.blueGrey
                        : Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                width: 140,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const CustomText(
                        text: "Continue",
                        color: Colors.black,
                        size: 15,
                        weight: FontWeight.w400,
                      )
                    
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ForgotPin(),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () => setState(() {
                                    isotpvisible = !isotpvisible;
                                  }),
                              icon: isotpvisible == true
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          const CustomText(
                            text: "Show",
                            color: Colors.blue,
                            size: 20,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
          ],
        ),
      ),
    );
  }

  gotoprofile2() async {
    if (InternetState.of(context)?.internet_connection == null ||
        InternetState.of(context)?.internet_connection == false) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar_nointernetconnection);
    } else {
      if (UserSimplePreferences.getDashboardDataState() != 'True' ) {
        print('dashboarddatastatebeforetrue  ${UserSimplePreferences.getDashboardDataState()}');
        showCupertinoDialog(
                context: context, builder: (BuildContext context) => GetDashboardDataTransition(otp: otp_value!,));
      }
      if (UserSimplePreferences.getDashboardDataState() == 'True' ){
        print('dashboarddatastateaftertrue  ${UserSimplePreferences.getDashboardDataState()}');
        if (otp_value == dashboardglobaldata.first.otp ) {
            if (mounted) {
              showCupertinoDialog(
                context: context, builder: (BuildContext context) =>const GetCovidFormTransition());
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(snackBar_wrongotp);
          }
      }
    }
  }

}
