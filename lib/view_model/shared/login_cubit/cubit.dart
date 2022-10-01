import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verona_colledge/models/login_model.dart';
import 'package:verona_colledge/view_model/shared/database/network/dio_helper.dart';
import 'package:verona_colledge/view_model/shared/database/network/end_points.dart';
import 'package:verona_colledge/view_model/shared/login_cubit/states.dart';

import '../shared.component/constant.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialStates());
  static LoginCubit get(context)  => BlocProvider.of(context);
  LoginModel? loginModel;
  void LoginEmail ({
    String? email,
    String? password,
  }){
    DioHelper.postData(
        url: loginEndPoint,
        data: {
          'email' : email,
          'password' : password
        },
      token: token,
    ).then((value) {
      print('tokeeeeeeeeeeeeeeeeeen is $token');
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessStates(loginModel));
      print(value.data.toString());
    }).catchError((onError){
      emit(LoginErrorStates());
      print(onError.toString());
    });
  }

}