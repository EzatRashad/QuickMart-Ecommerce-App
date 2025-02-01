import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/assets.gen.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 300,
      decoration: ShapeDecoration(
        color: AppColors.cyan50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: Assets.images.onlineShopping.image(),
    );
  }
}
