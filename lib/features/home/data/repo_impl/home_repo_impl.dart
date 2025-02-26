import 'package:dartz/dartz.dart';
import 'package:quick_mart_app/core/failure/failure.dart';
import 'package:quick_mart_app/features/home/domain/data_source/home_data_source.dart';
import 'package:quick_mart_app/features/home/domain/entities/category_entity.dart';

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
}
