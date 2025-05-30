import 'package:dartz/dartz.dart';
import 'package:quick_mart_app/features/home/domain/repo/home_repo.dart';

import '../../../../core/failure/failure.dart';
import '../entities/category_entity.dart';

class GetAllCategoriesUseCase {
  HomeRepo homeRepo;
  GetAllCategoriesUseCase(this.homeRepo);
  Future<Either<Failure, CategoryResponseEntity>> call() {
    return homeRepo.getCategories();
  }
}
