import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/app_color.dart';
import 'category_widget_model.dart';

 
class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  MediaQuery.sizeOf(context).height * .13,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
          padding:  EdgeInsets.only(right: 5.0.r),
          child: Container(
            width: MediaQuery.sizeOf(context).width / 4.4, 
            padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 2.w),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: AppColors.grey50),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                categoriesList[index].image ?? Container(),
                Spacer(),
                FittedBox(
                   child: Text(
                      categoriesList[index].title??'',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 10,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

