
import 'package:quick_mart_app/features/home/domain/entities/productResponseEntity.dart';

class ProductsState {}

class ProductsInitialState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  ProductResponseEntity products;

  ProductsSuccessState(this.products);
}

class ProductsSErrorState extends ProductsState {
  final String message;

  ProductsSErrorState(this.message);
}

class ProductsLoadingState extends ProductsState {}
