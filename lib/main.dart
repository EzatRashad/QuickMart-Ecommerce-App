import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/functions/cashe_helper.dart';
import 'package:quick_mart_app/core/utils/app_theme.dart';
import 'package:quick_mart_app/core/utils/constants.dart';
import 'package:quick_mart_app/features/home/domain/use_case/get_categories_use_case.dart';
import 'package:quick_mart_app/features/home/presentation/catigories_cubit/catigories_cubit.dart';
import 'package:quick_mart_app/features/home/presentation/products_cubit/products_cubit.dart';
import 'package:quick_mart_app/features/layout/presentation/view/layout_view.dart';
import 'package:quick_mart_app/features/onboarding/presentation/views/onboarding_view.dart';

import 'core/utils/bloc_observar.dart';
import 'features/home/data/data_source/home_data_source_impl.dart';
import 'features/home/data/home_api_service/home_api.dart';
import 'features/home/data/repo_impl/home_repo_impl.dart';
import 'features/home/domain/use_case/add_to_cart_use_case.dart';
import 'features/home/domain/use_case/get_products_use_case.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper.init();
  bool isLoggedIn = CasheHelper.getData(key: isLoggedInK) ?? false;
  userToken = CasheHelper.getData(key: tokenK);
  print('isLoggedIn: $isLoggedIn');
  print('token: $userToken');

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
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => CategoriesCubit(getAllCategoriesUseCase: GetAllCategoriesUseCase(HomeRepoImpl(
                                homeRemoteDataSource: HomeRemoteDataSourceImpl(
                      homeApiService: HomeApiService(Dio()),
                    ))))..getCategories()),
            BlocProvider(
              create: (context) => ProductsCubit(
                getProductsUseCase: GetProductsUseCase(
                  HomeRepoImpl(
                    homeRemoteDataSource: HomeRemoteDataSourceImpl(
                      homeApiService: HomeApiService(
                        Dio(),
                      ),
                    ),
                  ),
                ),
                addToCartUseCase: AddToCartUseCase(
                  HomeRepoImpl(
                    homeRemoteDataSource: HomeRemoteDataSourceImpl(
                      homeApiService: HomeApiService(
                        Dio(),
                      ),
                    ),
                  ),
                ),
              )..getProducts(),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: AppTheme.currentTheme,
            home: isLoggedIn ? LayoutView() : OnboardingView(),
          ),
        );
      },
    );
  }
}
