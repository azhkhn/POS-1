// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'beat_plan.dart';

class Options extends StatefulWidget {
  const Options({Key? key}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 6.0,
                child: TextButton(
                  onPressed: () {},
                  child: const Image(
                    image: AssetImage('assets/multiplier.png'),
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              Card(
                elevation: 6.0,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BeatPlan()));
                  },
                  child: const Image(
                    image: AssetImage('assets/multiplier.png'),
                  ),
                ),
              ),
              const SizedBox(height: 65.0),
              SizedBox(
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(''),
                      Text(
                        'Important Note :-',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        'Your total number of visits for today is ${1}, Please complete',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        'your today visit.',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(''),
                    ],
                  ),
                ),
              )
            ],
          ),
        ]);
  }
}
