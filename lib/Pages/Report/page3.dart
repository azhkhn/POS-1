// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key,}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {

  var loadingPercentage = 0;

  final Completer<WebViewController> controller = Completer<WebViewController>();

  late WebViewController _controller;

  @override
  void initState() {
    localcontroller();
    super.initState();
  }

  Future localcontroller() async {
    _controller = await controller.future;
  }

  @override
  void dispose() {
    controller;
    _controller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          onWebViewCreated: (WebViewControllerlocal) {
            controller.complete(WebViewControllerlocal);
          },
          onWebResourceError: (WebViewControllerlocal) {
            controller.completeError;
          },
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl:
              'https://web.multiplier.co.in/ALFFTS/alfftsapp_menuData.action?userid=1001122',
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
            // _controller.runJavascript(
            //   "document.getElementsByClassName('row mt-1 pt-40 justify-content-md-center')",
            // );
            setState(() {
              loadingPercentage = 100;
            });
          },
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
            minHeight: 8,
          ),
      ],
    );
  }
}
