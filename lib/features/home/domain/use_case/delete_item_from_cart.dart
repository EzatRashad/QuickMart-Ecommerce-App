import 'package:dartz/dartz.dart';
import 'package:quick_mart_app/features/home/domain/entities/get_cart_response_entity.dart';
import 'package:quick_mart_app/features/home/domain/repo/home_repo.dart';

import '../../../../core/failure/failure.dart';
 
class DeleteItemFromCartUseCase {
  HomeRepo homeRepo;
  DeleteItemFromCartUseCase(this.homeRepo);
  Future<Either<Failure, GetCartResponseEntity>> call(String id) {
    return homeRepo.deleteItemFromCart(id);
  }
}
