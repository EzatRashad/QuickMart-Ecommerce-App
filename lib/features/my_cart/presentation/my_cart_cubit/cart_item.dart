import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_mart_app/core/utils/app_color.dart';
import 'package:quick_mart_app/core/utils/utils.dart';

import '../../../../core/utils/assets.gen.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Assets.images.product.image(
            fit: BoxFit.fill,
            width: 120.w,
            height: 120.h,
          ),
        ),
        5.pw,
        Expanded(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Loop Silicone Strong Magnetic Watch',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.07,
                      )),
              Text('\$15.25',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 12,
                      )),
              Text(
                '\$15.25',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
              Row(
                children: [
                  Container(
                    width: 96.w,
                    height: 32.h,
                    padding: const EdgeInsets.all(4),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: AppColors.grey50),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(child: Icon(Icons.add, size: 18)),
                        Text("1"),
                        GestureDetector(child: Icon(Icons.minimize, size: 18)),
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: () {

                  }, icon: Icon(Icons.delete_outline_outlined,color: AppColors.red,))
                ],
              )
            ],
          ),
        ),

      ],
    );
  }
}
