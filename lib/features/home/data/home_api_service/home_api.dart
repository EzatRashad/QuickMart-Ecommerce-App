import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quick_mart_app/features/home/data/models/ProductResponseModel.dart';

import '../../../../core/api_service/api_constants.dart';
import '../../../../core/failure/failure.dart';
import '../models/category_model.dart';

class HomeApiService {
  final Dio _dio;

  const HomeApiService(this._dio);

  Future<Either<Failure, CategoryResponseModel>> getCategories() async {
    try {
      final response = await _dio
          .get('${ApiConstants.baseUrl}${ApiConstants.categoriesEndPoint}');
      final json = await response.data;
      var categoryResponseModel = CategoryResponseModel.fromJson(json);
      return Right(categoryResponseModel);
    } catch  (exception) {
      String? message;
      if (exception is DioException) {

       return Left(ServerFailure(errorMessage: exception.response?.data['message']));
      }
      return Left(NetworkFailure(errorMessage: exception.toString()));
    }
  }
  Future<Either<Failure, CategoryResponseModel>> getBrands() async {
    try {
      final response = await _dio
          .get('${ApiConstants.baseUrl}${ApiConstants.brandsEndPoint}');
      final json = await response.data;
      var brandsResponseModel = CategoryResponseModel.fromJson(json);
      return Right(brandsResponseModel);
    } catch  (exception) {
      String? message;
      if (exception is DioException) {

        return Left(ServerFailure(errorMessage: exception.response?.data['message']));
      }
      return Left(NetworkFailure(errorMessage: exception.toString()));
    }
  }
  Future<Either<Failure, ProductResponseModel>> getProducts() async {
    try {
      final response = await _dio
          .get('${ApiConstants.baseUrl}${ApiConstants.productsEndPoint}');
      final json = await response.data;
      var productsResponseModel = ProductResponseModel.fromJson(json);
      return Right(productsResponseModel);
    } catch  (exception) {
      String? message;
      if (exception is DioException) {

        return Left(ServerFailure(errorMessage: exception.response?.data['message']));
      }
      return Left(NetworkFailure(errorMessage: exception.toString()));
    }
  }
}
