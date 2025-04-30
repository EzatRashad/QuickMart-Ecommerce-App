import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/features/home/domain/use_case/update_cart_item_quantity_use_case.dart';

import 'core/functions/cashe_helper.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/constants.dart';
import 'core/utils/bloc_observar.dart';
import 'features/home/data/data_source_impl/home_data_source_impl.dart';
import 'features/home/data/home_api_service/home_api.dart';
import 'features/home/data/repo_impl/home_repo_impl.dart';
import 'features/home/domain/use_case/add_to_cart_use_case.dart';
import 'features/home/domain/use_case/delete_item_from_cart.dart';
import 'features/home/domain/use_case/get_cart_items_use_case.dart';
import 'features/home/domain/use_case/get_categories_use_case.dart';
import 'features/home/domain/use_case/get_products_use_case.dart';
import 'features/home/presentation/catigories_cubit/catigories_cubit.dart';
import 'features/home/presentation/get_cart_items_cubit/get_cart_items_cubit.dart';
import 'features/home/presentation/products_cubit/products_cubit.dart';
import 'features/layout/presentation/view/layout_view.dart';
import 'features/onboarding/presentation/views/onboarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper.init();

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
    final homeRepo = HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        homeApiService: HomeApiService(Dio()),
      ),
    );

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => GetCartItemsCubit(
              DeleteItemFromCartUseCase(homeRepo),
              UpdateCartItemQuantityUseCase(homeRepo),
              getCartItemsUseCase: GetCartItemsUseCase(  homeRepo),
            )..getCartItems(),
          ),
          BlocProvider(
            create: (_) => CategoriesCubit(
              getAllCategoriesUseCase: GetAllCategoriesUseCase(homeRepo),
            )..getCategories(),
          ),
          BlocProvider(
            create: (_) => ProductsCubit(
              getProductsUseCase: GetProductsUseCase(homeRepo),
              addToCartUseCase: AddToCartUseCase(homeRepo),
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
