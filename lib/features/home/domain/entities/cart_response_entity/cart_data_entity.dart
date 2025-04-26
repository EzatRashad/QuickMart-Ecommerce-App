import 'cart_product_entity.dart';

class CartDataEntity {
  String? id;
  String? cartOwner;
  List<CartProductEntity>? products;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? totalCartPrice;

  CartDataEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}
