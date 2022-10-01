import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verona_colledge/view/finals_screen/finals_screen.dart';
import 'package:verona_colledge/view/lectures/lecture_screen.dart';
import 'package:verona_colledge/view/midterm_screen/midterm_screen.dart';
import 'package:verona_colledge/view/notes_screen/notes_screen.dart';
import 'package:verona_colledge/view/sections_screen/section_screen.dart';
import 'package:verona_colledge/view_model/shared/cubit/cubit.dart';
import 'package:verona_colledge/view_model/shared/section_cubit/section_cubit.dart';

import '../../view_model/shared/cubit/states.dart';
import '../../view_model/shared/shared.component/component.dart';
import '../events_screen/events_screen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext contxet, state) {},
        builder: (BuildContext contxet, state) {
          AppCubit appCubit =AppCubit();
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 40,
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
                Expanded(
                  child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 10.0,
                      physics: BouncingScrollPhysics(),
                      children: [
                        InkWell(
                          onTap: (){
                            //appCubit.getLectureData();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LectureScreen()));
                          },
                          child: defaultCard(
                              image: 'assets/icons/lecture.svg',
                              text: 'Lecteres'),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SectionScreen()));
                            },
                          child: defaultCard(
                              image: 'assets/icons/sections.svg',
                              text: ''
                                  'sections'),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MidTermScreen()));

                          },
                          child: defaultCard(
                              image: 'assets/icons/midterm.svg',
                              text: 'Midterm'),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>FinalsScreen()));

                          },
                          child: defaultCard(
                              image: 'assets/icons/final.svg',
                              text: 'Final'),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EventsScreen()));
                          },
                          child: defaultCard(
                              image: 'assets/icons/event.svg',
                              text: 'Event'),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>NotesScreen()));
                          },
                          child: defaultCard(
                              image: 'assets/icons/notes.svg',
                              text: 'Notes'),
                        )
                      ]),
                ),
              ],
            ),
          );
        });
  }
}
