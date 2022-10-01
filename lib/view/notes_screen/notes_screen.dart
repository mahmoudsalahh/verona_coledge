import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verona_colledge/view/add_nots_screen/add_notes_screen.dart';

class NotesScreen extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

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
          "Notes",
          style: GoogleFonts.poppins().copyWith(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

      ),
      body: Center(
        child: Text(
          "There's No Data To Show",
          style: GoogleFonts.poppins().copyWith(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotesScreen(),));
        },
        child: Icon(Icons.add ,color: Colors.black,),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
