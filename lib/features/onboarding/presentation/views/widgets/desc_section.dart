import 'package:flutter/material.dart';
import 'package:quick_mart_app/core/utils/utils.dart';

class DescSection extends StatelessWidget {
  const DescSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Explore a wide range of products",
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        16.ph,
        Text(
          "Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs.",
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
