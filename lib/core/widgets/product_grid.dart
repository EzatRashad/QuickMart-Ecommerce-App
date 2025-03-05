import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/widgets/product_item.dart';
import 'package:quick_mart_app/features/home/data/data_source/home_data_source_impl.dart';
import 'package:quick_mart_app/features/home/data/home_api_service/home_api.dart';
import 'package:quick_mart_app/features/home/data/repo_impl/home_repo_impl.dart';

import '../../features/home/domain/use_case/get_products_use_case.dart';
import '../../features/home/presentation/products_cubit/products_cubit.dart';
import '../../features/home/presentation/products_cubit/products_states.dart';
import '../../features/home/presentation/view/widgets/shimmer_head_line.dart';
import '../../features/home/presentation/view/widgets/shimmer_products.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  ProductsCubit productsCubit = ProductsCubit(
    getProductsUseCase: GetProductsUseCase(
      HomeRepoImpl(
        homeRemoteDataSource: HomeRemoteDataSourceImpl(
          homeApiService: HomeApiService(
            Dio(),
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      bloc: productsCubit..getProducts(),
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProductsSuccessState) {
          return SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 2 / 3,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => ProductItem(
                product: state.products.data![index],
              ),
              childCount: state.products.data!.length, // Make it dynamic
            ),
          );
        } else if (state is ProductsSErrorState) {
          return SliverToBoxAdapter(
            // Wrap with SliverToBoxAdapter
            child: Center(
              child: Text(state.message),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            // Wrap with SliverToBoxAdapter
            child:  Center(child: CircularProgressIndicator(),)
          );
        }
      },
    );
  }
}
