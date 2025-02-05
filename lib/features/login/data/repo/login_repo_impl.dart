import 'package:quick_mart_app/features/login/data/model/login_request.dart';

import 'package:quick_mart_app/features/login/data/model/login_response.dart';
import 'package:quick_mart_app/features/login/domain/data_source/login_remote_data_source/login_remote_data_source.dart';

import '../../domain/repo/login_repo.dart';

class LoginRepoImpl implements LoginRepo{
  LoginRemoteDataSource loginRemoteDataSource ;

  LoginRepoImpl({required this.loginRemoteDataSource});
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return loginRemoteDataSource.login(loginRequest);
     
  }
}