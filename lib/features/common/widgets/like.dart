import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';

class Like extends StatefulWidget {
  const Like({
    super.key,
    this.icon = AppSvgies.like,
    this.width = 28,
    this.height = 28,
  });

  final String icon;
  final double width, height;

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width.w,
      height: widget.height.h,
      child: IconButton(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        style: IconButton.styleFrom(
          backgroundColor: like ? AppColors.watermelonRed : AppColors.pastelPink,
        ),
        onPressed: () {
          like = !like;
          setState(() {});
        },
        icon: SvgPicture.asset(
          widget.icon,
          colorFilter: ColorFilter.mode(
            like ? Colors.white : AppColors.rosePink,
            BlendMode.modulate,
          ),
        ),
      ),
    );
  }
}
