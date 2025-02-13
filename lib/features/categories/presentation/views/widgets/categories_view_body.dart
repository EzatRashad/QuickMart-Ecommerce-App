import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/features/categories/presentation/views/widgets/Categories_item.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/category_widget_model.dart';

import '../../../../../core/widgets/common_app_bar.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Categories", context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GridView.builder(
          itemCount: categoriesList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
          ),
          itemBuilder: (context, index) {
            return CategoriesItem(
              categoryWidgetModel: categoriesList[index],
            );
          },
        ),
      ),
    );
  }
}
