import 'package:dartz/dartz.dart';
import 'package:quick_mart_app/core/failure/failure.dart';
import 'package:quick_mart_app/features/home/domain/data_source/home_data_source.dart';
import 'package:quick_mart_app/features/home/domain/entities/category_entity.dart';
import 'package:quick_mart_app/features/home/domain/entities/get_cart_response_entity.dart';
import 'package:quick_mart_app/features/home/domain/entities/productResponseEntity.dart';

import '../../domain/entities/cart_response_entity/cart_response_entity.dart';
import '../../domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRemoteDataSource homeRemoteDataSource;

  //HomeLocalDataSource homeLocalDataSource;
  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, CategoryResponseEntity>> getCategories() {
    return homeRemoteDataSource.getCategories();
  }

  @override
  Future<Either<Failure, CategoryResponseEntity>> getBrands() {
    return homeRemoteDataSource.getBrands();
  }

  @override
  Future<Either<Failure, ProductResponseEntity>> getProducts() {
    return homeRemoteDataSource.getProducts();
  }

  @override
  Future<Either<Failure, CartResponseEntity>> addToCart(String productId) {
    return homeRemoteDataSource.addToCart(productId);
  }

  @override
  Future<Either<Failure, GetCartResponseEntity>> getCartItems() {
    return homeRemoteDataSource.getCartItems();
  }
}
