import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/utils.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/head_line.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/home_app_bar.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/home_carousel.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/categories_list.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/product_grid.dart';


class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0.w,
          ),
          child: CustomScrollView(
            slivers: [
              HomeAppBar(),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    12.ph,
                    HomeCarousel(),
                    12.ph,
                    HeadLine(title: "Categories", onTap: () {}),
                    12.ph,
                    CategoriesList(),
                    12.ph,
                    HeadLine(title: "Latest Products", onTap: () {}),
                    12.ph
                  ],
                ),
              ),
              const ProductGrid(),
            ],
          ),
        ),
      ),
    );

    
  }
}
