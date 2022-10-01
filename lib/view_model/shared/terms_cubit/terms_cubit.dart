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
import 'package:verona_colledge/view_model/shared/terms_cubit/terms_states.dart';

import '../../../models/terms_model.dart';

class TermsCubit extends Cubit<TermsStates>{
  TermsCubit() : super(TermsInitialStates());
  static TermsCubit get(context)  => BlocProvider.of(context);
  //SectionModel? sectionModel ;
  TermsModel? termsData ;
  void getTermsData(){
    DioHelper.getData(
      url: termsEndPoint,
      token: accesstoken,
    )
        .then((value) {
      termsData = TermsModel.fromJson(value.data);
      print(value.data.toString());

      //print(sectionModel!.code);
      emit(GetTermsDataSuccessState());

    })
        .catchError((onError){
      emit(GetTermsDataErrorState());
      print(onError.toString());
    });
  }
}