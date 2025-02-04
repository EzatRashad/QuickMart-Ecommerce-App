import 'package:dio/dio.dart';
import 'package:quick_mart_app/core/api_service/api_constants.dart';

import '../../features/signup/data/model/register_request.dart';
import '../../features/signup/data/model/register_response.dart';

class ApiService {
     final Dio _dio;

  const ApiService(this._dio);

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
}
