import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';
import 'package:recipe_app_ui_kit_food/features/trending_recipes/widgets/trending_recipes_viewed.dart';

import '../../../core/router/router_names.dart';
import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';
import '../../recipe/manegers/recipe_list_view_model.dart';
import '../manegers/trending_recipes_view_model.dart';

class TrendingRecipesPage extends StatelessWidget {
  const TrendingRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoriesViewModel(categoryId: 2),
      builder: (context, child) => Scaffold(
        extendBody: true,
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBarCommon(title: "Trending Recipes",onPressed: (){Navigator.of(context).pop();},),
        body: ChangeNotifierProvider(
          create: (context) => TrendingRecipesViewModel(),
          builder: (context, child) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 31.h, bottom: 126.h),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 241.h,
                    padding: EdgeInsets.fromLTRB(36.w, 9.h, 36.w, 18.h),
                    decoration: BoxDecoration(
                      color: AppColors.watermelonRed,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "most viewed today",
                          style: AppStyle.w500s15w,
                        ),
                        TrendingRecipesViewed(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(36.w, 31.h, 36.w, 0),
                    child: Consumer<CategoriesViewModel>(
                      builder: (context, vm, child) => Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        spacing: 15,
                        children: [
                          Text(
                            "See All",
                            style: AppStyle.w500s12wr.copyWith(decoration: TextDecoration.underline,decorationColor: AppColors.watermelonRed),
                          ),
                          ...List.generate(vm.categories.length, (index) {
                            return GestureDetector(
                              onTap: (){
                                context.push(
                                  RouterNames.recipeDetailPage,
                                  extra: {
                                    "title": vm.categories[index].title,
                                    "categoryId": vm.categories[index].id,
                                  },
                                );
                              },
                              child: SizedBox(
                                width: 358.w,
                                height: 150.h,
                                child: vm.loading
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              width: 207.w,
                                              height: 122.h,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                      right: Radius.circular(
                                                        14.r,
                                                      ),
                                                    ),
                                              ),
                                              padding: EdgeInsets.all(10.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                spacing: 6.h,
                                                children: [
                                                  Text(
                                                    vm.categories[index].title,
                                                    style: AppStyle.w400s12b,
                                                  ),
                                                  Text(
                                                    vm
                                                        .categories[index]
                                                        .description,
                                                    style: AppStyle.w300s13b,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    "By Chef Josh Ryan",
                                                    style: AppStyle.w300s13b
                                                        .copyWith(
                                                          color: AppColors
                                                              .watermelonRed,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        spacing: 5,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          SvgPicture.asset(
                                                            AppSvg.clock,
                                                          ),
                                                          Text(
                                                            "${vm.categories[index].timeRequired}min",
                                                            style: AppStyle.w400s12wr,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        spacing: 5,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            vm
                                                                .categories[index]
                                                                .difficulty,
                                                          ),
                                                          SvgPicture.asset(
                                                            AppSvg.reyting,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        spacing: 5,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            "${vm.categories[index].rating}",
                                                          ),
                                                          SvgPicture.asset(
                                                            AppSvg.star,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              14.r,
                                            ),
                                            child: Image.network(
                                              vm.categories[index].photo,
                                              width: 151.w,
                                              height: 150.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
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
