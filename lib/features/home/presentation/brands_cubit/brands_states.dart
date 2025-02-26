import 'package:quick_mart_app/features/home/domain/entities/category_entity.dart';

abstract class BrandsStates{}
  class GetBrandsInitialState extends BrandsStates {}

class GetBrandsSuccessState extends BrandsStates {
  CategoryResponseEntity brands;

  GetBrandsSuccessState(this.brands);
}

class GetBrandsSErrorState extends BrandsStates {
  final String message;

  GetBrandsSErrorState(this.message);
}

class GetBrandsLoadingState extends BrandsStates {}
