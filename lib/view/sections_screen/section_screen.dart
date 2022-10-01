import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verona_colledge/models/lectures_model.dart';
import 'package:verona_colledge/models/section_model.dart';
import 'package:verona_colledge/view_model/shared/cubit/cubit.dart';
import 'package:verona_colledge/view_model/shared/cubit/states.dart';
import 'package:verona_colledge/view_model/shared/section_cubit/section_states.dart';
import 'package:verona_colledge/view_model/shared/shared.component/component.dart';

import '../../view_model/shared/section_cubit/section_cubit.dart';

class SectionScreen extends StatelessWidget {
  // const LectureScreen({Key? key}) : super(key: key);
//Widget indecator()=> Center(child: CircularProgressIndicator());
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SectionCubit,SectionStates>(
      listener: (context,state){
        // if(state is GetSectionDataSuccessState){
        //   SectionCubit.get(context).getSectionData();
        // }else{
        //   indecator();
        // }
      },
      builder: (context,state){
        //AppCubit appCubit =AppCubit();
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
              "Sections",
              style: GoogleFonts.poppins().copyWith(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            actions: [
              PopupMenuButton<int>(
                itemBuilder: (context) => [
                  // popupmenu item 1
                  PopupMenuItem(
                    value: 1,
                    // row has two child icon and text.
                    child: Text("All Sections"),
                  ),
                  PopupMenuItem(
                    value: 2,
                    // row has two child icon and text
                    child: Text("Finished Sections"),
                  ),
                  PopupMenuItem(
                    value: 2,
                    // row has two child icon and text
                    child: Text("Remaining Sections"),
                  ),
                ],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.filter_alt_rounded,
                    color: Colors.deepOrange,
                    size: 30,
                  ),
                ),
                offset: Offset(0, 10),
                color: Colors.white,
                elevation: 2,
              ),
            ],
          ),
          body: ConditionalBuilder(
            condition: state is GetSectionDataSuccessState ,
            builder: (context)=> Padding(
              padding:  EdgeInsets.all(20.0),
              child: ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>sectionData(SectionCubit.get(context).sectionModel!.data![index]),
                itemCount:SectionCubit.get(context).sectionModel!.data!.length,
                separatorBuilder: (context, index) =>Divider(),
              ),
            ),
            fallback:(context)=>Center(child: CircularProgressIndicator()) ,

          ),
        );
      },
    );
  }
  Widget sectionData(DataModel model){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3, // changes position of shadow
              ),
            ]),
        padding: EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '${model.sectionSubject}',
                  style: GoogleFonts.poppins().copyWith(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Icon(
                  Icons.access_alarm,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '${model.sectionDate}',
                  style: GoogleFonts.poppins().copyWith(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 50,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lecture Day',
                        style: GoogleFonts.poppins().copyWith(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_month),
                          Text(
                            '${model.sectionDate}',
                            style: GoogleFonts.poppins().copyWith(
                                color: Colors.black, fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Time',
                        style: GoogleFonts.poppins().copyWith(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            height: 27,
                            'assets/icons/time.svg',
                            color: Colors.lightGreen,
                            // theme: SvgTheme(
                            //     fontSize: 23,
                            //     currentColor: Colors.deepOrange,
                            //     xHeight: 1.5),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            '${model.sectionStartTime}',
                            style: GoogleFonts.poppins().copyWith(
                                color: Colors.black, fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Time',
                        style: GoogleFonts.poppins().copyWith(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            height: 27,
                            'assets/icons/time.svg',
                            color: Colors.deepOrange,
                            // theme: SvgTheme(
                            //     fontSize: 23,
                            //     currentColor: Colors.deepOrange,
                            //     xHeight: 1.5),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            '${model.sectionEndTime}',
                            style: GoogleFonts.poppins().copyWith(
                                color: Colors.black, fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
