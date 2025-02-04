import 'package:quick_mart_app/core/api_service/api_service.dart';
import 'package:quick_mart_app/features/signup/data/data_source/signup_remote_data_source/signup_remote_data_source.dart';
import 'package:quick_mart_app/features/signup/data/model/register_request.dart';
import 'package:quick_mart_app/features/signup/data/model/register_response.dart';

class SignupRemoteDataSourceImpl implements SignupRemoteDataSource {
  ApiService apiService;
  SignupRemoteDataSourceImpl(this.apiService);
  @override
  Future<RegisterResponse> signup(RegisterRequest registerRequest) async {
    var response = await apiService.signup(registerRequest: registerRequest);
    return response;
  }
}
