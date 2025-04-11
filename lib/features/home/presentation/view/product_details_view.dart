import 'package:flutter/material.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/product_details_view_body.dart';

import '../../domain/entities/productResponseEntity.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductEntity product;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return ProductDetailsViewBody(
      product: widget.product,
    );
  }
}
