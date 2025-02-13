import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_mart_app/core/utils/app_color.dart';
import 'package:quick_mart_app/core/utils/utils.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.all(2.r),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
              side: BorderSide(width: 1.w, color: AppColors.grey100),
            ),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(children: [
                  Container(
                    width: double.infinity,
                    height: 110,
                    decoration: ShapeDecoration(
                      color: AppColors.grey50,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/2638026/pexels-photo-2638026.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 5.h,
                      right: 5.w,
                      child: CircleAvatar(
                          radius: 12.r,
                          backgroundColor: AppColors.black,
                          child: Icon(
                            FontAwesomeIcons.heart,
                            size: 10.sp,
                            color: AppColors.white,
                          )))
                ]),
                3.ph,
                Text(
                  'Classic new black glasses for men and women',

                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    '\$8.50',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    '\$10.00',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 10.sp,
                        ),
                  ),
                ),
              ]),
        );
  }
}
