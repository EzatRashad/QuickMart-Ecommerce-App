
import 'package:quick_mart_app/features/login/data/model/login_response.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
 LoginResponse? loginResponse;
  LoginSuccessState(this.loginResponse);
}

class LoginFailureState extends LoginStates {
  String? errorMessage;
  LoginFailureState(this.errorMessage);
}
