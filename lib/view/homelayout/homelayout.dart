import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:verona_colledge/view_model/shared/cubit/cubit.dart';

import '../../view_model/shared/cubit/states.dart';


class LayoutScreen extends StatelessWidget {
  //const LayoutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener:(BuildContext contxet ,state){} ,
        builder:(BuildContext contxet ,state){
          AppCubit cubit = AppCubit.get(context);
            return Scaffold(
              body: cubit.screen[cubit.currentIndex],

              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GNav(
                  selectedIndex: cubit.currentIndex,
                    onTabChange: (index){
                      cubit.changeItem(index);
                    },
                    // haptic: true, // haptic f// eedback
                    //tabBorderRadius: 15,
                    //tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
                    //tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
                   // tabShadow: [BoxShadow(color: Colors.deepOrange.withOpacity(0.5), blurRadius: 8)], // tab button shadow
                    //curve: Curves.easeOutExpo, // tab animation curves
                    duration: Duration(milliseconds: 600), // tab animation duration
                    gap: 8, // the tab button gap between icon and text
                    color: Colors.grey[800], // unselected icon color
                    activeColor: Colors.deepOrange, // selected icon and text color
                    iconSize: 24, // tab button icon size
                    tabBackgroundColor: Colors.grey.withOpacity(0.2), // selected tab background color
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // navigation bar padding
                    tabs: cubit.items!
                ),
              )

            );} ,

    );
  }
}
