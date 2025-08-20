import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';

class TextButtomPopular extends StatelessWidget {
  const TextButtomPopular({
    super.key,
    required this.title,
    this.onPressed = _defaultOnPressed,
    this.backgroundColor = AppColors.pastelPink,
    this.foregroundColor = AppColors.rosePink,
    this.width = 207,
    this.height = 45,
    this.style = AppStyle.w600s20,
  });

  static void _defaultOnPressed() {}
  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor, foregroundColor;
  final double width, height;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(width.w, height.h),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: style,
      ),
    );
  }
}
