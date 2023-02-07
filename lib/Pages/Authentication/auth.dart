import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Components.dart/form_fields.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key, required this.reset}) : super(key: key);

  final bool reset;

   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MediaQuery.removeViewInsets(
        context: context,
        removeBottom: reset == true ? false : true,
        child: FormFields(reset: reset)
      ),
    );
  }
}