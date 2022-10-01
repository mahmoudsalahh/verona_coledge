import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verona_colledge/view_model/shared/shared.component/constant.dart';

class NewsSecond extends StatefulWidget {
  @override
  State<NewsSecond> createState() => _NewsSecondState();
}

class _NewsSecondState extends State<NewsSecond> {
  //const ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white38,
          height: double.infinity,
          //decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                child: Stack(
                    children: [
                      Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              }, icon: Icon(Icons.arrow_back_ios,color: Colors.deepOrange,)
                            ),
                          )),
                      SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Image(image: AssetImage('assets/images/logo.png'),)),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
              ),
               SizedBox(height: 15,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('ODCs',
                        style: GoogleFonts.poppins().
                        copyWith(
                            color: Colors.black,
                            wordSpacing: 1.3,
                            fontSize: 23,
                            fontWeight: FontWeight.bold
                        ),),

              Text('6/7/2022',
                      style: GoogleFonts.poppins().
                      copyWith(
                          color: Colors.deepOrange,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                      ),),
                   ],
                 ),
               ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Text('ODC supports All Universites',
                style: GoogleFonts.poppins().
                copyWith(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),),),

            ],
          ),
        ),
      ),
    );
  }
}
