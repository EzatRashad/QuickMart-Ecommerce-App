import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorsWidget extends StatelessWidget {
  const ColorsWidget({super.key, required this.selected, required this.color});
  final bool selected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return selected
        ? Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Container(
              width: 45.w,
              height: 45.h,
              decoration: ShapeDecoration(
                color: color,
                shape: CircleBorder(
                  side: BorderSide(width: 2, color: Color(0xFF1F8BDA)),
                ),
              ),
            ),
          )
        : Container(
            width: 45.w,
            height: 45.h,
            decoration: ShapeDecoration(color: color, shape: CircleBorder()),
          );
  }
}
