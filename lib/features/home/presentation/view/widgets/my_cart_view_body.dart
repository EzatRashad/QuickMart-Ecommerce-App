import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quick_mart_app/core/utils/utils.dart';
import 'package:quick_mart_app/core/widgets/cart_and_wish_product.dart';
import 'package:quick_mart_app/core/widgets/custom_button.dart';
import 'package:quick_mart_app/core/widgets/empty_widget.dart';
import 'package:quick_mart_app/features/home/data/data_source_impl/home_data_source_impl.dart';
import 'package:quick_mart_app/features/home/data/home_api_service/home_api.dart';
import 'package:quick_mart_app/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:quick_mart_app/features/home/domain/use_case/get_cart_items_use_case.dart';
import 'package:quick_mart_app/features/home/presentation/get_cart_items_cubit/get_cart_items_cubit.dart';
import 'package:quick_mart_app/features/home/presentation/get_cart_items_cubit/get_cart_items_state.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/order_details.dart';

class MyCartViewBody extends StatefulWidget {
  const MyCartViewBody({super.key});

  @override
  State<MyCartViewBody> createState() => _MyCartViewBodyState();
}

class _MyCartViewBodyState extends State<MyCartViewBody> {
  late final GetCartItemsCubit _getCartItemsCubit;

  @override
  void initState() {
    super.initState();
    _getCartItemsCubit = GetCartItemsCubit(
      getCartItemsUseCase: GetCartItemsUseCase(
        HomeRepoImpl(
          homeRemoteDataSource: HomeRemoteDataSourceImpl(
            homeApiService: HomeApiService(Dio()),
          ),
        ),
      ),
    )..getCartItems();
  }

  @override
  void dispose() {
    _getCartItemsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _getCartItemsCubit,
      child: BlocBuilder<GetCartItemsCubit, GetCartItemsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: const SizedBox(),
              title: Text(
                "My Cart",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            body: _buildBody(context, state),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, GetCartItemsState state) {
    if (state is GetCartItemsLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is GetCartItemsSErrorState) {
      return Center(child: Text(state.message));
    } else {
      final itemsList = context.read<GetCartItemsCubit>().itemsList ?? [];
      final totalPrice = context.read<GetCartItemsCubit>().totalPrice;

      if (itemsList.isEmpty) {
        return const EmptyWidget(
          image: 'assets/images/empty1.png',
          description:
              "Looks like you have not added anything in your cart. Go ahead and explore top categories.",
          message: 'Your Cart is empty',
        );
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: itemsList.length,
                          itemBuilder: (context, index) {
                            return CartAndWishProduct(
                              getProductsEntity: itemsList[index],
                              isCart: true,
                            );
                          },
                          separatorBuilder: (context, index) => 5.ph,
                        ),
                        5.ph,
                        OrderDetail(subTotal: totalPrice ,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: CustomButton(
                text: "Checkout",
                onPressed: () {
                  // Add checkout logic here
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}
