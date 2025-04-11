import 'package:quick_mart_app/features/login/data/model/login_request.dart';
import 'package:quick_mart_app/features/login/data/model/login_response.dart';

abstract class LoginRepo {
  Future<LoginResponse> login(LoginRequest loginRequest);
}
