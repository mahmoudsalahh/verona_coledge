import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsScreen extends StatelessWidget {
 // const EventsScreen({Key? key}) : super(key: key);
  var calinderValueController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.deepOrange,
            )),
        title: Text(
          "Events",
          style: GoogleFonts.poppins().copyWith(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: CalendarDatePicker(
        initialDate:  DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
        onDateChanged: (DateTime value) {
          calinderValueController.text = value.toString();
        },
      ),
    );


  }
}
