import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/app_color.dart';
import 'package:quick_mart_app/core/utils/navigate.dart';
import 'package:quick_mart_app/core/utils/utils.dart';
import 'package:quick_mart_app/features/home/data/data_source/home_data_source_impl.dart';
import 'package:quick_mart_app/features/home/data/home_api_service/home_api.dart';
import 'package:quick_mart_app/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:quick_mart_app/features/home/domain/use_case/get_categories_use_case.dart';

import '../../catigories_cubit/catigories_cubit.dart';

import '../../catigories_cubit/catigories_states.dart';
import 'categories_loading.dart';
import 'categories_view_body.dart';
import 'head_line.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({
    super.key,
  });

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
   

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetCategoriesSuccessState) {
            return Column(
              children: [
                HeadLine(
                    title: "Categories",
                    onTap: () {
                      context.nextScreen(CategoriesViewBody(
                        categoriesList: CategoriesCubit.get(context)
                                .categoriesList ?? [],
                      ));
                    }),
                12.ph,
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.11,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) =>
                        buildCategoryItem(context, index),
                  ),
                ),
              ],
            );
          } else if (state is GetCategoriesSErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Center(
              child: CategoriesLoading(),
            );
          }
        });
  }

  Widget buildCategoryItem(BuildContext context, int index) {
    final category = CategoriesCubit.get(context).categoriesList![index + 3];

    return Padding(
      padding: EdgeInsets.only(right: 5.0.r),
      child: Card(
        color: AppColors.white,
        elevation: 2,
        child: Container(
          width: 80.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.grey50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              category.image != null
                  ? Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.network(
                          category.image!,
                          width: double.infinity,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.error, color: AppColors.red),
                        ),
                      ),
                    )
                  : Icon(Icons.image, size: 30.sp),
              SizedBox(height: 5.h),
              FittedBox(
                child: Text(
                  category.name ?? "Unknown",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 10.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
