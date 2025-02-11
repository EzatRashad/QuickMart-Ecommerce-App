import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/features/layout/presentation/cubit/layout_cubit.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/assets.gen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key, required this.homeCubit});
  final LayoutCubit homeCubit;
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
          currentIndex: widget.homeCubit.selectedIndex,
          selectedItemColor: AppColors.black,
          unselectedFontSize: 14.sp,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            fontFamily: 'Plus Jakarta Sans',
          ),
          onTap: (index) {
            widget.homeCubit.changeIndex(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Assets.images.homeIcon.image(
                  height: 20.h,
                  color: widget.homeCubit.selectedIndex == 0
                      ? AppColors.cyan
                      : AppColors.grey150,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Assets.images.categoryIcon.image(
                  height: 20.h,
                  color: widget.homeCubit.selectedIndex == 1
                      ? AppColors.cyan
                      : AppColors.grey150,
                ),
                label: "Category"),
            BottomNavigationBarItem(
                icon: Assets.images.cartIcon.image(
                  height: 20.h,
                  color: widget.homeCubit.selectedIndex == 2
                      ? AppColors.cyan
                      : AppColors.grey150,
                ),
                label: "My Cart"),
            BottomNavigationBarItem(
                icon: Assets.images.favIcon.image(
                  height: 20.h,
                  color: widget.homeCubit.selectedIndex == 3
                      ? AppColors.cyan
                      : AppColors.grey150,
                ),
                label: "Wishlist"),
          ]),
    );
  }
}
