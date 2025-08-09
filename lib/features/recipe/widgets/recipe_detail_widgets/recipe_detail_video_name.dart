import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';

import '../../../../data/models/recipe_model/detail_model.dart';


class RecipeDetailVideoName extends StatelessWidget {
  const RecipeDetailVideoName({
    super.key, required this.vm,
  });
  final DetailModel vm;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 357.w,
      height: 337.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 357.w,
              height: 337.h,
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 16.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.watermelonRed,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    vm.title,
                    style: AppStyle.w500s20w,
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      SvgPicture.asset(AppSvg.starFilled),
                      Text(
                        "${vm.rating}",
                        style: AppStyle.w400s12w,
                      ),
                      SizedBox(),
                      SvgPicture.asset(AppSvg.reviews),
                      Text(
                        "2.273",
                        style: AppStyle.w400s12w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                vm.videoRecipe,
                width: 357.w,
                height: 281.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 105.h,
            left: 142.w,
            child: Container(
              width: 74.01.w,
              height: 71.46.h,
              padding: EdgeInsets.fromLTRB(
                24.67.w,
                14.7.h,
                19.41.w,
                16.68.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.watermelonRed,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(AppSvg.play),
            ),
          ),
        ],
      ),
    );
  }
}
