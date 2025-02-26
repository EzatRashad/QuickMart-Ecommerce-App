
import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/category_entity.dart';
import '../entities/productResponseEntity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, CategoryResponseEntity>> getCategories();
  Future<Either<Failure, CategoryResponseEntity>> getBrands();
  Future<Either<Failure, ProductResponseEntity>> getProducts();

}

abstract class HomeLocalDataSource {
  Future<Either<Failure, CategoryResponseEntity>> getCategories();
  Future<Either<Failure, CategoryResponseEntity>> getBrands();
  Future<Either<Failure, ProductResponseEntity>> getProducts();




}
