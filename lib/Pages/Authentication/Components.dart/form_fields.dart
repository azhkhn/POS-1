
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Constants/messages.dart';
import '../../../Transitions/login_builder.dart';
import '../../../Widgets/custom_text.dart';
import '../../../helpers/internet_handler.dart';
import '../../../helpers/user_state.dart';
import 'Widgets/forgot_password.dart';

class FormFields extends StatefulWidget {
  const FormFields({Key? key, required this.reset }) : super(key: key);

  final bool reset;

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {

  bool isobscure = true;

  final _formKey = GlobalKey<FormState>();

  final myusernameController = TextEditingController(text: "10002");
  final mypasswordController = TextEditingController(text: "10002@dffts");

  @override
  Widget build(BuildContext context) {
    return Form(
          key: _formKey,
          child: AlertDialog(
            insetPadding: const EdgeInsets.all(10),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: myusernameController,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.account_circle,
                      size: 30,
                      color: Colors.black26,
                    ),
                    labelText: "ID",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                  // onEditingComplete: () async {
                  //   await UserSimplePreferences.setUserName(myusernameController.text);
                  // },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: mypasswordController,
                  obscureText: isobscure,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: isobscure == true
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () => setState(() {
                        isobscure = !isobscure;
                      }),
                    ),
                    icon: const Icon(
                      Icons.lock,
                      size: 30,
                      color: Colors.black26,
                    ),
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  // onEditingComplete: () async {
                  //   await UserSimplePreferences.setUserName(mypasswordController.text);
                  // },
                  // onFieldSubmitted: (value) async {
                  //   await UserSimplePreferences.setUserName(value);
                  // },
                ),
                const SizedBox(height: 15),
                Visibility(
                    visible: widget.reset,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("Cancel")),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                nav();
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar_LoginError);
                              }
                            },
                            child: const Text("Reset"))
                      ],
                    )),
                Visibility(
                    visible: !widget.reset,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              nav();
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar_LoginError);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: InternetState.of(context)
                                            ?.internet_connection ==
                                        true
                                    ? Colors.blue
                                    : Colors.blueGrey,
                                borderRadius: BorderRadius.circular(20)),
                            alignment: Alignment.center,
                            width: 100,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: const CustomText(
                              text: "Login",
                              color: Colors.black,
                              size: 15,
                              weight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const ForgotPass()
                      ],
                    ))
              ],
            ),
          ),
        );
  }

  
  nav() async {
    InternetState.of(context)?.internet_connection == true
        ? {
            await UserSimplePreferences.setUserName(myusernameController.text),
            await UserSimplePreferences.setPassword(mypasswordController.text),
            showCupertinoDialog(
                context: context, builder: (BuildContext context) =>const LoginTransition())
          }
        : ScaffoldMessenger.of(context)
            .showSnackBar(snackBar_nointernetconnection);
  }
}