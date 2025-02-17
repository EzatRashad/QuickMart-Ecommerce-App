import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/utils.dart';

import '../../../../../core/utils/app_color.dart';
import 'colors_widget.dart';

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {  int selectedColor = 0;
List<Color> colors = [
  AppColors.black,
  AppColors.grey100,
  AppColors.blue,
  AppColors.green
];
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 12.sp),
        ),
        8.ph,
        SizedBox(
          height: 45.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(right: 4.0.w),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = index;
                    });
                  },
                  child: ColorsWidget(
                    selected: selectedColor == index,
                    color: colors[index],
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
