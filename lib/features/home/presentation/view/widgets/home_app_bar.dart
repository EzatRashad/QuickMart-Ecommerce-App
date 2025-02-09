import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/assets.gen.dart';
import 'package:quick_mart_app/core/utils/utils.dart';

import '../../../../../core/utils/app_color.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: true,
      leading: SizedBox(
        height: 32.h,
        width: 104.w,
        child: Assets.images.quickmartlight.image(),
      ),
      actions: [
        Assets.images.searchNormal.svg(
          width: 32.w,
          
        ),
        12.pw,
        Container(
          width: 32,
          height: 32,
          decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Assets.images.person.image(),
        ),
      ],
      backgroundColor: AppColors.white,
    );
  }
}
