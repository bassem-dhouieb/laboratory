import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:laboratory/pages/chooser.dart';
import 'package:laboratory/pages/sheet_page.dart';
import 'package:laboratory/widgets/consultation_list_item.dart';
import 'package:laboratory/widgets/sheet_list_item.dart';
import 'package:laboratory/pages/home_page.dart';

Color color1 = Color(0xff76A371);
Color color2 = Color(0xff000000);

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({Key? key}) : super(key: key);

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  int pageIndex = 2;
  DateTime _selectedDate = DateTime.now();
  List<Widget> routes = [HomePage(), SheetPage(), ConsultationPage()];
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var notifyHelper;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width; //get the width of the screen
    double h = MediaQuery.of(context).size.height;
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
      body: ListView.builder(
        itemCount: 9,
        itemBuilder: (context, index) {
          return Consultation();
        },
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
}
