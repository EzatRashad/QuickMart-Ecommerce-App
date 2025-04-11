import 'package:quick_mart_app/features/signup/data/model/register_request.dart';

import '../../data/model/register_response.dart';
import '../repo/signup_repo.dart';

class SignupUseCase {
  SignupUseCase({required this.signupRepo});

  SignupRepo signupRepo;
  Future<RegisterResponse> signup(RegisterRequest registerRequest) =>
      signupRepo.signup(registerRequest);
}
