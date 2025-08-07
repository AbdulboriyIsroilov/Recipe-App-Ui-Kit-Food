import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/router_names.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_l_ist.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_buttom_popular.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/widgets/cooking_level_text.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/widgets/scroll_conteyner.dart';

import '../../../../../core/utils/app_colors.dart';

import '../../../../../core/utils/app_svg.dart';
import '../../../core/utils/app_style.dart';

class CookingLevelPage extends StatelessWidget {
  const CookingLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            // Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(AppSvg.backArrow),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(15),
          child: ScroolConteyner(
            vm: 0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(36, 55.h, 38, 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text(
              "¿What is your cooking level?",
              style: AppStyle.w600s20w,
            ),
            Text(
              "Please select you cooking level for a better recommendations.",
              style: AppStyle.w400s12w.copyWith(fontSize: 13),
            ),
            ...List.generate(
              AppList.cookingLevel.length,
              (index) {
                return CookingLevelText(index: index);
              },
            ),
            Spacer(),
            Center(
              child: TextButtomPopular(
                title: "Continue",
                backgroundColor: AppColors.watermelonRed,
                foregroundColor: AppColors.white,
                onPressed: (){
                  context.push(RouterNames.onBoardingPreferencesPage,extra: {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
