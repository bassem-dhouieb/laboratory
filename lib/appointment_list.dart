import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

Color color1 = Color(0xff76A371);
Color color2 = Color(0xff000000);

class Appointment extends StatelessWidget {
  const Appointment({Key? key}) : super(key: key);

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
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 15, top: 15),
                  child: Icon(
                    Icons.access_time,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "08:00",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Bassem dhouieb",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                Text(
                  "Bassem dhouieb",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
