import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color color1 = Color(0xff76A371);
Color color2 = Color(0xff000000);

class PdfViewer extends StatefulWidget {
  const PdfViewer({
    Key? key,
  }) : super(key: key);

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appbar(),
      body: SfPdfViewer.asset(
        'assets/flutter.pdf',
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
