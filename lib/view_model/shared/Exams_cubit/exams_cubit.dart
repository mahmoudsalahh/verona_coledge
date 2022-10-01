import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verona_colledge/models/lectures_model.dart';
import 'package:verona_colledge/models/section_model.dart';
import 'package:verona_colledge/view/homescreen/home_screen.dart';
import 'package:verona_colledge/view/news_screen/news_frist.dart';
import 'package:verona_colledge/view/news_screen/news_screen.dart';
import 'package:verona_colledge/view/settings/settings.dart';
import 'package:verona_colledge/view_model/shared/Exams_cubit/exams_states.dart';
import 'package:verona_colledge/view_model/shared/cubit/states.dart';
import 'package:verona_colledge/view_model/shared/database/network/dio_helper.dart';
import 'package:verona_colledge/view_model/shared/database/network/end_points.dart';
import 'package:verona_colledge/view_model/shared/section_cubit/section_states.dart';
import 'package:verona_colledge/view_model/shared/shared.component/constant.dart';

import '../../../models/midterm_model.dart';

class ExamsCubit extends Cubit<ExamsStates>{
  ExamsCubit() : super(ExamsInitialStates());
  static ExamsCubit get(context)  => BlocProvider.of(context);
  ExamModel? examModel ;
  List isMidterm =[];
  List isFinal =[];

  void getAllmData(){
    DioHelper.getData(
      url: examsEndPoint,
      token: accesstoken,
    )
        .then((value) {
      examModel = ExamModel.fromJson(value.data);
      examModel!.data!.forEach((element) {
        if(element.isfinal==true){
          isFinal.add((element));
        }else{
          isMidterm.add((element));
        }
        //print(isFinal);
      }
      );

      print(examModel!.code);
      emit(GetExamsDataSuccessState(examModel));

    })
        .catchError((onError){
      emit(GetExamsDataErrorState());
      print(onError.toString());
    });
  }
}