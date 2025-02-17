import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/utils.dart';

import '../../../../../core/utils/app_color.dart';

class ProductDetailsTitle extends StatelessWidget {
  const ProductDetailsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: ShapeDecoration(
                color: AppColors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                'Top Rated',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(
                    color: AppColors.white, fontSize: 12.sp),
              ),
            ),
            12.pw,
            Container(
              padding: const EdgeInsets.all(6),
              decoration: ShapeDecoration(
                color: Color(0xFF08E488),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                'Free Shipping',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(
                    color: AppColors.white, fontSize: 12.sp),
              ),
            )
          ],
        ),
        6.ph,
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                'Loop Silicone Strong Magnetic watch',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$15.25',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                        color: AppColors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  2.ph,
                  Text(
                    '\$20.00',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],);
  }
}
