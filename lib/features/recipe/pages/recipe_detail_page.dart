import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/manegers/recipe_detail_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/widgets/recipe_detail_widgets/recipe_detail_profil.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/widgets/recipe_detail_widgets/recipe_detail_lngredients.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/widgets/recipe_detail_widgets/recipe_detail_video_name.dart';

import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';


class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({
    super.key,
    required this.categoryId,
    required this.title,
  });

  final int categoryId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeDetailViewModel(categoryId: categoryId),
      builder: (context, child) => Scaffold(
        extendBody: true,
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBarCommon(
          title: title,
          onPressed: () {
            Navigator.of(context).pop();
          },
          oneButtom: AppSvg.heart,
          twoButtom: AppSvg.share,
        ),
        body: Consumer<RecipeDetailViewModel>(
          builder: (context, vm, child) => vm.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(36.w, 26.h, 37.w, 126.h),
                    child: Column(
                      spacing: 22.h,
                      children: [
                        RecipeDetailVideoName(vm: vm.details, categoriyId: vm.details.id,),
                        RecipeDetailProfil(vm: vm.details),
                        Divider(color: AppColors.watermelonRed),
                        RecipeDetailLngredients(vm: vm.details),
                      ],
                    ),
                  ),
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
