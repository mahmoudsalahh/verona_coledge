import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verona_colledge/view/fqa_screen/fqa_screen.dart';
import 'package:verona_colledge/view/login/login_screen.dart';
import 'package:verona_colledge/view/ourpartener/ourpartner_screen.dart';
import 'package:verona_colledge/view/terms_screen/terms_screen.dart';
import 'package:verona_colledge/view_model/shared/cubit/cubit.dart';
import 'package:verona_colledge/view_model/shared/shared.component/component.dart';

import '../../view_model/shared/cubit/states.dart';
import '../support_screen/support_screen.dart';


class Settings extends StatelessWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext contxet, state) {},
        builder: (BuildContext contxet, state) {
          return Scaffold(
              appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Text(
              'Setting',
              style: GoogleFonts.poppins().copyWith(
                color:Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.bold
              ),
              ),
              centerTitle: true,
              ),
              body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FQAScreen(),));
                  },
                  child: ListTile(
                    title: Text(
                      'FQA',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TermsScreen(),));
                  },
                  child: ListTile(
                    title: Text(
                      'Terms & Condition',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OurPartner(),));

                  },
                  child: ListTile(
                    title: Text(
                      'Our parteners',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Support(),));

                  },
                  child: ListTile(
                    title: Text(
                      'Support',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Logout',style: GoogleFonts.poppins(),),
                          content: Container(
                            height: 100,
                            width: 450,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text('Are you Sure ?',style: GoogleFonts.poppins()),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                     Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom( side: BorderSide(color: Colors.deepOrange,width: 5),),
                                        onPressed: (){
                                        }
                                        , child:Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        child: Text('Cancel',
                                          style : GoogleFonts.poppins ( fontSize: 15.0,
                                              fontWeight: FontWeight.w500,color: Colors.deepOrange),
                                        ),
                                      ),
                                      ),
                                    ),
                                   Spacer(),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.deepOrange,
                                        ),
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        child: MaterialButton(
                                      onPressed: (){
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                                      },
                                      child:Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    )]
                                      ),
                              ],
                            ),
                                ),
                            ));
                  },
                  child: ListTile(
                    title: Text(
                      'Logout',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
          ));
        });
  }
}
