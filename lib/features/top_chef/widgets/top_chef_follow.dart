import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/data/models/top_chef_detail_model/top_chef_detail_model.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/manegers/top_chef_detail_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/widgets/top_chef_profil.dart';

import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';
import '../../recipe/manegers/recipe_list_view_model.dart';
import '../../common/widgets/recipe_image_over.dart';

class TopChefFollow extends StatelessWidget {
  const TopChefFollow({
    super.key,
    required this.vm,
  });

  final TopChefDetailModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 356.w,
      height: 49.57.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: BoxBorder.all(
          color: AppColors.pastelPink,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 7.h,
        horizontal: 20.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${vm.recipesCount}",
                style: AppStyles.w400s12w,
              ),
              Text(
                "recipes",
                style: AppStyles.w400s12w,
              ),
            ],
          ),
          VerticalDivider(
            color: AppColors.pastelPink,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${vm.followingCount}",
                style: AppStyles.w400s12w,
              ),
              Text(
                "Following",
                style: AppStyles.w400s12w,
              ),
            ],
          ),
          VerticalDivider(
            color: AppColors.pastelPink,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${vm.followerCount}",
                style: AppStyles.w400s12w,
              ),
              Text(
                "Followers",
                style: AppStyles.w400s12w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
