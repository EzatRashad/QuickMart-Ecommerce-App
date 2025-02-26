
import 'package:dartz/dartz.dart';
import 'package:quick_mart_app/features/home/domain/repo/home_repo.dart';

import '../../../../core/failure/failure.dart';
import '../entities/category_entity.dart';


class GetBrandsUseCase {
  HomeRepo homeRepo;
  GetBrandsUseCase(this.homeRepo);
  Future<Either<Failure, CategoryResponseEntity>> call() {
    return homeRepo.getBrands();
  }


}