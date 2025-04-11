import 'package:flutter/material.dart';
import 'package:quick_mart_app/core/utils/utils.dart';

import '../utils/app_color.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle(
      {super.key,
      required this.title,
      required this.span1,
      required this.span2,
      required this.onTap});
  final String title;
  final String span1;
  final String span2;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        8.ph,
        GestureDetector(
          onTap: onTap,
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                text: span1,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              TextSpan(
                text: span2,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: AppColors.cyan),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
