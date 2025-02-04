import 'package:quick_mart_app/features/signup/data/model/register_response.dart';

abstract class SignupStates {}

class SignupInitialState extends SignupStates {}

class SignupLoadingState extends SignupStates {}

class SignupSuccessState extends SignupStates {
  RegisterResponse registerResponse;
  SignupSuccessState(this.registerResponse);
}

class SignupFailureState extends SignupStates {
  String? errorMessage;
  SignupFailureState(this.errorMessage);
}
