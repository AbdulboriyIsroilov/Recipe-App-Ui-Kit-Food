import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_svg.dart';

class BottomNavigationBarMain extends StatelessWidget {
  const BottomNavigationBarMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 34.h),
      child: Container(
        width: 281.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: AppColors.watermelonRed,
          borderRadius: BorderRadius.circular(33.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => context.go(Routers.home),
              icon: SvgPicture.asset(AppSvgies.home),
            ),
            IconButton(
              onPressed: () => context.go(Routers.community),
              icon: SvgPicture.asset(AppSvgies.community),
            ),
            IconButton(
              onPressed: () => context.go(Routers.recipePage),
              icon: SvgPicture.asset(AppSvgies.categories),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppSvgies.profile),
            ),
          ],
        ),
      ),
    );
  }
}
