import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_states.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() : super(SignupInitialState());
  void signup(){}
}
