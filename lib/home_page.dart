import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:laboratory/add_appointment_bar.dart';
import 'package:laboratory/appointment_list.dart';
import 'package:laboratory/button.dart';
import 'package:get/get.dart';
import 'package:laboratory/pages/balance_sheets_page.dart';
import 'package:laboratory/pages/consultations_page.dart';

Color color1 = Color(0xff76A371);
Color color2 = Color(0xff000000);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  DateTime _selectedDate = DateTime.now();
  List<Widget> routes = [HomePage(), ConsultationsPage(), BalanceSheetsPage()];

  var notifyHelper;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width; //get the width of the screen
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _appbar(),
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: color1,
          height: 48,
          items: <Widget>[
            Icon(Icons.timelapse_outlined, size: 25),
            Icon(Icons.list, size: 25),
            Icon(Icons.list_alt_outlined, size: 25),
          ],
          index: pageIndex,
          onTap: (index) => setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => routes[index]),
                );
              })),
      body: Column(
        children: [
          _addAppointment(),
          _addDateBar(),
          Flexible(
            child: ListView(
              children: [
                Appointment(),
                Appointment(),
                Appointment(),
                Appointment(),
              ],
            ),
          )
        ],
      ),
    );
  }

  _appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.logout_outlined,
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

  _addDateBar() {
    return Container(
      margin: EdgeInsets.all(10),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: color1,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        dayTextStyle: GoogleFonts.lato(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
        monthTextStyle: GoogleFonts.lato(
            fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }

  _addAppointment() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMMd().format(DateTime.now()),
                    style: GoogleFonts.lato(fontSize: 22, color: color1)),
                Text(
                  "Today",
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          MyButton(
              label: "+ Appointment",
              onTap: () => Get.to(AddAppointmentPage())),
        ],
      ),
    );
  }
}
