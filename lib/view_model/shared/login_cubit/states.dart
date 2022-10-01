import 'package:verona_colledge/models/login_model.dart';

abstract class LoginStates {}

class LoginInitialStates extends LoginStates{}

class LoginSuccessStates extends LoginStates{
  LoginModel? loginModel;
  LoginSuccessStates(this.loginModel);
}
class LoginErrorStates extends LoginStates{}