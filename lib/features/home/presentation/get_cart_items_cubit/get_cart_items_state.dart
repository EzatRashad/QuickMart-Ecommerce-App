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

class DeleteItemFromCartSuccessState extends GetCartItemsState {
  GetCartResponseEntity items;

  DeleteItemFromCartSuccessState(this.items);
}

class DeleteItemFromCartErrorState extends GetCartItemsState {
  final String message;

  DeleteItemFromCartErrorState(this.message);
}

class DeleteItemFromCartLoadingState extends GetCartItemsState {}


class UpdateItemInCartSuccessState extends GetCartItemsState {
  GetCartResponseEntity items;

  UpdateItemInCartSuccessState(this.items);
}
class UpdateItemInCartErrorState extends GetCartItemsState {
  final String message;

  UpdateItemInCartErrorState(this.message);
}
class UpdateItemInCartLoadingState extends GetCartItemsState {}