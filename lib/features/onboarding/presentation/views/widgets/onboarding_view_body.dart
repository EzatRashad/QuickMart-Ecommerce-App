import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/app_color.dart';
import 'package:quick_mart_app/core/utils/assets.gen.dart';
import 'package:quick_mart_app/core/utils/utils.dart';
import 'package:quick_mart_app/core/widgets/custom_button.dart';
import 'package:quick_mart_app/features/onboarding/presentation/views/widgets/action_section.dart';
import 'package:quick_mart_app/features/onboarding/presentation/views/widgets/desc_section.dart';
import 'package:quick_mart_app/features/onboarding/presentation/views/widgets/image_container.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.r),
        child: Column(
          children: [
            54.ph,
            ImageContainer(),
            24.ph,
            DescSection(),
            24.ph,
          ActionSection(),
          ],
        ),
      ),
    );
  }
}
