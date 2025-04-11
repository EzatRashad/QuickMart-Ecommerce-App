import '../../../data/model/register_request.dart';
import '../../../data/model/register_response.dart';

abstract class SignupRemoteDataSource {
  Future<RegisterResponse> signup(RegisterRequest registerRequest);
}
