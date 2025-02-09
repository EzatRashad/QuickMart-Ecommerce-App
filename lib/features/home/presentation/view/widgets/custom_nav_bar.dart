import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/assets.gen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        
        
          height: 55.h,
           
        child: BottomNavigationBar(
             backgroundColor: AppColors.white,
            elevation: 0,
            currentIndex: selectedIndex,
            selectedItemColor: AppColors.black,
            unselectedFontSize: 14.sp,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              fontFamily: 'Plus Jakarta Sans',
            ),
            onTap: (index) => setState(() => selectedIndex = index),
            items: [
              BottomNavigationBarItem(
                  icon: Assets.images.homeIcon.image(
                    height: 20.h,
                    color:
                        selectedIndex == 0 ? AppColors.cyan : AppColors.grey150,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Assets.images.cartIcon.image(
                    height: 20.h,
                    color:
                        selectedIndex == 1 ? AppColors.cyan : AppColors.grey150,
                  ),
                  label: "My Cart"),
              BottomNavigationBarItem(
                  icon: Assets.images.favIcon.image(
                    height: 20.h,
                    color:
                        selectedIndex == 2 ? AppColors.cyan : AppColors.grey150,
                  ),
                  label: "Wishlist"),
            ]),
      );
  }
}