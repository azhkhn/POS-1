import 'package:flutter/material.dart';
import '../../../Routing/named_routes.dart';
import '../../../Widgets/custom_text.dart';

class Relogin extends StatelessWidget {
  const Relogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 14, 6),
        child: Row(
          children: [
            const FittedBox(
              child: Text(
                "Having trouble to login",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(authenticationPageRoute);
                },
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: const CustomText(
                    text: "Click here to login?",
                    color: Colors.blue,
                    size: 15,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
