
import 'package:quick_mart_app/features/home/domain/entities/category_entity.dart';

import '../../data/models/category_model.dart';



class HomeState {}

class HomeInitialState extends HomeState {}


class GetCategoriesSuccessState extends HomeState {
  CategoryResponseEntity categories;

   GetCategoriesSuccessState(this.categories);
}

class GetCategoriesSErrorState extends HomeState {
  final String message;

  GetCategoriesSErrorState(this.message);
}

class GetCategoriesLoadingState extends HomeState {}