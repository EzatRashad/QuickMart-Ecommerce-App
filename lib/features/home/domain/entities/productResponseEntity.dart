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
  List<Subcategory>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;

  Category? category;
  Brand? brand;
  num? ratingsAverage;
}

class Brand {
  Brand({
    this.id,
    this.name,
    this.slug,
    this.image,
  });


  String? id;
  String? name;
  String? slug;
  String? image;

}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
  });



  String? id;
  String? name;
  String? slug;
  String? image;

}

class Subcategory {
  Subcategory({
    this.id,
    this.name,
    this.slug,
    this.category,
  });


  String? id;
  String? name;
  String? slug;
  String? category;

}

