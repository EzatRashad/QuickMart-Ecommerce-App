class ProductResponseEntity {
  ProductResponseEntity({
    this.results,
    this.data,
  });

  num? results;
  List<ProductEntity>? data;
}

class ProductEntity {
  ProductEntity({
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  List<String>? images;
  List<ProductSubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;

  ProductCategoryEntity? category;
  ProductBrandEntity? brand;
  num? ratingsAverage;
}

class ProductBrandEntity {
  ProductBrandEntity({
    this.id,
    this.name,
  });

  String? id;
  String? name;
}

class ProductCategoryEntity {
  ProductCategoryEntity({
    this.id,
    this.name,

  });

  String? id;
  String? name;

}

class ProductSubcategoryEntity {
  ProductSubcategoryEntity({
    this.id,
    this.name,

    this.category,
  });

  String? id;
  String? name;

  String? category;
}
