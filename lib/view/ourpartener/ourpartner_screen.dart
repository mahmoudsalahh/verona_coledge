import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verona_colledge/view/news_screen/news_second.dart';
import 'package:verona_colledge/view_model/shared/shared.component/constant.dart';

class OurPartner extends StatefulWidget {
  @override
  State<OurPartner> createState() => _NewsFristState();
}

class _NewsFristState extends State<OurPartner> {
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
            "Our Partner",
            style: GoogleFonts.poppins().copyWith(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 280,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    //spreadRadius: 1,
                    //blurRadius: 0,
                    //offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Orange',
                          style: GoogleFonts.poppins().copyWith(
                              color: Colors.deepOrange,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Digital Center',
                          style: GoogleFonts.poppins().copyWith(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'ODCs',
                        style: GoogleFonts.poppins().copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        'ODC Suports All University',
                        style: GoogleFonts.poppins().copyWith(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        )));
  }
}
