import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:laboratory/home_page.dart';
import 'package:laboratory/pages/consultations_page.dart';

Color color1 = Color(0xff76A371);
Color color2 = Color(0xff000000);

class BalanceSheetsPage extends StatefulWidget {
  const BalanceSheetsPage({Key? key}) : super(key: key);

  @override
  State<BalanceSheetsPage> createState() => _BalanceSheetsPageState();
}

class _BalanceSheetsPageState extends State<BalanceSheetsPage> {
  int pageIndex = 2;
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
        children: [Text("balance")],
      ),
    );
  }
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
