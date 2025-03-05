import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/utils.dart';

import '../../../../../core/utils/app_color.dart';

class ProductDetailsTitle extends StatelessWidget {
  const ProductDetailsTitle(
      {super.key,
      required this.title,
      required this.price,
      required this.category,
      required this.subCategory,
      required this.brand});

  final String title;
  final int price;
  final String category;
  final String subCategory;
  final String brand;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: ShapeDecoration(
                  color: AppColors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: FittedBox(
                  child: Text(
                    category,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.white, fontSize: 12.sp),
                  ),
                ),
              ),
            ),
            10.pw,
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: ShapeDecoration(
                  color: Color(0xFF08E488),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: FittedBox(
                  child: Text(
                    subCategory,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.white, fontSize: 12.sp),
                  ),
                ),
              ),
            ),
            10.pw,
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: ShapeDecoration(
                  color: AppColors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    brand,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.white, fontSize: 12.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
        6.ph,
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
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
                    '\$$price',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.green, fontWeight: FontWeight.bold),
                  ),
                  2.ph,
                  Text(
                    '\$${price + 20}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
