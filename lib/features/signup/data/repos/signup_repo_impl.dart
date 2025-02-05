import 'package:quick_mart_app/features/signup/data/model/register_request.dart';
import 'package:quick_mart_app/features/signup/data/model/register_response.dart';
import 'package:quick_mart_app/features/signup/domain/repo/signup_repo.dart';

import '../../domain/data_source/signup_remote_data_source/signup_remote_data_source.dart';

class SignupRepoImpl implements SignupRepo {
  SignupRemoteDataSource signupRemoteDataSource;
  SignupRepoImpl({required this.signupRemoteDataSource});
  @override
  Future<RegisterResponse> signup(RegisterRequest registerRequest) {
  return  signupRemoteDataSource.signup(registerRequest);
  }
}
