import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/utils.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/colors_list.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/details_action.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/product_details_app_bar.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/product_details_description.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/product_details_title.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/rate_widget.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProductDetailsAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailsTitle(),
                  12.ph,
                  RateWidget(),
                  12.ph,
                  ProductDetailsDescription(),
                  12.ph,
                  ColorsList(),
                  12.ph,
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Spacer(),
                  DetailsAction(),
                  15.ph,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
