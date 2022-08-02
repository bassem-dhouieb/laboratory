import 'package:laboratory/pages/pdf_viewer.dart';
import 'package:laboratory/widgets/button.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color color1 = Color(0xff76A371);
Color color2 = Color(0xff000000);

class SheetDetails extends StatefulWidget {
  const SheetDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<SheetDetails> createState() => _SheetDetailsState();
}

class _SheetDetailsState extends State<SheetDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Bilan 1",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: color1),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15),
            child: Row(
              children: [
                Text(
                  "Name :",
                  style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold, color: color1),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Bassem dhouieb",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15),
            child: Row(
              children: [
                Text(
                  "Birthday :",
                  style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold, color: color1),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "23/03/1999",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15),
            child: Text(
              "Description :",
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: color1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 15),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0, left: 15),
            child: Align(
              alignment: Alignment.topRight,
              child: MyButton(
                  label: "Pdf",
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PdfViewer())),
                  width: 120),
            ),
          )
        ]),
      ),
    );
  }

  _appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 20,
          color: color1,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.white38,
          radius: 21,
          backgroundImage: AssetImage("img/profile.png"),
        ),
      ],
    );
  }
}
