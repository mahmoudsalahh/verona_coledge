import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../view_model/shared/shared.component/component.dart';

class Support extends StatelessWidget {
  //const OurPartner({Key? key}) : super(key: key);
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
          "Support",
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
                  hintText: "Name ",
                  hintStyle: GoogleFonts.poppins().copyWith(
                      fontSize: 18
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Colors.grey,width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.deepOrange,width: 1))
              ),
            ),
            SizedBox(height: 30,),
            TextFormField(
              controller: dateController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "E-Mail ",
                  hintStyle: GoogleFonts.poppins().copyWith(
                      fontSize: 18
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Colors.grey,width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.deepOrange,width: 1))
              ),
            ),
            SizedBox(height: 30,),
            TextFormField(
              controller: notesController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                  border: OutlineInputBorder(),
                  hintText: "What's making you Unhappy ? ",
                  hintStyle: GoogleFonts.poppins().copyWith(
                    fontSize: 18
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Colors.grey,width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.deepOrange,width: 1))
              ),
            ),
            SizedBox(height: 30,),
            Align(
                alignment: AlignmentDirectional.center,
                child: defaultButton(onpressed: (){}, text: 'Submit',background: Colors.deepOrange))
          ],
        ),
      ),
    );
  }
}