import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/app_color.dart';
import 'package:quick_mart_app/core/utils/utils.dart';

class ProductItemColors extends StatefulWidget {
  const ProductItemColors({super.key});

  @override
  State<ProductItemColors> createState() => _ProductItemColorsState();
}

class _ProductItemColorsState extends State<ProductItemColors> {
  List colors = [
    AppColors.black,
    AppColors.green,
    AppColors.cyan,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      child: Row(
         children: [
          Row(
            children: [
              for (int i = 0; i < colors.length; i++)
                Align(
                    widthFactor: 0.5,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Container(
                        width: 45.w,
                        height: 45.h,
                        decoration:
                            ShapeDecoration(color: colors[i], shape: CircleBorder()),
                      ),
                    )),
            ],
          ),


        ],
      ),
    );
  }
}
