import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.gen.dart';

class CategoryWidgetModel {
  String? title;
  Widget? image;
  CategoryWidgetModel({required this.title, required this.image});
}

List<CategoryWidgetModel> categoriesList = [
  CategoryWidgetModel(
      title: "Electronics", image: Assets.images.person.image(height: 25.h)),
  CategoryWidgetModel(
      title: "Fashion", image: Assets.images.person.image(height: 25.h)),
  CategoryWidgetModel(
      title: "Furniture", image: Assets.images.person.image(height: 25.h)),
  CategoryWidgetModel(
      title: "Industrial", image: Assets.images.person.image(height: 25.h)),  CategoryWidgetModel(
      title: "Home Decor", image: Assets.images.person.image(height: 25.h)),
  CategoryWidgetModel(
      title: "Electronics", image: Assets.images.person.image(height: 25.h)),
  CategoryWidgetModel(
      title: "Health", image: Assets.images.person.image(height: 25.h)),
 
];
