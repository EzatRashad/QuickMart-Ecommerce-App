import 'package:dartz/dartz.dart';
import 'package:quick_mart_app/core/failure/failure.dart';
import 'package:quick_mart_app/features/home/domain/entities/category_entity.dart';
import 'package:quick_mart_app/features/home/domain/entities/get_cart_response_entity.dart';

import '../entities/cart_response_entity/cart_response_entity.dart';
import '../entities/productResponseEntity.dart';

abstract class HomeRepo {
  Future<Either<Failure, CategoryResponseEntity>> getCategories();
  Future<Either<Failure, CategoryResponseEntity>> getBrands();
  Future<Either<Failure, ProductResponseEntity>> getProducts();
  Future<Either<Failure, CartResponseEntity>> addToCart(String productId);
  Future<Either<Failure, GetCartResponseEntity>> getCartItems();
}
