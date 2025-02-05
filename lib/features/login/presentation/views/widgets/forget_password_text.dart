import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_color.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        "Forgot password?",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: AppColors.cyan,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
