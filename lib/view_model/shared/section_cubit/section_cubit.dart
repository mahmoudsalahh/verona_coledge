import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verona_colledge/models/lectures_model.dart';
import 'package:verona_colledge/models/section_model.dart';
import 'package:verona_colledge/view/homescreen/home_screen.dart';
import 'package:verona_colledge/view/news_screen/news_frist.dart';
import 'package:verona_colledge/view/news_screen/news_screen.dart';
import 'package:verona_colledge/view/settings/settings.dart';
import 'package:verona_colledge/view_model/shared/cubit/states.dart';
import 'package:verona_colledge/view_model/shared/database/network/dio_helper.dart';
import 'package:verona_colledge/view_model/shared/database/network/end_points.dart';
import 'package:verona_colledge/view_model/shared/section_cubit/section_states.dart';
import 'package:verona_colledge/view_model/shared/shared.component/constant.dart';

class SectionCubit extends Cubit<SectionStates>{
  SectionCubit() : super(SectionInitialStates());
  static SectionCubit get(context)  => BlocProvider.of(context);
  SectionModel? sectionModel ;
  void getSectionData(){
    DioHelper.getData(
      url: sectionEndPoint,
      token: accesstoken,
    )
        .then((value) {
      sectionModel = SectionModel.fromJson(value.data);
      print(sectionModel!.code);
      emit(GetSectionDataSuccessState(sectionModel));

    })
        .catchError((onError){
      emit(GetSectionDataErrorState());
      print(onError.toString());
    });
  }
}