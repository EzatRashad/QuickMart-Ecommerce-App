import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/categories_products_app_bar.dart';
import '../../../../../core/widgets/product_grid.dart';
class CategoriesProductsViewBody extends StatelessWidget {
  const CategoriesProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:   EdgeInsets.symmetric(horizontal: 8.0.w),
        child: CustomScrollView(
          slivers: [
            CategoriesProductsAppBar(),
            const ProductGrid(),],
        ),
      ),
    );
  }
}
