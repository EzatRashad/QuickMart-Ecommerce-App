import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/app_color.dart';
import 'package:quick_mart_app/core/utils/utils.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({super.key, required this.image, required this.name, });

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        height: 10.h,
        width: double.infinity,
         decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
           )
      
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                 image ?? '',
                  width: double.infinity,
                   fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 100.h,
                    color: Colors.grey.shade300,
                    child: Center(child: Icon(Icons.error, color: AppColors.red)),
                  ),
                ),
              ),
            ),
            6.ph,
            Expanded(
              flex: 1,
              child: Text(
                name ?? '',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
