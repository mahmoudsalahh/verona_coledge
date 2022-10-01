import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verona_colledge/view/homelayout/homelayout.dart';
import 'package:verona_colledge/view/splash_screen/splash_screen.dart';
import 'package:verona_colledge/view_model/shared/Exams_cubit/exams_cubit.dart';
import 'package:verona_colledge/view_model/shared/cubit/cubit.dart';
import 'package:verona_colledge/view_model/shared/cubit/states.dart';
import 'package:verona_colledge/view_model/shared/database/network/chase_helper.dart';
import 'package:verona_colledge/view_model/shared/database/network/dio_helper.dart';
import 'package:verona_colledge/view_model/shared/section_cubit/section_cubit.dart';
import 'package:verona_colledge/view_model/shared/terms_cubit/terms_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  //bool? isDark = CacheHelper.getData(key: 'isDark');
  //var onBoarding =  CacheHelper.getData(key: 'onBoarding');
  var token = CacheHelper.getData(key: 'token');
 print(token);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>SectionCubit()..getSectionData()),
          BlocProvider(create: (context)=>AppCubit()..getLectureData()),
          BlocProvider(create: (context)=>ExamsCubit()..getAllmData()),
          BlocProvider(create: (context) => TermsCubit()..getTermsData(),)
        ],
        child:  BlocConsumer<AppCubit , AppStates>(
          listener: (context ,state){},
          builder: (context ,state)=> MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
      ),
      home: LayoutScreen(),
    )));
  }
}

