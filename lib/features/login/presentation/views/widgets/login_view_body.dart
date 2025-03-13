import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_mart_app/core/utils/navigate.dart';
import 'package:quick_mart_app/core/utils/utils.dart';
import 'package:quick_mart_app/core/widgets/app_icon.dart';
import 'package:quick_mart_app/core/widgets/auth_title.dart';
import 'package:quick_mart_app/core/widgets/custom_button.dart';
import 'package:quick_mart_app/core/widgets/custom_text_form_filed.dart';
import 'package:quick_mart_app/features/login/data/data_source/login_remote_data_source/login_remote_data_source_impl.dart';
import 'package:quick_mart_app/features/login/domain/use_case/login_use_case.dart';
import 'package:quick_mart_app/features/login/presentation/login_cubit/login_cubit.dart';
import 'package:quick_mart_app/features/login/presentation/login_cubit/login_states.dart';
import 'package:quick_mart_app/features/login/presentation/views/widgets/forget_password_text.dart';
import 'package:quick_mart_app/features/login/presentation/views/widgets/text_rich.dart';
import 'package:quick_mart_app/features/signup/presentation/views/signup_view.dart';
import '../../../../../core/api_service/auth_api_service.dart';
import '../../../../../core/utils/validation.dart';
import '../../../../layout/presentation/view/layout_view.dart';
import '../../../data/repo/login_repo_impl.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody>
    with SingleTickerProviderStateMixin {
  LoginCubit loginCubit = LoginCubit(
      loginUseCase: LoginUseCase(LoginRepoImpl(
          loginRemoteDataSource:
              LoginRemoteDataSourceImpl(apiService: AuthApiService(Dio())))));
  @override
  Widget build(BuildContext context) {
    return BlocListener(
        listener: (context, state) {
          {
            if (state is LoginLoadingState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            } else if (state is LoginFailureState) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errorMessage ?? "Error.......")));
            } else if (state is LoginSuccessState) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text(state.loginResponse!.message ?? "Success.......")));
              context.nextScreen(LayoutView());
            }
          }
        },
        bloc: loginCubit,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: SingleChildScrollView(
              child: Form(
                key: loginCubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height * .08),
                    AppIcon(),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .03),
                    AuthTitle(
                      title: "Login",
                      span1: 'Don’t have an account?  ',
                      span2: 'Signup',
                      onTap: () {
                        context.nextScreen(SignupView());
                      },
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .03),
                    CustomTextFormFiled(
                      title: "Email",
                      controller: loginCubit.email,
                      hintText: 'Enter your Email',
                      validator: (value) => Validation.validateEmail(value!),
                    ),
                    16.ph,
                    CustomTextFormFiled(
                      title: "Password",
                      controller: loginCubit.password,
                      hintText: 'Enter your Password',
                      obscureText: loginCubit.obscureText,
                      validator: (value) => Validation.validatePassword(value!),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            loginCubit.obscureText = !loginCubit.obscureText;
                          });
                        },
                        child: Icon(
                          loginCubit.obscureText
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          size: 24.w,
                        ),
                      ),
                    ),
                    24.ph,
                    ForgetPasswordText(),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .04),
                    CustomButton(
                      text: "Login",
                      onPressed: () {
                        loginCubit.login();
                      },
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .05),
                    TextRich(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
