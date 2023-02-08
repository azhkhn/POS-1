// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../Transitions/privacy_set_status_state.dart';
import '../../Widgets/custom_text.dart';

class PrivacyForm extends StatefulWidget {
  const PrivacyForm({Key? key}) : super(key: key);

  @override
  State<PrivacyForm> createState() => _PrivacyFormState();
}

class _PrivacyFormState extends State<PrivacyForm> {
  var loadingPercentage = 0;

  final Completer<WebViewController> controller2 =
      Completer<WebViewController>();

  bool isagreed = false;

  @override
  void initState() {
    controller2;
    super.initState();
  }

  @override
  void dispose() {
    controller2;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
            minHeight: 8,
          ),
        WebView(
          zoomEnabled: true,
          onWebViewCreated: (WebViewControllerlocal) {
            controller2.complete(WebViewControllerlocal);
          },
          onWebResourceError: (WebViewControllerlocal) {
            controller2.completeError;
          },
          initialUrl:
              'https://web.multiplier.co.in/policy/privacy-policy-alffts.html',
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
        ),
        CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text("Accept"),
            value: isagreed,
            onChanged: (newvalue) {
              setState(() {
                isagreed = newvalue!;
              });
            },
            secondary: isagreed == true
                ? GestureDetector(
                    onTap: () {
                      showCupertinoDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const PrivacyStateTransitoin());
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.fromLTRB(25, 6, 25, 6),
                        child: const CustomText(
                          text: "Next",
                          color: Colors.black,
                          size: 20,
                          weight: FontWeight.w400,
                        )),
                  )
                : null)
      ],
    );
  }
}
