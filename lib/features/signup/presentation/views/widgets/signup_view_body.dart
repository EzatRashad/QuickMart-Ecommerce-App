import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_mart_app/core/utils/navigate.dart';
import 'package:quick_mart_app/core/utils/utils.dart';
import 'package:quick_mart_app/core/widgets/app_icon.dart';
import 'package:quick_mart_app/core/widgets/auth_title.dart';
import 'package:quick_mart_app/core/widgets/custom_button.dart';
import 'package:quick_mart_app/core/widgets/custom_text_form_filed.dart';

import '../../../../login/presentation/views/login_view.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * .08),
              AppIcon(),
              SizedBox(height: MediaQuery.sizeOf(context).height * .03),
              AuthTitle(
                title: "Signup",
                span1: 'Already have an account? ',
                span2: 'Login',
                onTap: () {
                  context.nextScreen(LoginView());
                },
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .03),
              CustomTextFormFiled(
                title: "Full Name",
                controller: name,
                hintText: 'Enter your Full Name',
              ),
              16.ph,
              CustomTextFormFiled(
                title: "Email",
                controller: email,
                hintText: 'Enter your Email',
              ),
              16.ph,
              CustomTextFormFiled(
                title: "Password",
                controller: password,
                hintText: 'Enter your Password',
                obscureText: obscureText,
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
              SizedBox(height: MediaQuery.sizeOf(context).height * .04),
              CustomButton(text: "Create Account")
            ],
          ),
        ),
      ),
    );
  }
}
