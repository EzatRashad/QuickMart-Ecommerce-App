import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_mart_app/features/home/data/data_source_impl/home_data_source_impl.dart';
import 'package:quick_mart_app/features/home/data/home_api_service/home_api.dart';
import 'package:quick_mart_app/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:quick_mart_app/features/home/domain/repo/home_repo.dart';
import 'package:quick_mart_app/features/home/domain/use_case/add_to_cart_use_case.dart';
import 'package:quick_mart_app/features/home/domain/use_case/delete_item_from_cart.dart';
import 'package:quick_mart_app/features/home/domain/use_case/get_cart_items_use_case.dart';
import 'package:quick_mart_app/features/home/domain/use_case/get_categories_use_case.dart';
import 'package:quick_mart_app/features/home/domain/use_case/get_products_use_case.dart';
import 'package:quick_mart_app/features/home/domain/use_case/update_cart_item_quantity_use_case.dart';

import '../../features/home/domain/data_source/home_data_source.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Dio
  locator.registerLazySingleton<Dio>(() => Dio());

  // API Service
  locator
      .registerLazySingleton<HomeApiService>(() => HomeApiService(locator()));

  // Data Source (REGISTER INTERFACE!)
  locator.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(homeApiService: locator()),
  );

  // Repository (interface -> implementation)
  locator.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeRemoteDataSource: locator()),
  );

  // Use Cases
  locator.registerLazySingleton(() => GetAllCategoriesUseCase(locator()));
  locator.registerLazySingleton(() => GetProductsUseCase(locator()));
  locator.registerLazySingleton(() => AddToCartUseCase(locator()));
  locator.registerLazySingleton(() => GetCartItemsUseCase(locator()));
  locator.registerLazySingleton(() => DeleteItemFromCartUseCase(locator()));
  locator.registerLazySingleton(() => UpdateCartItemQuantityUseCase(locator()));
}
