
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:laboratory/button.dart';
import 'package:laboratory/input_field.dart';
Color color1 = Color(0xff76A371);
Color color2 = Color(0xff000000);

class AddAppointmentPage extends StatefulWidget {
  const AddAppointmentPage({Key? key}) : super(key: key);

  @override
  State<AddAppointmentPage> createState() => _AddAppointmentPageState();
}

class _AddAppointmentPageState extends State<AddAppointmentPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  List<bool> isSelected = [for (var i = 0; i < 40; i++) false];
  int _selectedReminder=5;
  List<int> reminderList=[5,10,15,20];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appbar(),
      body: Container(
        padding: const EdgeInsets.only(left: 20 , right:20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Take an Appointment",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: color1
              ),
              ),
              MyInputField(title: "Name", hint: "Entre your name",controller: _nameController,),
              MyInputField(title: "Note", hint: "Entre your note",controller: _noteController,),
              MyInputField(title: "Date", hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(onPressed: (){
                  _getDateFromUser();
                }, icon: Icon(Icons.calendar_month_outlined,color: Colors.grey,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text("Time",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: color1
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(top:5),
                child: ToggleButtons(children: [
                  for( var i = 0 ; i <600; i+=15 ) Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(DateFormat('HH:mm').format(DateTime(2022,1,1,8).add(Duration(minutes: i))),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,

                        ),
                      ),
                    ),
                  ),

                ],
                  onPressed: (int newIndex) {
                      setState(() {
                      for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                      if (buttonIndex == newIndex) {
                      isSelected[buttonIndex] = !isSelected[buttonIndex];
                      } else {
                      isSelected[buttonIndex] = false;
                      }
                      }
                      });
                      },

                  selectedColor: Colors.white,
                  fillColor: color1,
                  color: color1,
                  borderColor: color1,
                  borderRadius: BorderRadius.circular(25),
                  isSelected: isSelected,
                ),
              ),
              MyInputField(title: "Reminder", hint: "$_selectedReminder minutes early",
              widget: DropdownButton(
                icon: Icon(Icons.keyboard_arrow_down,
                color: color1,),
                iconSize: 32,
                underline: Container(height: 0,),
                elevation: 4,
                items: reminderList.map<DropdownMenuItem<String>>((int value){
                  return DropdownMenuItem<String>(
                    child: Text(value.toString()),value: value.toString(),);
              }).toList(), onChanged: (String? newValue) {
                  setState(() {
                    _selectedReminder = int.parse(newValue!);
                  });
              },
              ),
              ),
              Container(child: MyButton(label: "Done", onTap: ()=>_validateDate()),
              margin: EdgeInsets.only(top: 5),
                alignment: Alignment.topRight,

              )

            ],
          ),
        ),
      ),
    );
  }

  _validateDate(){
    if(_nameController.text.isNotEmpty &&_noteController.text.isNotEmpty){
      //add to database
      Get.back();
    }else if(_nameController.text.isEmpty||_noteController.text.isEmpty){
      Get.snackbar("Required", "All fields are required !",
      snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        icon:Icon(Icons.warning_amber_rounded)

      );
    }
  }

  _appbar(){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios_new,
          size: 20,color: color1,),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.white38,
          radius: 21,
          backgroundImage: AssetImage(
              "img/profile.png"
          ),
        ),
      ],
    );
  }

  _getDateFromUser() async{
    DateTime? _pickerDate = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015), lastDate: DateTime(2121));

    if(_pickerDate!=null){

      setState(() {
        _selectedDate = _pickerDate;
      });
    }else{
      print("it's null or something is wrong");
    }

  }
}
