import '../../domain/entities/get_cart_response_entity.dart';

class GetCartResponseModel extends GetCartResponseEntity {
  GetCartResponseModel({
    super.status,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  GetCartResponseModel.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? GetCartData.fromJson(json['data']) : null;
  }
}

class GetCartData extends GetCartDataEntity {
  GetCartData({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  GetCartData.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetProduct.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class GetProduct extends GetProductsEntity {
  GetProduct({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  GetProduct.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null
        ? GetCartProduct.fromJson(json['product'])
        : null;
    price = json['price'];
  }
}

class GetCartProduct extends GetCartProductEntity {
  GetCartProduct({
    super.subcategory,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
  });

  GetCartProduct.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
  }
}

class Brand extends CartBrandEntity {
  Brand({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  Brand.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class Category extends CartCategoryEntity {
  Category({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  Category.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class Subcategory extends CartSubcategoryEntity {
  Subcategory({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}
