import 'package:flutter/material.dart';

Widget customcontainer() => Card(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(height: 20),
                Text(
                  'Getting location ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                CircularProgressIndicator(),
                SizedBox(height: 32),
              ],
            ),
          ),
        ]),
      );