import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verona_colledge/view/login/login_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasySplashScreen(
          logo: Image(image: AssetImage('assets/images/logo.png'),width: 500,height: 100,),
        //backgroundColor: Colors.deepOrange.shade400,
        showLoader: true,
        loadingText: Text("Loading..."),
        navigator: LoginScreen(),
        durationInSeconds: 5,
      ),
    );
  }
}
