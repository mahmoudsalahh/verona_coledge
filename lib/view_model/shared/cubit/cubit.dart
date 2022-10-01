import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:verona_colledge/models/lectures_model.dart';
import 'package:verona_colledge/view/homescreen/home_screen.dart';
import 'package:verona_colledge/view/news_screen/news_frist.dart';
import 'package:verona_colledge/view/news_screen/news_screen.dart';
import 'package:verona_colledge/view/settings/settings.dart';
import 'package:verona_colledge/view_model/shared/cubit/states.dart';
import 'package:verona_colledge/view_model/shared/database/network/dio_helper.dart';
import 'package:verona_colledge/view_model/shared/database/network/end_points.dart';
import 'package:verona_colledge/view_model/shared/shared.component/constant.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialStates());
  static AppCubit get(context)  => BlocProvider.of(context);

  List <GButton>? items =[
    GButton(icon: Icons.home_outlined,text: 'Home'),
    GButton(icon: Icons.newspaper,text: 'News'),
    GButton(icon: Icons.settings,text: 'Settings')
  ];
  List <Widget> screen =[
    HomeScreen(),
    NewsFrist(),
    Settings()
  ];
  List<String> title =[
    'Home',
    'News',
    'Settings'

  ];
  int currentIndex = 0;
  void changeItem(index){
    currentIndex= index ;
    emit(SocialChangeItemState());
  }
  LectureModel? lectureModel ;
void getLectureData(){
    DioHelper.getData(
        url: lectureEndPoint,
      token: accesstoken,
    )
        .then((value) {
          lectureModel = LectureModel.fromJson(value.data);
          print(lectureModel!.data![1].lectureSubject.toString());
          emit(getLectureDataSuccessState());
    })
        .catchError((onError){
      emit(getLectureDataErrorState());
      print(onError.toString());
    });
}
}