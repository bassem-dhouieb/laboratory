import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laboratory/pages/home_page.dart';
import 'package:laboratory/widgets/button.dart';
import 'package:laboratory/widgets/input_field.dart';
import 'package:laboratory/widgets/sheet_list_item.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ChooserPage extends StatefulWidget {
  const ChooserPage({Key? key}) : super(key: key);

  @override
  State<ChooserPage> createState() => _ChooserPageState();
}

class _ChooserPageState extends State<ChooserPage> {
  Color color1 = Color(0xff76A371);
  var labels = ['Laboratory', 'Radiology', 'Doctor'];
  int? initialIndex = 0;
  String option = '';

  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset("img/doctor.png"),
          ),
          SizedBox(
            height: 10,
          ),
          ToggleSwitch(
            borderColor: [color1],
            borderWidth: 1,
            initialLabelIndex: initialIndex,
            minWidth: 120.0,
            minHeight: 50.0,
            fontSize: 16.0,
            activeBgColor: [color1],
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.white,
            inactiveFgColor: color1,
            totalSwitches: 3,
            labels: ['Laboratory', 'Radiology', 'Doctor'],
            onToggle: (index) {
              setState(() {
                initialIndex = index;
                option = labels[index!];
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MyInputField(
              title: "Your $option",
              hint: "choose your $option",
              widget: DropdownButton(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: color1,
                ),
                iconSize: 32,
                underline: Container(
                  height: 0,
                ),
                elevation: 4,
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MyButton(
              label: "Done",
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const HomePage(),
                  ),
                );
              },
              width: 200),
        ]),
      ),
    );
  }
}
