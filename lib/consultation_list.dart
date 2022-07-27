import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

Color color1 = Color(0xff76A371);
Color color2 = Color(0xff000000);

class Consultation extends StatelessWidget {
  const Consultation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.green[100]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Icon(
                Icons.assignment_rounded,
                size: 40,
                color: Colors.black,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Bilan",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                Text(
                  "27/07/2022",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Icon(
                  Icons.arrow_right_outlined,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
