import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/theming/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      this.borderRadius,
      this.verticalPadding,
      this.horizontalPadding,
      this.backgroungColor,
      this.titleStyle,
      this.width,
      this.height,
      this.onPressed});
  final String title;
  final double? borderRadius;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Color? backgroungColor;
  final TextStyle? titleStyle;
  final double? width;
  final double? height;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16),
            ),
          ),
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(
                horizontal: horizontalPadding ?? 16.w,
                vertical: verticalPadding ?? 20.h),
          ),
          backgroundColor: WidgetStateProperty.all(
              backgroungColor ?? const Color.fromARGB(255, 29, 86, 133)),
          minimumSize: WidgetStateProperty.all(
            Size(width?.w ?? 200.w, height?.h ?? 30.h),
          ),
        ),
        child: Text(
          title,
          style: titleStyle ?? AppTextStyle.font15WhiteBold,
        ));
  }
}
