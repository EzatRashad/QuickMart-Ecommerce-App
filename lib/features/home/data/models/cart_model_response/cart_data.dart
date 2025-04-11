import '../../../domain/entities/cart_response_entity/cart_data_entity.dart';
import 'cart_product.dart';

class CartData extends CartDataEntity {
  CartData({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        id: json['_id'] as String?,
        cartOwner: json['cartOwner'] as String?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => CartProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        totalCartPrice: json['totalCartPrice'] as int?,
      );
}
