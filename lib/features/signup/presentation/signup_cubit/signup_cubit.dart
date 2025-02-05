import 'dart:developer'; 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart_app/features/signup/domain/use_case/signup_use_case.dart';

import '../../data/model/register_request.dart';
import 'signup_states.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit({required this.signupUseCase}) : super(SignupInitialState());
  SignupUseCase signupUseCase;
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool obscureText2 = true;
  void signup() async {
    if (formKey.currentState!.validate()) {
      emit(SignupLoadingState());
      try {
        var response = await signupUseCase.signup(
           RegisterRequest(
                name: name.text,
                email: email.text,
                password: password.text,
                phone: phone.text));
        if (response.message == "success") {
          emit(SignupSuccessState(response));
        } else {
          emit(SignupFailureState(response.statusMsg));
          log(response.message!);
          log(response.statusMsg!);
        }
      } catch (e) {
        emit(SignupFailureState(e.toString()));
      }
    }
  }
}
