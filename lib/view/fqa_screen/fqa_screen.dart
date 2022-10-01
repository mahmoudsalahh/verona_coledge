import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class FQAScreen extends StatelessWidget {
  const FQAScreen({Key? key}) : super(key: key);

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
            "FQA",
            style: GoogleFonts.poppins().copyWith(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ExpansionWidget(
            initiallyExpanded: true,
            titleBuilder:
                (double animationValue, _, bool isExpaned, toogleFunction) {
              return InkWell(
                  onTap: () => toogleFunction(animated: true),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8, right: 8, top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              'Q1 : How many Countries Orange Digital canter is in ?',
                              style: GoogleFonts.poppins().copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 15
                              ),
                            )),
                            Transform.rotate(
                              angle: math.pi * animationValue / 1,
                              child: Icon(Icons.arrow_drop_down, size: 40),
                              alignment: Alignment.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
            },
            content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      '16 Country',
                      style: GoogleFonts.poppins().copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17
                      ),
                    ),
                  ),
                )),
          ),
        ));
  }
}
