import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart_app/features/login/data/model/login_request.dart';
import 'package:quick_mart_app/features/login/domain/use_case/login_use_case.dart';
import 'package:quick_mart_app/features/login/presentation/login_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());
  LoginUseCase loginUseCase  ;
    TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  bool obscureText = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void login()async{
    if(formKey.currentState!.validate()){
                        emit(LoginLoadingState());
      try {
        var response = await loginUseCase.login(
           LoginRequest(email: email.text, password: password.text));
        if (response.message == "success") {
          emit(LoginSuccessState(response));
        } else {
          emit(LoginFailureState(response.statusMsg));
         
        }
      } catch (e) {
        emit(LoginFailureState(e.toString()));
      }
    }
                    }
  }
 
