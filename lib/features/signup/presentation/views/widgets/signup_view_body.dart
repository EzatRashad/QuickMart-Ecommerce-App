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
import 'package:quick_mart_app/features/signup/data/data_source/signup_remote_data_source/signup_remote_data_source_impl.dart';
import 'package:quick_mart_app/features/signup/data/repos/signup_repo_impl.dart';
import 'package:quick_mart_app/features/signup/domain/use_case/signup_use_case.dart';
import 'package:quick_mart_app/features/signup/presentation/signup_cubit/signup_cubit.dart';
import 'package:quick_mart_app/features/signup/presentation/signup_cubit/signup_states.dart';

import '../../../../../core/utils/validation.dart';
import '../../../../../core/api_service/api_service.dart';
import '../../../../login/presentation/views/login_view.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  SignupCubit signupCubit = SignupCubit(
    signupUseCase: SignupUseCase(
      signupRepo: SignupRepoImpl(
        signupRemoteDataSource: SignupRemoteDataSourceImpl(
          ApiService(
            Dio(),
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupStates>(
      bloc: signupCubit,
      listener: (context, state) {
        if (state is SignupLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        } else if (state is SignupFailureState) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? "Error.......")));
        } else if (state is SignupSuccessState) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  Text(state.registerResponse.message ?? "Success.......")));
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: SingleChildScrollView(
            child: Form(
              key: signupCubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * .06),
                  AppIcon(),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .01),
                  AuthTitle(
                    title: "Signup",
                    span1: 'Already have an account?  ',
                    span2: 'Login',
                    onTap: () {
                      context.nextScreen(LoginView());
                    },
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .02),
                  CustomTextFormFiled(
                    title: "Full Name",
                    controller: signupCubit.name,
                    hintText: 'Enter your Full Name',
                    validator: (value) => Validation.validateName(value!),
                  ),
                  14.ph,
                  CustomTextFormFiled(
                    title: "Phone",
                    controller: signupCubit.phone,
                    hintText: 'Enter your Phone',
                    validator: (value) => Validation.validatePhone(value!),
                  ),
                  14.ph,
                  CustomTextFormFiled(
                    title: "Email",
                    controller: signupCubit.email,
                    hintText: 'Enter your Email',
                    validator: (value) => Validation.validateEmail(value!),
                  ),
                  14.ph,
                  CustomTextFormFiled(
                    title: "Password",
                    controller: signupCubit.password,
                    hintText: 'Enter your Password',
                    obscureText: signupCubit.obscureText,
                    validator: (value) => Validation.validatePassword(value!),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          signupCubit.obscureText = !signupCubit.obscureText;
                        });
                      },
                      child: Icon(
                        signupCubit.obscureText
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        size: 24.w,
                      ),
                    ),
                  ),
                  14.ph,
                  CustomTextFormFiled(
                    title: "Confirm Password",
                    controller: signupCubit.confirmPassword,
                    hintText: 'Enter your Confirm Password',
                    obscureText: signupCubit.obscureText2,
                    validator: (value) => Validation.validateConfirmPassword(
                        signupCubit.password.value.text, value!),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          signupCubit.obscureText2 = !signupCubit.obscureText2;
                        });
                      },
                      child: Icon(
                        signupCubit.obscureText2
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        size: 24.w,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .03),
                  CustomButton(
                    text: "Create Account",
                    onPressed: () {
                      signupCubit.signup();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
