import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const MyButton({Key? key,required this.label,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color1 = Color(0xff76A371);
    Color color2 = Color(0xff000000);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color1
        ),
        child: Center(
          child: Text(
            label,
            style:TextStyle(
              color:Colors.white,
              fontWeight: FontWeight.bold
            )
          ),
        ),
      ),
    );
  }
}
