import 'package:quick_mart_app/features/home/domain/entities/get_cart_response_entity.dart';

class GetCartItemsState {}

class GetCartItemsInitialState extends GetCartItemsState {}

class GetCartItemsSuccessState extends GetCartItemsState {
  GetCartResponseEntity items;

 GetCartItemsSuccessState(this.items);
}

class GetCartItemsSErrorState extends GetCartItemsState {
  final String message;

  GetCartItemsSErrorState(this.message);
}

class GetCartItemsLoadingState extends GetCartItemsState {}
