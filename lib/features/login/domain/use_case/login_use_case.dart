import 'package:quick_mart_app/features/login/data/model/login_request.dart';
import 'package:quick_mart_app/features/login/data/model/login_response.dart';
import 'package:quick_mart_app/features/login/domain/repo/login_repo.dart';

class LoginUseCase {
   LoginRepo loginRepo;

   LoginUseCase(this.loginRepo, );
   Future<LoginResponse>  login(LoginRequest loginRequest) => loginRepo.login(loginRequest);

}