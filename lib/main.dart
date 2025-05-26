import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/functions/cashe_helper.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/constants.dart';
import 'core/utils/bloc_observar.dart';
import 'core/utils/locator.dart';
 
import 'features/home/presentation/catigories_cubit/catigories_cubit.dart';
import 'features/home/presentation/get_cart_items_cubit/get_cart_items_cubit.dart';
import 'features/home/presentation/products_cubit/products_cubit.dart';
import 'features/layout/presentation/view/layout_view.dart';
import 'features/onboarding/presentation/views/onboarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper.init();
  await setupLocator();
  bool isLoggedIn = CasheHelper.getData(key: isLoggedInK) ?? false;
  userToken = CasheHelper.getData(key: tokenK);

  Bloc.observer = MyBlocObserver();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => GetCartItemsCubit(
              locator(), // DeleteItemFromCartUseCase
              locator(), // UpdateCartItemQuantityUseCase
              getCartItemsUseCase: locator(),
            )..getCartItems(),
          ),
          BlocProvider(
            create: (_) => CategoriesCubit(
              getAllCategoriesUseCase: locator(),
            )..getCategories(),
          ),
          BlocProvider(
            create: (_) => ProductsCubit(
              getProductsUseCase: locator(),
              addToCartUseCase: locator(),
            )..getProducts(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: AppTheme.currentTheme,
          home: isLoggedIn ? LayoutView() : OnboardingView(),
        ),
      ),
    );
  }
}
