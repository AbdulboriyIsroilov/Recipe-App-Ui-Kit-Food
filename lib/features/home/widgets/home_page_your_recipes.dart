import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/widgets/like.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/utils/app_svg.dart';
import '../manegers/home_view_model.dart';

class HomePageYourRecipes extends StatelessWidget {
  const HomePageYourRecipes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 255.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.watermelonRed,
      ),
      padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 14.h),
      child: Column(
        spacing: 9.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your recipes",
            style: AppStyle.w500s15wr.copyWith(color: AppColors.white),
          ),
          Consumer<HomeViewModel>(
            builder: (context, vm, child) => vm.recipeLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 16.95.w,
                    children: [
                      ...List.generate(vm.recipe.length, (index) {
                        return SizedBox(
                          width: 168.52.w,
                          height: 195.h,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(13.r),
                                  ),
                                  child: Image.network(
                                    vm.recipe[index].photo,
                                    width: 168.52.w,
                                    height: 162.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: 168.52.w,
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(13.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.45,
                                        ),
                                        spreadRadius: 0,
                                        blurRadius: 5,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.w,
                                    vertical: 5.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        vm.recipe[index].title,
                                        style: AppStyle.w400s12rp.copyWith(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Row(
                                        spacing: 26.w,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "${vm.recipe[index].rating}",
                                                style: AppStyle.w400s12rp,
                                              ),
                                              SvgPicture.asset(AppSvg.star),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(AppSvg.clock),
                                              Text(
                                                "${vm.recipe[index].timeRequired}min",
                                                style: AppStyle.w400s12rp,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 7.h,
                                left: 132.w,
                                child: Like(icon: AppSvg.heart),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
