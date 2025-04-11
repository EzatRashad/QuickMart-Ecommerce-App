import 'cart_data_entity.dart';

class CartResponseEntity {
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  CartDataEntity? data;

  CartResponseEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

 
}
