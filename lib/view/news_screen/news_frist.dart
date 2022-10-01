import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verona_colledge/view/news_screen/news_second.dart';
import 'package:verona_colledge/view_model/shared/shared.component/constant.dart';

class NewsFrist extends StatefulWidget {
  @override
  State<NewsFrist> createState() => _NewsFristState();
}

class _NewsFristState extends State<NewsFrist> {
  //const ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
      SizedBox(
          height: 15,
      ),
      Container(
          child: Text(
            'News',
            style: GoogleFonts.poppins().copyWith(
                color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
          ),
      ),
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
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewsSecond(),));
                },
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(15)),
                    width: 110,
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          color: Colors.white60,
                          width: 1.2,
                          height: 30,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Icon(Icons.copy_all, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
      ),
    ]),
        ));
  }
}
