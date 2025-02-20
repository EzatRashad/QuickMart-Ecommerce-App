import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/Categories_item.dart';

import '../../../../../core/widgets/common_app_bar.dart';
import '../../../data/models/category_model.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key, required this.categoriesList});

  final List<Category> categoriesList;

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
            mainAxisSpacing: 8.h,
          ),
          itemBuilder: (context, index) {
            return CategoriesItem(
              image:index==2?"https://images.pexels.com/photos/934063/pexels-photo-934063.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2": categoriesList[index].image ?? '',
              name: categoriesList[index].name ?? '',
            );
          },
        ),
      ),
    );
  }
}
