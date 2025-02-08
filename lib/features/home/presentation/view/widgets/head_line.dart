import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.04,
              ),
        ),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'SEE ALL',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.cyan,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ],
    );
  }
}
