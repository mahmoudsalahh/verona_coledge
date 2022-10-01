import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:verona_colledge/view/homelayout/homelayout.dart';
import 'package:verona_colledge/view/login/login_screen.dart';
import 'package:verona_colledge/view_model/shared/register_cubit/cubit.dart';
import 'package:verona_colledge/view_model/shared/register_cubit/states.dart';

import '../../view_model/shared/shared.component/component.dart';
import '../homescreen/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //const LoginScreen({Key? key}) : super(key: key);
  Icon suffix = Icon(Icons.remove_red_eye,color: Colors.deepOrange,);

  var formkey = GlobalKey<FormState>();

  var emailcontroler = TextEditingController();

  var passwordcontroler = TextEditingController();

  var confirmPasswordcontroler =TextEditingController();

  var namecontroler = TextEditingController();

  var phonecontroler = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var gendercontroler = TextEditingController();

  var universitycontroler = TextEditingController();

  var gradecontroler = TextEditingController();

  List<String> genderItems =['m' ,'f'];

  String genderSelectedItem = 'm';

  List<String> universityItems =['AUC' ,'Cairo','MTI' , 'AIN SHAMS','BUE'];

  String universitySelectedItem = 'AUC';

  List<String> gradeItems =['Grade1','Grade2','Grade3','Grade4','Grade5','Grade6'];

  String gradeSelectedItem = 'Grade1';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit ,RegisterStates>(
        listener: (context ,state){
          if(state is RegisterSuccessStates){

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LayoutScreen(),));
          }
        },
        builder: (context ,state){
          RegisterCubit registerCubit =RegisterCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Orange',
                              style: GoogleFonts.poppins().
                              copyWith(
                                  color: Colors.deepOrange,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold
                              ),),
                            SizedBox(width: 4,),
                            Text('Digital Center',
                              style: GoogleFonts.poppins().
                              copyWith(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold
                              ),)
                          ],
                        ),
                      ),
                      SizedBox(height: 70,),
                      Text('Sign Up',
                        style: GoogleFonts.poppins().
                        copyWith(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(
                        height: 30.0,
                      ),
                      defaulttextformfeild(
                          controller: namecontroler,
                          type: TextInputType.emailAddress,
                          label: 'Name',
                          prefix: Icons.email,
                          validate: (value){
                            if(value!.isEmpty)
                            {
                              return 'This Feild is Empty';
                            }
                            return null;
                          }
                      ),
                      SizedBox(height: 15,),
                      defaulttextformfeild(
                          controller: emailcontroler,
                          type: TextInputType.emailAddress,
                          label: 'Email',
                          prefix: Icons.email,
                          validate: (value){
                            if(value!.isEmpty)
                            {
                              return 'This Feild is Empty';
                            }
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        controller: passwordcontroler,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Colors.deepOrange,
                              width: 2.0,
                            ),
                          ),
                          labelText: 'Password',labelStyle: TextStyle(color:Colors.grey),
                          floatingLabelStyle: TextStyle(color:Colors.deepOrange),
                          prefixIcon: Icon(Icons.lock,color: Colors.deepOrange),
                          suffixIcon: suffix,
                          //suffixIconColor: Colors.deepOrange,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'password is Empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        controller: confirmPasswordcontroler,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Colors.deepOrange,
                              width: 2.0,
                            ),
                          ),
                          labelText: 'Confirm Password',labelStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.lock,color: Colors.deepOrange),
                          floatingLabelStyle: TextStyle(color:Colors.deepOrange),
                          suffixIcon: suffix,
                          //suffixIconColor: Colors.deepOrange,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'password is Empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15,),
                      defaulttextformfeild(
                          controller: phonecontroler,
                          type: TextInputType.emailAddress,
                          label: 'Phone Number',
                          prefix: Icons.email,
                          validate: (value){
                            if(value!.isEmpty)
                            {
                              return 'this Field is Empty';
                            }
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            Row(

                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Gender',
                                      style: GoogleFonts.poppins().
                                      copyWith(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    //Future.delayed(Duration(milliseconds: 30)),
                                    DropdownButton(
                                      // Initial Value
                                      borderRadius: BorderRadius.circular(10),
                                      value: genderSelectedItem,
                                      // Down Arrow Icon
                                      //icon: const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: genderItems.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        setState((){
                                          genderSelectedItem = newValue!;
                                          gendercontroler.text =genderSelectedItem;
                                        });



                                      },
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('University',
                                      style: GoogleFonts.poppins().
                                      copyWith(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),),

                                    DropdownButton(

                                      // Initial Value
                                      value: universitySelectedItem,

                                      // Down Arrow Icon
                                      //icon: const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: universityItems.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        setState((){ universitySelectedItem = newValue!;});

                                      },
                                    ),
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(height: 8,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Grade',
                                  style: GoogleFonts.poppins().
                                  copyWith(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),),
                                DropdownButton(
                                  borderRadius: BorderRadius.circular(15),

                                  value: gradeSelectedItem,

                                  // Down Arrow Icon
                                 // icon: const Icon(Icons.keyboard_arrow_down),

                                  // Array list of items
                                  items: gradeItems.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState((){ gradeSelectedItem = newValue!;});
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: defaultButton(
                            text: 'Sign Up',
                            onpressed: (){
                              registerCubit.RegisterEmail(
                                  password: passwordcontroler.text,
                                  email:emailcontroler.text ,
                                  name: namecontroler.text,
                                  phone: phonecontroler.text,
                                  gender: gendercontroler.text
                              );
                            }
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.black54,
                              height: 1,
                            ),
                          ),
                          SizedBox(width: 7,),
                          Text('OR',
                            style : GoogleFonts.poppins ( fontSize: 25.0,
                              fontWeight: FontWeight.w400,color: Colors.black,),
                          ),
                          SizedBox(width: 7,),
                          Expanded(
                            child: Container(
                              color: Colors.black54,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Container(
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom( side: BorderSide(color: Colors.deepOrange,width: 3,),minimumSize: Size(340, 45)),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                            }
                            , child:Text('Login',
                              style : GoogleFonts.poppins ( fontSize: 20.0,
                                  fontWeight: FontWeight.w500,color: Colors.deepOrange),
                            ),
                          ),
                        ),

                      ),
                      SizedBox(height: 40,),



                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
