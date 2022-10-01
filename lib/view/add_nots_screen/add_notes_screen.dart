import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verona_colledge/view_model/shared/shared.component/component.dart';

class AddNotesScreen extends StatelessWidget {
 // const AddNotesScreen({Key? key}) : super(key: key);
var titleController = TextEditingController();
var dateController = TextEditingController();
var notesController = TextEditingController();

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
          "Add Notes",
          style: GoogleFonts.poppins().copyWith(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           TextFormField(
             controller: titleController,
             decoration: InputDecoration(
               labelText: "Title",
                 labelStyle: TextStyle(color: Colors.black),
                 border: OutlineInputBorder(),
               enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                   borderSide: BorderSide(color: Colors.green,width: 1)),
                 focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                     borderSide: BorderSide(color: Colors.red,width: 1))
             ),
           ),
           SizedBox(height: 30,),
           TextFormField(
             controller: dateController,
             decoration: InputDecoration(
                 labelText: "Date",
                 border: OutlineInputBorder(),
                 labelStyle: TextStyle(color: Colors.black),
                 enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                     borderSide: BorderSide(color: Colors.green,width: 1)),
                 focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                     borderSide: BorderSide(color: Colors.red,width: 1))
             ),
           ),
           SizedBox(height: 30,),
           TextFormField(
             controller: notesController,
             decoration: InputDecoration(
                 contentPadding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                 labelText: "Note",
                 labelStyle: TextStyle(color: Colors.black),
                 border: OutlineInputBorder(),
                 enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                     borderSide: BorderSide(color: Colors.green,width: 1)),
                 focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                     borderSide: BorderSide(color: Colors.red,width: 1))
             ),
           ),
           SizedBox(height: 30,),
           Align(
             alignment: AlignmentDirectional.center,
               child: defaultButton(onpressed: (){}, text: 'Add',background: Colors.blueGrey))
         ],
        ),
      ),

    );
  }
}
