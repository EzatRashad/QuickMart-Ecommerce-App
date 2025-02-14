import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_mart_app/core/utils/app_color.dart';
import 'package:quick_mart_app/core/utils/utils.dart';

import '../../../../../core/utils/assets.gen.dart';

class ProductDetailsAppBar extends StatefulWidget {
  const ProductDetailsAppBar({super.key});

  @override
  State<ProductDetailsAppBar> createState() => _ProductDetailsAppBarState();
}

class _ProductDetailsAppBarState extends State<ProductDetailsAppBar> {
  int carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        CircleAvatar(
            radius: 20.r,
            backgroundColor: AppColors.black,
            child: Icon(
              FontAwesomeIcons.heart,
              size: 20.sp,
              color: AppColors.white,
            )),
        20.pw
      ],
      expandedHeight: 280.h,
      elevation: 0,
      pinned: true,
      backgroundColor: AppColors.white,
      stretch: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () => Navigator.of(context).pop(),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10.h),
        child: Container(
          height: 32.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r))),
          child: Container(
            height: 5.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: AppColors.cyan,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [StretchMode.blurBackground, StretchMode.zoomBackground],
        background: Stack(
          children: [
            Assets.images.product.image(
              fit: BoxFit.fill,
              height: 295.h,
            ),
          ],
        ),
      ),
    );
  }
}
