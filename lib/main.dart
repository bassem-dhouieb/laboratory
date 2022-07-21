import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laboratory/add_appointment_bar.dart';
import 'package:laboratory/home_page.dart';
import 'package:laboratory/login_page.dart';

void main() {
  runApp(const MyApp());
}

Color color1 = Color(0xff76A371);


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Laboratory',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: color1
      ),
      home: LoginPage(),
    );
  }
}

