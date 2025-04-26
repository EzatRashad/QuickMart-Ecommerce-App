import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/features/layout/presentation/cubit/layout_cubit.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/assets.gen.dart';
import '../../../../home/presentation/products_cubit/products_cubit.dart';
import '../../../../home/presentation/products_cubit/products_states.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key, required this.layoutCubit});
  final LayoutCubit layoutCubit;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        elevation: 0,
        currentIndex: widget.layoutCubit.selectedIndex,
        selectedItemColor: AppColors.black,
        unselectedFontSize: 14.sp,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          fontFamily: 'Plus Jakarta Sans',
        ),
        onTap: (index) {
          widget.layoutCubit.changeIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Assets.images.homeIcon.image(
              height: 20.h,
              color: widget.layoutCubit.selectedIndex == 0
                  ? AppColors.cyan
                  : AppColors.grey150,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                int cartItems = ProductsCubit.get(context).numOfCartItems;
                return Badge(
                  label: Text(cartItems.toString()),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, right: 5.0),
                    child: Assets.images.cartIcon.image(
                      height: 20.h,
                      color: widget.layoutCubit.selectedIndex == 1
                          ? AppColors.cyan
                          : AppColors.grey150,
                    ),
                  ),
                );
              },
            ),
            label: "My Cart",
          ),
          BottomNavigationBarItem(
            icon: Assets.images.favIcon.image(
              height: 20.h,
              color: widget.layoutCubit.selectedIndex == 2
                  ? AppColors.cyan
                  : AppColors.grey150,
            ),
            label: "Wishlist",
          ),
        ],
      ),
    );
  }
}
