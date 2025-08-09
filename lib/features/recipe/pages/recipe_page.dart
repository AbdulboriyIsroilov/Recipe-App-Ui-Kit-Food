import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/router/router_names.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/manegers/recipe_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';

import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeViewModel(),
      builder: (context, child) => Scaffold(
        extendBody: true,
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBarCommon(
          title: "Categories",
        ),
        body: Consumer<RecipeViewModel>(
          builder: (context, vm, child) => vm.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  padding: EdgeInsets.fromLTRB(37.w, 14.h, 37.w, 126.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 38.9.w,
                    mainAxisSpacing: 8.h,
                    mainAxisExtent: 171.55.h,
                  ),
                  itemCount: vm.recipe.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.push(
                          RouterNames.recipeListPage,
                          extra: {
                            "appBarTitle": vm.recipe[index].title,
                            "categoryId": vm.recipe[index].id,
                          },
                        );
                      },
                      child: Column(
                        spacing: 6.h,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.61.r),
                            child: Image.network(
                              vm.recipe[index].image,
                              width: 158.54.w,
                              height: 144.53.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            vm.recipe[index].title,
                            style: AppStyle.w500s15w,
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
        bottomNavigationBar: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BottomNavigationBarGradient(),
            BottomNavigationBarMain(),
          ],
        ),
      ),
    );
  }
}
