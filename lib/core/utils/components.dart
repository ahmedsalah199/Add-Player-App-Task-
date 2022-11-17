import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_font.dart';
import 'app_value.dart';

Widget defaultButton(
    {double width = AppSize.s70,
    double height = AppSize.s40,
    double radius = AppSize.s0,
    double fontSize = AppFontSize.s16,
    Color backGround = AppColors.primaryColor,
    required String text,
    required VoidCallback function}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backGround,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: fontSize),
        ),
      ),
    ),
  );
}

Widget defaultTextFormField({
  required TextEditingController controller,
  required IconData prefixIcon,
  required TextInputType keyboardType,
  IconData? suffixIcon,
  VoidCallback? suffixPressed,
  required String label,
  String Function(String)? onChanged,
  String Function(String?)? onFieldSubmitted,
}) {
  return TextFormField(
    controller: controller,
    onChanged: onChanged,
    keyboardType: keyboardType,
    onFieldSubmitted: onFieldSubmitted,
    style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: AppFontSize.s17,
        color: Colors.grey),
    decoration: InputDecoration(
      label: Text(label),
      contentPadding: const EdgeInsets.symmetric(
          vertical: AppPadding.p15, horizontal: AppPadding.p10),
      prefixIcon: Icon(prefixIcon),
      suffixIcon: suffixIcon != null
          ? IconButton(
              onPressed: suffixPressed,
              icon: Icon(suffixIcon),
            )
          : null,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s30.r),
          borderSide: const BorderSide(color: AppColors.primaryColor)),
    ),
  );
}
