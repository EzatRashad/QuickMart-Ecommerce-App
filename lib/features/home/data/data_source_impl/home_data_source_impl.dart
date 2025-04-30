import 'package:dartz/dartz.dart';
import 'package:quick_mart_app/features/home/data/home_api_service/home_api.dart';
import 'package:quick_mart_app/features/home/domain/entities/get_cart_response_entity.dart';
import 'package:quick_mart_app/features/home/domain/entities/productResponseEntity.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/data_source/home_data_source.dart';
import '../../domain/entities/cart_response_entity/cart_response_entity.dart';
import '../../domain/entities/category_entity.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeApiService   homeApiService;

  HomeRemoteDataSourceImpl({required this.homeApiService});

  @override
  Future<Either<Failure, CategoryResponseEntity>> getCategories() async {
    try {
      var response = await homeApiService.getCategories();
      return response.fold(
        (l) => Left(ServerFailure(errorMessage: l.errorMessage)),
        (r) => Right(r),
      );
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoryResponseEntity>> getBrands() async {
    try {
      var response = await homeApiService.getBrands();
      return response.fold(
        (l) => Left(ServerFailure(errorMessage: l.errorMessage)),
        (r) => Right(r),
      );
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductResponseEntity>> getProducts() async {
    try {
      var response = await homeApiService.getProducts();
      return response.fold(
        (l) => Left(ServerFailure(errorMessage: l.errorMessage)),
        (r) => Right(r),
      );
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartResponseEntity>> addToCart(
      String productId) async {
    try {
      var response = await homeApiService.addToCart(productId);
      return response.fold(
        (l) => Left(ServerFailure(errorMessage: l.errorMessage)),
        (r) => Right(r),
      );
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetCartResponseEntity>> getCartItems() async {
    try {
      
      var response = await homeApiService.getCartItems();
      return response.fold(
          (l) => Left(ServerFailure(errorMessage: l.errorMessage)),
          (r) => Right(r));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, GetCartResponseEntity>> deleteItemFromCart(String productId)async {
    try {
      var response = await homeApiService.deleteItemFromCart(productId);
      return response.fold(
          (l) => Left(ServerFailure(errorMessage: l.errorMessage)),
          (r) => Right(r));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, GetCartResponseEntity>> updateCartItemQuantity(String id, String quantity) async{
     
    try {
      var response = await homeApiService.updateCartItemQuantity(id, quantity);
      return response.fold(
          (l) => Left(ServerFailure(errorMessage: l.errorMessage)),
          (r) => Right(r));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<Either<Failure, CategoryResponseEntity>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CategoryResponseEntity>> getBrands() {
    // TODO: implement getBrands
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProductResponseEntity>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CartResponseEntity>> addToCart(String productId) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, GetCartResponseEntity>> getCartItems() {
    // TODO: implement getCartItems
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, GetCartResponseEntity>> deleteItemFromCart(String productId) {
    // TODO: implement deleteItemFromCart
    throw UnimplementedError();
  }
}
