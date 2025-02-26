
import 'package:dartz/dartz.dart';
import 'package:quick_mart_app/core/failure/failure.dart';
import 'package:quick_mart_app/features/home/domain/entities/category_entity.dart';


abstract class HomeRepo {
  Future<Either<Failure, CategoryResponseEntity>> getCategories();
  Future<Either<Failure, CategoryResponseEntity>> getBrands();

}