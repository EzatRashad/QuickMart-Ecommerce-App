import 'package:quick_mart_app/features/home/domain/entities/category_entity.dart';

class CategoryResponseModel extends CategoryResponseEntity {
  CategoryResponseModel({
    super.results,
    this.metadata,
    super.data,
  });

  CategoryResponseModel.fromJson(dynamic json) {
    results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Category.fromJson(v));
      });
    }
  }

  Metadata? metadata;
}

class Category extends CategoryEntity {
  Category({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
    this.message,
    this.statusMsg,
  });

  Category.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    message = json['message'];
    statusMsg = json['statusMsg'];
  }

  String? createdAt;
  String? updatedAt;
  String? message;

  String? statusMsg;
}

class Metadata {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  num? currentPage;
  num? numberOfPages;
  num? limit;
}
