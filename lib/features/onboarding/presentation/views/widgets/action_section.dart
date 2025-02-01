import 'package:flutter/material.dart';
import 'package:quick_mart_app/core/utils/utils.dart';

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
          ),
        ),
      ],
    );
  }
}
