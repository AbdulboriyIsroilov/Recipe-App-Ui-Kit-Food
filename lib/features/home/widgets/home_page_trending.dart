import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/widgets/like.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/utils/app_svg.dart';
import '../manegers/home_view_model.dart';

class HomePageTrending extends StatelessWidget {
  const HomePageTrending({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, vm, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 19.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 9.h,
          children: [
            Text(
              "Trending Recipe",
              style: AppStyles.w500s15wr,
            ),
            GestureDetector(
              onTap: (){
                context.push(Routers.trendingRecipes);
              },
              child: SizedBox(
                width: 358.w,
                height: 182.h,
                child: vm.trendingRecipeLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 348.w,
                              height: 49.h,
                              decoration: BoxDecoration(
                                border: BoxBorder.all(
                                  color: AppColors.rosePink,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(14.r),
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.fromLTRB(
                                11.w,
                                11,
                                11.w,
                                1,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 264.31.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          vm.trendingRecipe.title,
                                          style: AppStyles.w400s13w,
                                        ),
                                        Text(
                                          vm.trendingRecipe.description,
                                          style: AppStyles.w300s13w,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        spacing: 6,
                                        children: [
                                          SvgPicture.asset(AppSvgies.clock),
                                          Text(
                                            "${vm.trendingRecipe.timeRequired}min",
                                            style: AppStyles.w400s12rp,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        spacing: 6,
                                        children: [
                                          Text(
                                            "${vm.trendingRecipe.rating}",
                                            style: AppStyles.w400s12rp,
                                          ),
                                          SvgPicture.asset(AppSvgies.star),
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
                                vm.trendingRecipe.photo,
                                width: 358.w,
                                height: 143.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 7.h,
                            left: 322.w,
                            child: Like(icon: AppSvgies.heart),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
