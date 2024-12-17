import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/core/theming/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.enabledBorderColor,
      this.focusdBorderColor,
      this.enabledBorder,
      this.focusedBorder,
      this.horizontalPadding,
      this.hintTextStyle,
      this.suffixIconColor,
      this.backgroundColor,
      this.obscureText,
      this.verticalPadding,
      this.borderRadius,
      this.controller,
      this.checkValidation});
  final String hintText;
  final Widget? suffixIcon;
  final Color? enabledBorderColor;
  final Color? focusdBorderColor;
  final double? enabledBorder;
  final double? focusedBorder;
  final double? horizontalPadding;
  final double? verticalPadding;
  final TextStyle? hintTextStyle;
  final Color? suffixIconColor;
  final Color? backgroundColor;
  final bool? obscureText;
  final double? borderRadius;
  final TextEditingController? controller;
  final String? Function(String?)? checkValidation;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: checkValidation ?? defaultCheckValidation,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: enabledBorderColor ?? AppColors.darkGrey),
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: focusdBorderColor ?? AppColors.mainDarkBlue),
          borderRadius: BorderRadius.circular(borderRadius ?? 16.sp),
        ),
        errorBorder: customErrorBorder(),
        focusedErrorBorder: customErrorBorder(),
        contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 17.w,
            vertical: verticalPadding ?? 20.h),
        hintText: hintText,
        hintStyle: hintTextStyle ?? AppTextStyle.font15WhiteRegular,
        suffixIcon: suffixIcon ,
        filled: true,
        fillColor: backgroundColor ?? Colors.white,
      ),
      obscureText: obscureText ?? false,
    );
  }

  String? defaultCheckValidation(value) {
    if (value == null || value.isEmpty) {
      return 'this field is required';
    } else {
      return null;
    }
  }

  OutlineInputBorder customErrorBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    );
  }
}
