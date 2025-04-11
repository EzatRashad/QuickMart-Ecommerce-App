import 'package:dio/dio.dart';
import 'package:quick_mart_app/core/api_service/api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    // String url = Uri.https(ApiConstants.baseUrl, endPoint, {
    //
    // }).toString();
    var response = await _dio.get('${ApiConstants.baseUrl}$endPoint');
    return response.data;
  }
}
