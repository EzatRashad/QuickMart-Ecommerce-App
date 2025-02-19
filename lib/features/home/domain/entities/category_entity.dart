class CategoryResponseEntity {
  CategoryResponseEntity({
    this.results,
    this.data,
  });

  num? results;

  List<CategoryEntity>? data;
}

class CategoryEntity {
  CategoryEntity({
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
