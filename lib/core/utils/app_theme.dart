import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/utils/app_color.dart';

class AppTheme {
  static bool dTheme = false;
  static ThemeMode currentTheme = ThemeMode.light;
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    //  primaryColor: ColorsManager.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 25.sp,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.bold,
        fontSize: 32.sp,
      ),
      titleMedium: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 24.sp,
      ),
      titleSmall: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),
    ),
  );
  //-------------------------------------------------------------------------------------------------
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    //  primaryColor: ColorsManager.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 25.sp,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 32.sp,
      ),
      titleMedium: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w600,
        fontSize: 24.sp,
      ),
      titleSmall: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),
    ),
  );
}
