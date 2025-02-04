import 'package:quick_mart_app/features/signup/data/model/register_request.dart';
import 'package:quick_mart_app/features/signup/data/model/register_response.dart';

abstract class SignupRepo {
  Future<RegisterResponse> signup(RegisterRequest registerRequest);
}