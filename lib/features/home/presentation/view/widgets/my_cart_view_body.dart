import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/app_color.dart';
import 'package:quick_mart_app/core/utils/utils.dart';
import 'package:quick_mart_app/core/widgets/cart_and_wish_product.dart';
import 'package:quick_mart_app/core/widgets/custom_button.dart';
import 'package:quick_mart_app/core/widgets/empty_widget.dart';
import 'package:quick_mart_app/features/home/presentation/get_cart_items_cubit/get_cart_items_cubit.dart';
import 'package:quick_mart_app/features/home/presentation/get_cart_items_cubit/get_cart_items_state.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/order_details.dart';

class MyCartViewBody extends StatefulWidget {
  const MyCartViewBody({super.key});

  @override
  State<MyCartViewBody> createState() => _MyCartViewBodyState();
}

class _MyCartViewBodyState extends State<MyCartViewBody> {
  //late final GetCartItemsCubit _getCartItemsCubit;

  // @override
  // void initState() {
  //   super.initState();
  //   _getCartItemsCubit = GetCartItemsCubit(
  //     getCartItemsUseCase: GetCartItemsUseCase(
  //       HomeRepoImpl(
  //         homeRemoteDataSource: HomeRemoteDataSourceImpl(
  //           homeApiService: HomeApiService(Dio()),
  //         ),
  //       ),
  //     ),
  //   )..getCartItems();
  // }

  // @override
  // void dispose() {
  //   _getCartItemsCubit.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCartItemsCubit, GetCartItemsState>(
        builder: (context, state) {
      return Scaffold(
        body: SafeArea(child: _buildBody(context, state)),
      );
    }, listener: (context, state) {
      if (state is DeleteItemFromCartLoadingState ||
          state is UpdateItemInCartLoadingState) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: AppColors.cyan,
                ),
              ],
            ),
          ),
        );
      } else {
        Navigator.of(context).pop();
      }
    });
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

      return Column(
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('My Cart', style: Theme.of(context).textTheme.titleMedium),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Clear All',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.red,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: itemsList.length,
              itemBuilder: (context, index) {
                return CartAndWishProduct(
                  getProductsEntity: itemsList[index],
                  isCart: true,
                );
              },
              separatorBuilder: (context, index) => 5.ph,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              children: [
                OrderDetail(subTotal: totalPrice),
                10.ph,
                CustomButton(text: 'Checkout'),
              ],
            ),
          ),
        ],
      );
    }
  }
}
