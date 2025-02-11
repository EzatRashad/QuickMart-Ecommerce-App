import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/app_theme.dart';
import 'package:quick_mart_app/features/layout/presentation/view/layout_view.dart';
import 'package:quick_mart_app/features/onboarding/presentation/views/onboarding_view.dart';

import 'features/home/presentation/view/home_view.dart';


void main(){
  //  await CasheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: AppTheme.currentTheme,

          home: const LayoutView(),

        );
      },
    );
  }
}
