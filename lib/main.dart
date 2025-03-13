import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/app_theme.dart';
import 'package:quick_mart_app/features/layout/presentation/view/layout_view.dart';
import 'package:quick_mart_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:quick_mart_app/features/onboarding/presentation/views/widgets/onboarding_view_body.dart';

import 'core/utils/bloc_observar.dart';

void main() {
  //  await CasheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          home: OnboardingView(),                                                                   
        );
      },
    );
  }
}
