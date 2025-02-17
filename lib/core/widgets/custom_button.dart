import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:quick_mart_app/core/utils/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
      this.text,
    this.fontSize,
    this.height,
    this.width,
    this.textStyle,
    this.onPressed,
    this.decoration, this.borderColor, this.child,
  });
  final String? text;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final double? height;
  final double? width;
  final Widget? child;
  final TextStyle? textStyle;
  final Function()? onPressed;
  final Decoration? decoration;
   @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 55.h,
        width: width ?? MediaQuery.sizeOf(context).width,
        decoration: decoration ??
            ShapeDecoration(
              color:backgroundColor?? AppColors.black,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.w, color:borderColor??Colors.transparent),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
        child: Center(
          child: text != null ?Text(
            text??"",
            style: textStyle ??
                Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: textColor ?? AppColors.white),
          ):child,
        ),
      ),
    );
  }
}
