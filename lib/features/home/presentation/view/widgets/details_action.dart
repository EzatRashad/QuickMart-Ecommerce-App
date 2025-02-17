import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_mart_app/core/utils/utils.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/widgets/custom_button.dart';

class DetailsAction extends StatelessWidget {
  const DetailsAction({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Add to cart",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.white),
          ),
          8.pw,
          Icon(
            FontAwesomeIcons.cartShopping,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
