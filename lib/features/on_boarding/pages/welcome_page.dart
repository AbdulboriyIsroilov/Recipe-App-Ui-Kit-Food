import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_button_popular.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/manegers/recipe_view_model.dart';

import '../../../core/router/router_names.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeViewModel(recipeRepo: context.read()),
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
        ),
        body: Consumer<RecipeViewModel>(
          builder: (context, vm, child) => Padding(
            padding: EdgeInsets.fromLTRB(36.w, 5.h, 38.w, 35.35.h),
            child: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 356.w,
                  height: 557.h,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 26.w,
                      mainAxisSpacing: 27.h,
                      mainAxisExtent: 167.h,
                    ),
                    itemCount: vm.recipe.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(14.67.r),
                        child: Image.network(
                          vm.recipe[index].image,
                          width: 166.w,
                          height: 167.h,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "Welcome",
                  style: AppStyles.w600s25w,
                ),
                SizedBox(
                  width: 336.w,
                  child: Text(
                    "Find the best recipes that the world can provide you also with every step that you can learn to increase your cooking skills.",
                    style: AppStyles.w400s13.copyWith(color: Colors.white),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                ),
                TextButtomPopular(title: "I’m New",onPressed: (){context.push(Routers.onBoardingCookingLevelPage);},),
                TextButtomPopular(title: "I’ve been here",onPressed: (){context.go(Routers.login);}, )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
