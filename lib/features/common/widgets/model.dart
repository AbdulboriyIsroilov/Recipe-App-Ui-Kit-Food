import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/router_names.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_svg.dart';

class Model extends StatelessWidget {
  const Model({
    super.key,
    required this.title1,
    required this.title2,
  });

  final String title1, title2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 249.w,
        height: 265.2.h,
        padding: EdgeInsets.fromLTRB(36, 23, 36, 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 133.w,
              height: 52.h,
              child: Text(
                title1,
                style: AppStyles.w600s20,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 82.2.w,
              height: 82.2.h,
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 18,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.pastelPink,
              ),
              child: SvgPicture.asset(
                AppSvgies.profile,
                colorFilter: ColorFilter.mode(
                  AppColors.watermelonRed,
                  BlendMode.modulate,
                ),
              ),
            ),
            Text(
              title2,
              style: AppStyles.w400s13,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                context.go(Routers.home);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.watermelonRed,
              ),
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}