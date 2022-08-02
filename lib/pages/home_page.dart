import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:laboratory/pages/add_appointment_bar.dart';
import 'package:laboratory/pages/chooser.dart';
import 'package:laboratory/pages/consultation_page.dart';
import 'package:laboratory/widgets/appointment_list_item.dart';
import 'package:laboratory/widgets/button.dart';
import 'package:get/get.dart';
import 'package:laboratory/pages/sheet_page.dart';

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
  List<Widget> routes = [HomePage(), SheetPage(), ConsultationPage()];
  bool all = true;
  Color backgroundColor = color1;
  Color textColor = Colors.white;
  Color dateBackgroundColor = color1;
  Color dateTextColor = Colors.white;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var notifyHelper;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width; //get the width of the screen
    double h = MediaQuery.of(context).size.height;
    dateBackgroundColor = all ? Colors.white : color1;
    dateTextColor = all ? Colors.grey : Colors.white;
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
              ),
              accountEmail: Text('bassemdwb@gmail.com'),
              accountName: Text(
                'Bassem dhouieb',
                style: TextStyle(fontSize: 24.0),
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(165, 214, 167, 1),
              ),
            ),
            ListTile(
              title: const Text('Change '),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const ChooserPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => routes[index],
                  ),
                );
              })),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
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
      ),
    );
  }

  _appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.logout_outlined,
          size: 20,
          color: color1,
        ),
        onPressed: () {},
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            onTap: () {
              scaffoldKey.currentState?.openEndDrawer();
            },
            child: Icon(
              Icons.menu,
              size: 20,
              color: color1,
            ),
          ),
        ),
      ],
    );
  }

  _addDateBar() {
    return Container(
      margin: EdgeInsets.all(10),
      child: DatePicker(
        DateTime.now(),
        daysCount: 30,
        height: 100,
        width: 80,
        initialSelectedDate: _selectedDate,
        selectionColor: dateBackgroundColor,
        selectedTextColor: all ? Colors.black : Colors.white,
        dateTextStyle: GoogleFonts.lato(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        dayTextStyle: GoogleFonts.lato(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
        monthTextStyle: GoogleFonts.lato(
            fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        onDateChange: (date) {
          setState(() {
            _selectedDate = date;
            all = false;
            backgroundColor = Colors.white;
            textColor = color1;
            dateBackgroundColor = color1;
            dateTextColor = Colors.white;
          });
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
          GestureDetector(
            onTap: () {
              setState(() {
                all = !all;
                backgroundColor = all ? color1 : Colors.white;
                textColor = all ? Colors.white : color1;
                dateBackgroundColor = Colors.white;
                dateTextColor = Colors.grey;
              });
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: color1, width: 1.0),
                  color: backgroundColor),
              child: Center(
                child: Text("All",
                    style: TextStyle(
                        color: textColor, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          MyButton(
            label: "+ Appointment",
            onTap: () => Get.to(AddAppointmentPage()),
            width: 120,
          ),
        ],
      ),
    );
  }
}
