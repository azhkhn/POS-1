// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class AppSystemManager extends StatefulWidget {
  const AppSystemManager({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<AppSystemManager> createState() => _AppSystemManagerState();
}

class _AppSystemManagerState extends State<AppSystemManager> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
  switch (state) {
    case AppLifecycleState.inactive:
      print('inactive');
      break;
    case AppLifecycleState.paused:
      print('paused');
      break;
    case AppLifecycleState.resumed:
      print('resumed');
      break;
    case AppLifecycleState.detached:
      print('detached');
      break;
    default:
  }
}
  @override
  void didChangeMetrics() {
    print('rotated');
    super.didChangeMetrics();
  }

  @override
  void didHaveMemoryPressure() {
    print('Low memory');
    super.didHaveMemoryPressure();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}