import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color color1 = Color(0xff76A371);
Color color2 = Color(0xff000000);

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const MyInputField({Key? key,required this.title,required this.hint, this.controller, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: color1
          ),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.only(top:8),
            padding: EdgeInsets.only(left:14),
            decoration: BoxDecoration(
              border: Border.all(
                color: color1,
                width: 1.0
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(child:
                  TextFormField(
                    readOnly: widget==null?false:true,
                    autofocus:false,
                    cursorColor: Colors.grey,
                    controller: controller,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                    ),
                      decoration: InputDecoration(
                        hintText: hint,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color:Colors.white,
                            width: 0
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color:Colors.white,
                              width: 0
                          ),
                        ),
                      )
                  )
                  ,),
                widget==null?Container():Container(
                  child: widget,
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
