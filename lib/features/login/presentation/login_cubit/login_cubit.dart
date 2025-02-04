import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart_app/features/login/presentation/login_cubit/logn_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  void login(){}
}
