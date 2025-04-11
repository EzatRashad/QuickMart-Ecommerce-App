import 'package:quick_mart_app/features/home/domain/entities/cart_response_entity/cart_response_entity.dart';

import 'cart_data.dart';

class CartModelResponse extends CartResponseEntity {
 

  CartModelResponse({
    super.status,
    super.message,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  factory CartModelResponse.fromJson(Map<String, dynamic> json) =>
      CartModelResponse(
        status: json['status'] as String?,
        message: json['message'] as String?,
        numOfCartItems: json['numOfCartItems'] as int?,
        cartId: json['cartId'] as String?,
        data: json['data'] == null
            ? null
            : CartData.fromJson(json['data'] as Map<String, dynamic>),
      );

  
}
