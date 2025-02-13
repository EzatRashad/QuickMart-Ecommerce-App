import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/category_widget_model.dart';

import '../../../../../core/widgets/common_app_bar.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({super.key, required this.categoryWidgetModel});
final CategoryWidgetModel categoryWidgetModel;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100.h,
          width: 160.w,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage("https://images.pexels.com/photos/2638026/pexels-photo-2638026.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),

        ),
        Text(categoryWidgetModel.title??"",style: Theme.of(context).textTheme.titleMedium,)
      ],
    );
  }
}
