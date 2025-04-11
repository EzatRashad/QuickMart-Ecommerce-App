import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/cart_response_entity/cart_response_entity.dart';
import '../repo/home_repo.dart';

class AddToCartUseCase {
  HomeRepo homeRepo;
  AddToCartUseCase(this.homeRepo);
  Future<Either<Failure, CartResponseEntity>> call(String productId) {
    return homeRepo.addToCart(productId);
  }
}
