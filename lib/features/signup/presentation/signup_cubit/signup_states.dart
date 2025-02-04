abstract class SignupStates {}

class SignupInitialState extends SignupStates {}

class SignupLoadingState extends SignupStates {}

class SignupSuccessState extends SignupStates {}

class SignupFailureState extends SignupStates {
  String? errorMessage;
  SignupFailureState(this.errorMessage);
}
