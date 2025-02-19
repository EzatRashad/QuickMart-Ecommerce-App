import 'package:dio/dio.dart';
import 'package:quick_mart_app/core/api_service/api_constants.dart';
import 'package:quick_mart_app/features/login/data/model/login_request.dart';
import 'package:quick_mart_app/features/login/data/model/login_response.dart';

import '../../features/signup/data/model/register_request.dart';
import '../../features/signup/data/model/register_response.dart';

class AuthApiService {
     final Dio _dio;

  const AuthApiService(this._dio);

  Future<RegisterResponse> signup({
    required RegisterRequest registerRequest,
  }) async {
    try {
      
      final response = await _dio.post(
        ApiConstants.registerEndPoint,
        data: registerRequest.toJson(),
      );
      final json = await response.data;
      return RegisterResponse.fromJson(json);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw  message ?? 'Failed to Register' ;
    }
  }

  Future<LoginResponse> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      
      final response = await _dio.post(
        ApiConstants.loginEndPoint,
        data: loginRequest.toJson(),
      );
      final json = await response.data;
      return LoginResponse.fromJson(json);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw  message ?? 'Failed to Login' ;
    }
  }
}
