import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/app_color.dart';
import 'package:quick_mart_app/core/utils/utils.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({super.key, required this.title, required this.controller, this.obscureText=false, required this.hintText, this.suffixIcon, this.validator});
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        8.ph,
        TextFormField(
          
          validator: validator,
          cursorColor: AppColors.cyan,
          controller:controller ,
          obscureText: obscureText,
          
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText:hintText ,
            hintStyle: Theme.of(context).textTheme.titleSmall,
            enabledBorder:
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: AppColors.grey100,
              width: 0.5,
            ),
            
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
              color: AppColors.cyan,
              width: 1,
            ),
            
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          ),
        )
      ],
    );
  }
}
