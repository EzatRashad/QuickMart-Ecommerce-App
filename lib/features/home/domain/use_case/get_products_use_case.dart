
import 'package:dartz/dartz.dart';
import 'package:quick_mart_app/features/home/domain/repo/home_repo.dart';

import '../../../../core/failure/failure.dart';
import '../entities/productResponseEntity.dart';


class GetProductsUseCase {
  HomeRepo homeRepo;
  GetProductsUseCase(this.homeRepo);
  Future<Either<Failure, ProductResponseEntity>> call() {
    return homeRepo.getProducts();
  }


}