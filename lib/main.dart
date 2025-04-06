import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/functions/cashe_helper.dart';
import 'package:quick_mart_app/core/utils/app_theme.dart';
import 'package:quick_mart_app/core/utils/constants.dart';
import 'package:quick_mart_app/features/layout/presentation/view/layout_view.dart';
import 'package:quick_mart_app/features/onboarding/presentation/views/onboarding_view.dart';

import 'core/utils/bloc_observar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper.init();
  bool isLoggedIn = CasheHelper.getData(key: isLoggedInK) ?? false;
  String token = CasheHelper.getData(key: tokenK)??"";
  print('isLoggedIn: $isLoggedIn');
  print('token: $token');

  Bloc.observer = MyBlocObserver();
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedIn});
  final bool isLoggedIn;

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
          home: isLoggedIn ? LayoutView() : OnboardingView(),
        );
      },
    );
  }
}
