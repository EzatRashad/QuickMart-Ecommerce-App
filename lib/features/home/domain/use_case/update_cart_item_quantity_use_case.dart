import 'package:dartz/dartz.dart';
import 'package:quick_mart_app/core/failure/failure.dart';
import 'package:quick_mart_app/features/home/domain/entities/get_cart_response_entity.dart';
import 'package:quick_mart_app/features/home/domain/repo/home_repo.dart';

class UpdateCartItemQuantityUseCase {
  final HomeRepo homeRepo;
  UpdateCartItemQuantityUseCase(this.homeRepo);
  Future<Either<Failure, GetCartResponseEntity>> call(String id, String quantity) async {
    return homeRepo.updateCartItemQuantity(id, quantity);
  }
}