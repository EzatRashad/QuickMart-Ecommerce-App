import 'package:dartz/dartz.dart';
import 'package:quick_mart_app/features/home/domain/entities/get_cart_response_entity.dart';
import 'package:quick_mart_app/features/home/domain/repo/home_repo.dart';

import '../../../../core/failure/failure.dart';

class GetCartItemsUseCase {
  HomeRepo homeRepo;
  GetCartItemsUseCase(this.homeRepo,  );
  Future<Either<Failure, GetCartResponseEntity>> call() async {
    return await homeRepo.getCartItems();
  }
}
