import 'package:quick_mart_app/core/api_service/api_service.dart';
import 'package:quick_mart_app/features/login/data/model/login_request.dart';

import 'package:quick_mart_app/features/login/data/model/login_response.dart';

import '../../../domain/data_source/login_remote_data_source/login_remote_data_source.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource{
  ApiService apiService;

  LoginRemoteDataSourceImpl({required this.apiService});
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async{
     var response = await apiService.login( loginRequest: loginRequest);
    return response;
  }
}