
import 'package:flutter/material.dart';

class LogginIN extends StatelessWidget {
  const LogginIN({Key? key, required this.value}) : super(key: key);

  final String value;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:  [
                const SizedBox(height: 20),
                Text(
                  value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
              const CircularProgressIndicator(),
              const SizedBox(height: 32),
              const Text("Please Wait..."),
            ],
          ),
        ),
      ),
    );
  }

}