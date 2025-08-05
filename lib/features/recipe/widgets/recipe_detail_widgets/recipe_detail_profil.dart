import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/manegers/recipe_detail_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/widgets/recipe_detail_widgets/recipe_detail_lngredients.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/widgets/recipe_detail_widgets/recipe_detail_video_name.dart';

import '../../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../../common/widgets/bottom_navigation_bar_main.dart';


class RecipeDetailProfil extends StatelessWidget {
  const RecipeDetailProfil({
    super.key, required this.vm,
  });

  final Map vm;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(31.5),
          child: Image.network(
            vm["user"]["profilePhoto"],
            width: 61.w,
            height: 63.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 132.87.w,
          height: 33.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "@${vm["user"]["username"]}",
                style: AppStyle.w400s12wr,
              ),
              Text(
                "${vm["user"]["firstName"]} ${vm["user"]["lastName"]}-chef",
                style: AppStyle.w300s14w,
              ),
            ],
          ),
        ),
        Row(
          spacing: 9,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.pastelPink,
                fixedSize: Size(109.09.w, 21.h),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: Text(
                "Following",
                style: AppStyle.w500s15w.copyWith(
                  color: AppColors.rosePink,
                ),
              ),
            ),
            SvgPicture.asset(AppSvg.threeDots),
          ],
        ),
      ],
    );
  }
}
