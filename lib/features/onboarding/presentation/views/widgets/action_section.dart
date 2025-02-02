import 'package:flutter/material.dart';
import 'package:quick_mart_app/core/utils/navigate.dart';
import 'package:quick_mart_app/core/utils/utils.dart';
import 'package:quick_mart_app/features/login/presentation/views/login_view.dart';
import 'package:quick_mart_app/features/signup/presentation/views/signup_view.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/widgets/custom_button.dart';

class ActionSection extends StatelessWidget {
  const ActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () {
              context.nextScreen(LoginView());
            },
            text: "Login",
            textColor: AppColors.black,
            backgroundColor: AppColors.white,
            borderColor: AppColors.grey100,
          ),
        ),
        8.pw,
        Expanded(
          child: CustomButton(
            text: "Signup",
            onPressed: () {
              context.nextScreen(SignupView());
            },
          ),
        ),
      ],
    );
  }
}
