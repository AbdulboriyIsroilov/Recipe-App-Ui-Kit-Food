import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/router_names.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/pages/recipe_detail_page.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/widgets/like.dart';

import '../../../data/recipe_model/categories_model.dart';

class RecipeListFoot extends StatelessWidget {
  const RecipeListFoot({
    super.key,
    required this.vm,
    required this.index,
    required this.categoryId,
    required this.title,
  });

  final List<CategoriesModel> vm;
  final int index, categoryId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          RouterNames.recipeDetailPage,
          extra: {
            "title": title,
            "categoryId": categoryId,
          },
        );
      },
      child: SizedBox(
        width: 168.5.w,
        height: 226.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 158.5.w,
                height: 76.h,
                padding: EdgeInsets.fromLTRB(15.w, 2.h, 15.w, 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(14.r),
                  ),
                  color: AppColors.white,
                  border: BoxBorder.all(
                    color: AppColors.rosePink,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      vm[index].title,
                      style: AppStyle.w400s12b,
                    ),
                    Text(
                      vm[index].description,
                      style: AppStyle.w300s13b,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 6.w,
                          children: [
                            Text(
                              "${vm[index].rating}",
                              style: AppStyle.w300s11rp,
                            ),
                            SvgPicture.asset(AppSvg.star),
                          ],
                        ),
                        Row(
                          spacing: 6.w,
                          children: [
                            SvgPicture.asset(AppSvg.clock),
                            Text(
                              "${vm[index].timeRequired}min",
                              style: AppStyle.w300s11rp,
                            ),
                          ],
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
                borderRadius: BorderRadius.circular(14.r),
                child: Image.network(
                  vm[index].photo,
                  width: 169.w,
                  height: 153.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 7.h,
              left: 133.w,
              child: Like(),
            ),
          ],
        ),
      ),
    );
  }
}
