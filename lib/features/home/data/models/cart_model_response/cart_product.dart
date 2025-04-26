import '../../../domain/entities/cart_response_entity/cart_product_entity.dart';

class CartProduct extends CartProductEntity {
  CartProduct({super.count, super.id, super.product, super.price});

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        count: json['count'] as int?,
        id: json['_id'] as String?,
        product: json['product'] as String?,
        price: json['price'] as int?,
      );
}
