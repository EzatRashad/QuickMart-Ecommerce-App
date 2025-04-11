import 'package:quick_mart_app/features/home/domain/entities/productResponseEntity.dart';

import '../../domain/entities/cart_response_entity/cart_response_entity.dart';

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

class AddToCartInitialState extends ProductsState {}

class AddToCartSuccessState extends ProductsState {
  CartResponseEntity cartResponseEntity;
  AddToCartSuccessState(this.cartResponseEntity);
}

class AddToCartErrorState extends ProductsState {
  final String message;

  AddToCartErrorState(this.message);
}

class AddToCartLoadingState extends ProductsState {}
