import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verona_colledge/view_model/shared/database/network/dio_helper.dart';
import 'package:verona_colledge/view_model/shared/database/network/end_points.dart';
import 'package:verona_colledge/view_model/shared/login_cubit/states.dart';
import 'package:verona_colledge/view_model/shared/register_cubit/states.dart';

import '../shared.component/constant.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInitialStates());
  static RegisterCubit get(context)  => BlocProvider.of(context);
  void RegisterEmail ({
    String? email,
    String? password,
    String? name,
  String? gender,
    String? phone,
    int ? universityId =1,
    int? gradeId=4,
    int? roleId=4,
  }){
    DioHelper.postData(
        url: registerEndPoint,
        data: {
          'email' : email,
          'password' : password,
          'name' : name,
          'gender' : gender,
          'phoneNumber' : phone,
          'universityId' : universityId,
          'gradeId' : gradeId,
          'roleId' : roleId,
        },token: token,
    ).then((value) {
      emit(RegisterSuccessStates());
      print(value.data);
    }).catchError((onError){
      emit(RegisterErrorStates());
      print(onError.toString());
    });
  }

}