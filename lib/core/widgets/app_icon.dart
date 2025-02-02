import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_theme.dart';
import '../utils/assets.gen.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme.currentTheme == ThemeMode.light
        ? Assets.images.quickmartlight.image(
            height: 32.h,
            width: 104.w,
          )
        : Assets.images.quickmartlight.image(
            height: 32.h,
            width: 104.w,
          );
  }
}
