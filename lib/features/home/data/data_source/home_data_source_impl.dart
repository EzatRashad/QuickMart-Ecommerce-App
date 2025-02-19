import 'package:dartz/dartz.dart';
import 'package:quick_mart_app/features/home/data/home_api_service/home_api.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/data_source/home_data_source.dart';
import '../../domain/entities/category_entity.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeApiService homeApiService;

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
}



class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<Either<Failure, CategoryResponseEntity>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
