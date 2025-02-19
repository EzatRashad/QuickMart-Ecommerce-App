import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/assets.gen.dart';
class CategoriesProductsAppBar extends StatelessWidget {
  const CategoriesProductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: true,
      leading: Row(
        children: [
          Icon(Icons.arrow_back_ios_new, ),
        ],
      ),
      title: Text(

        "title",
        style: Theme.of(context)
            .textTheme
            .titleMedium,
      ),
      actions: [
        Assets.images.searchNormal.svg(
          width: 32.w,

        ),

      ],
      backgroundColor: AppColors.white,
    );
  }
}
