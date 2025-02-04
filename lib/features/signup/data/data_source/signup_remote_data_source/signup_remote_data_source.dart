import '../../model/register_request.dart';
import '../../model/register_response.dart';

abstract class SignupRemoteDataSource {
  Future<RegisterResponse> signup(RegisterRequest registerRequest);
} 