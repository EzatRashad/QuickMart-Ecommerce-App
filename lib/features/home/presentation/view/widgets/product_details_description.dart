import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/utils/app_color.dart';

class ProductDetailsDescription extends StatelessWidget {
  const ProductDetailsDescription({super.key, required this.desc});
  final String desc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ReadMoreText(
        desc,
        trimMode: TrimMode.Line,
        style: TextStyle(
          color: Color(0xFF6F7384),
          fontSize: 14.sp,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w400,
        ),
        trimLines: 2,
        trimCollapsedText: 'Show more',
        trimExpandedText: 'Show less',
        lessStyle: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: AppColors.red),
        moreStyle: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: AppColors.cyan),
      ),
    );
  }
}
