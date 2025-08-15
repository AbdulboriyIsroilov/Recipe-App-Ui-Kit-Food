import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';

class Like extends StatefulWidget {
  const Like({
    super.key, this.icon = AppSvg.like,
  });

  final String icon;
  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28.w,
      height: 28.h,
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
            like ? AppColors.white : AppColors.rosePink,
            BlendMode.modulate,
          ),
        ),
      ),
    );
  }
}
