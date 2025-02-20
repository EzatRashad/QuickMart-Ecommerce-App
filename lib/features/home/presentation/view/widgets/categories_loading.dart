import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/shimmer_head_line.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/app_color.dart';

class CategoriesLoading extends StatelessWidget {
  const CategoriesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ShimmerHeadLine(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.10,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(right: 5.0.r),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.grey50),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}