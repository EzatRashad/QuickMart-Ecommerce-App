import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quick_mart_app/core/utils/constants.dart';
import 'package:quick_mart_app/features/home/data/models/ProductResponseModel.dart';
import 'package:quick_mart_app/features/home/data/models/get_cart_response_model.dart';
import '../../../../core/api_service/api_constants.dart';
import '../../../../core/failure/failure.dart';
import '../models/cart_model_response/cart_model_response.dart';
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
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        return Left(
            ServerFailure(errorMessage: exception.response?.data['message']));
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
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        return Left(
            ServerFailure(errorMessage: exception.response?.data['message']));
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
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        return Left(
            ServerFailure(errorMessage: exception.response?.data['message']));
      }
      return Left(NetworkFailure(errorMessage: exception.toString()));
    }
  }

  Future<Either<Failure, CartModelResponse>> addToCart(String productId) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.baseUrl}${ApiConstants.addToCartEndPoint}',
        data: {
          'productId': productId,
        },
        options: Options(
          headers: {
            'token': userToken,
          },
        ),
      );
      final json = await response.data;
      var cartModelResponse = CartModelResponse.fromJson(json);
      return Right(cartModelResponse);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        return Left(
            ServerFailure(errorMessage: exception.response?.data['message']));
      }
      return Left(NetworkFailure(errorMessage: exception.toString()));
    }
  }

  Future<Either<Failure, GetCartResponseModel>> getCartItems() async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.getCartEndPoint}',
        options: Options(
          headers: {
            'token': userToken,
          },
        ),
      );
      final json = await response.data;
      var getCartitemssResponseModel = GetCartResponseModel.fromJson(json);
      return Right(getCartitemssResponseModel);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        return Left(
            ServerFailure(errorMessage: exception.response?.data['message']));
      }
      return Left(NetworkFailure(errorMessage: exception.toString()));
    }
  }

  Future<Either<Failure, GetCartResponseModel>> deleteItemFromCart(
      String id) async {
    try {
      final response = await _dio.delete(
        '${ApiConstants.baseUrl}${ApiConstants.deleteItem}$id',
        options: Options(
          headers: {
            'token': userToken,
          },
        ),
      );
      final json = await response.data;
      var deleteItemFromCartResponseModel = GetCartResponseModel.fromJson(json);
      return Right(deleteItemFromCartResponseModel);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        return Left(
            ServerFailure(errorMessage: exception.response?.data['message']));
      }
      return Left(NetworkFailure(errorMessage: exception.toString()));
    }
  }

  Future<Either<Failure, GetCartResponseModel>> updateCartItemQuantity(
      String id, String quantity) async {
    try {
      print("1");
      print(id);
      print(quantity);
      print(userToken);

      final response = await _dio.put(
        '${ApiConstants.baseUrl}${ApiConstants.updateItem}$id',
        data: {
          'count': quantity,
        },

        options: Options(
          headers: {
            'token': userToken,
          },
        ),
      );
      print("2");

      final json = await response.data;
      var updateCartItemResponseModel = GetCartResponseModel.fromJson(json);
      return Right(updateCartItemResponseModel);
    } catch (exception) {
      print("3");
      String? message;
      print(message);
      if (exception is DioException) {

        return Left(
            ServerFailure(errorMessage: exception.response?.data['message']));
      }
      return Left(NetworkFailure(errorMessage: exception.toString()));
    }
  }
}
