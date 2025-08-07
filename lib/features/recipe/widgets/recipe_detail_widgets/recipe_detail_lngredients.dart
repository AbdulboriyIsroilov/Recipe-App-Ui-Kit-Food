import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/data/recipe_model/detail_model.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/manegers/recipe_detail_view_model.dart';

import '../../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../../common/widgets/bottom_navigation_bar_main.dart';

class RecipeDetailLngredients extends StatelessWidget {
  const RecipeDetailLngredients({
    super.key, required this.vm,
  });
  final DetailModel vm;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 31.h,
      children: [
        Column(
          spacing: 5,
          children: [
            Row(
              spacing: 7,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Details",
                  style: AppStyle.w600s20wr,
                ),
                SizedBox(),
                SvgPicture.asset(AppSvg.clock),
                Text(
                  "${vm.timeRequired}min",
                  style: AppStyle.w400s12w,
                ),
              ],
            ),
            Text(
              vm.description,
              style: AppStyle.w400s12w,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Text(
              "Ingredients",
              style: AppStyle.w600s20wr,
            ),
            SizedBox(
              width: 358.w,
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(
                        vm.ingredients.length,
                        (index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 3,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "•  ${vm.ingredients[index].order}",
                                  style: AppStyle.w400s12wr,
                                ),
                              ),
                              SizedBox(
                                width: 335.w,
                                child: Text(
                                  "${vm.ingredients[index].amount} ${vm.ingredients[index].name}",
                                  style: AppStyle.w400s12w,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 11,
          children: [
            Text(
              "6 easy Steps",
              style: AppStyle.w600s20wr,
            ),
            ...List.generate(
              vm.instructions.length,
              (index) {
                return Container(
                  width: 356.w,
                  height: 81.h,
                  decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? AppColors.rosePink
                        : AppColors.pastelPink,
                    borderRadius: BorderRadius.circular(
                      14.r,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 14.h,
                  ),
                  alignment: Alignment.center,
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 3,
                      children: [
                        Text(
                          "${vm.instructions[index].order}.",
                          style: AppStyle.w400s12b,
                        ),
                        SizedBox(
                          width: 330.w,
                          child: Text(
                            "${vm.instructions[index].text}",
                            style: AppStyle.w400s12b,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
