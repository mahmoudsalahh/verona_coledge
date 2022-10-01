import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verona_colledge/view/homelayout/homelayout.dart';
import 'package:verona_colledge/view/register/register_screen.dart';
import 'package:verona_colledge/view_model/shared/database/network/chase_helper.dart';
import 'package:verona_colledge/view_model/shared/login_cubit/cubit.dart';
import 'package:verona_colledge/view_model/shared/login_cubit/states.dart';
import 'package:verona_colledge/view_model/shared/login_cubit/states.dart';
import 'package:verona_colledge/view_model/shared/login_cubit/states.dart';
import 'package:verona_colledge/view_model/shared/shared.component/constant.dart';

import '../../view_model/shared/login_cubit/states.dart';
import '../../view_model/shared/login_cubit/states.dart';
import '../../view_model/shared/login_cubit/states.dart';
import '../../view_model/shared/shared.component/component.dart';


class LoginScreen extends StatelessWidget {
  //const LoginScreen({Key? key}) : super(key: key);
  Icon suffix = Icon(Icons.remove_red_eye,color: Colors.deepOrange,);
  var formkey = GlobalKey<FormState>();
  var emailcontroler = TextEditingController();
  var passwordcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit ,LoginStates>(
        listener: (context , state){
      if (state is LoginSuccessStates) {
        if (state.loginModel!.code == 'Success') {
          CacheHelper.saveData(key: 'token', value: state.loginModel!.data!.accessToken).then((value) {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LayoutScreen()));
          });
        }}},
        builder: (context , state){
          LoginCubit loginCubit = LoginCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40,),
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
                      SizedBox(height: 80,),
                      Text('Login',
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
                          controller: emailcontroler,
                          type: TextInputType.emailAddress,
                          label: 'E-Mail',
                          prefix: Icons.email,
                          validate: (value){
                            if(value!.isEmpty)
                            {
                              return 'password is Empty';
                            }
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        controller: passwordcontroler,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',labelStyle: TextStyle(color: Colors.grey),
                          floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                          prefixIcon: Icon(Icons.lock,color: Colors.deepOrange,),
                          suffixIcon: suffix,
                          suffixIconColor: Colors.deepOrange,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Colors.deepOrange,
                              width: 2.0,
                            ),
                          ),
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
                      SizedBox(
                        height: 15.0,
                      ),
                      Text('Forget Password?',
                        style : GoogleFonts.poppins ( fontSize: 15.0,
                          fontWeight: FontWeight.w400,color: Colors.deepOrange,decoration: TextDecoration.underline, ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: defaultButton(
                            text: 'Login',
                            onpressed: (){
                             //token= loginCubit.loginModel!.data!.accessToken;
                              loginCubit.LoginEmail(email: emailcontroler.text , password: passwordcontroler.text) ;

                            }
                        ),
                      ),
                      SizedBox(height: 17,),
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
                            borderRadius: BorderRadius.circular(10),),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom( side: BorderSide(color: Colors.deepOrange,width: 3)),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                            }
                            , child:Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Sign Up',
                              style : GoogleFonts.poppins ( fontSize: 20.0,
                                  fontWeight: FontWeight.w500,color: Colors.deepOrange),
                            ),
                          ),
                          ),
                        ),
                      )




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
