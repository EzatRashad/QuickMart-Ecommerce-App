import 'package:quick_mart_app/features/home/domain/entities/category_entity.dart';

class CategoriesState {}

class CategoriesInitialState extends CategoriesState {}

class GetCategoriesSuccessState extends CategoriesState {
  CategoryResponseEntity categories;

  GetCategoriesSuccessState(this.categories);
}

class GetCategoriesSErrorState extends CategoriesState {
  final String message;

  GetCategoriesSErrorState(this.message);
}

class GetCategoriesLoadingState extends CategoriesState {}
