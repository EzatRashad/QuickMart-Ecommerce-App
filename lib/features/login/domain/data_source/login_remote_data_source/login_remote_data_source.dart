import '../../../data/model/login_request.dart';
import '../../../data/model/login_response.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
}
