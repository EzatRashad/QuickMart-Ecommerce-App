import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_mart_app/core/utils/navigate.dart';
import 'package:quick_mart_app/core/utils/utils.dart';
import 'package:quick_mart_app/core/widgets/app_icon.dart';
import 'package:quick_mart_app/core/widgets/auth_title.dart';
import 'package:quick_mart_app/core/widgets/custom_button.dart';
import 'package:quick_mart_app/core/widgets/custom_text_form_filed.dart';
import 'package:quick_mart_app/features/login/presentation/views/widgets/forget_paaword_text.dart';
import 'package:quick_mart_app/features/login/presentation/views/widgets/text_rich.dart';
import 'package:quick_mart_app/features/signup/presentation/views/signup_view.dart';

import '../../../../../core/utils/validation.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody>
    with SingleTickerProviderStateMixin {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  bool obscureText = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                  controller: email,
                  hintText: 'Enter your Email',
                                    validator: (value) => Validation.validateEmail(value!),
            
                ),
                16.ph,
                CustomTextFormFiled(
                  title: "Password",
                  controller: password,
                  hintText: 'Enter your Password',
                  obscureText: obscureText,
                                    validator: (value) => Validation.validatePassword(value!),
            
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Icon(
                      obscureText
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                      size: 24.w,
                    ),
                  ),
                ),
                24.ph,
                ForgetPaawordText(),
                SizedBox(height: MediaQuery.sizeOf(context).height * .04),
                CustomButton(text: "Login",onPressed: () {
                    if(formKey.currentState!.validate()){
                      
                    }
                  },),
                SizedBox(height: MediaQuery.sizeOf(context).height * .05),
                TextRich(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
