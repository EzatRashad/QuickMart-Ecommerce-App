import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_color.dart';

class TextRich extends StatelessWidget {
  const TextRich({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'By login , you agree to our',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 12.sp,
                ),
          ),
          TextSpan(
            text: ' Privacy Policy ',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.blue,
                  fontSize: 12.sp,
                ),
          ),
          TextSpan(
            text: 'and',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 12.sp,
                ),
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.blue,
                  fontSize: 12.sp,
                ),
          ),
          TextSpan(
            text: '.',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.black,
                  fontSize: 12.sp,
                ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
