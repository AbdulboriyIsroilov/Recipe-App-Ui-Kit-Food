import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/widgets/like.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/utils/app_svg.dart';
import '../manegers/home_view_model.dart';

class HomePageRecently extends StatelessWidget {
  const HomePageRecently({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recently Added",
          style: AppStyle.w500s15wr,
        ),
        Consumer<HomeViewModel>(
          builder: (context, vm, child) => vm.recentlyLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Row(
                  spacing: 18.47.w,
                  children: [
                    ...List.generate(vm.recently.length, (index) {
                      return SizedBox(
                        width: 168.52.w,
                        height: 226.h,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: 158.52.w,
                                height: 76.h,
                                padding: EdgeInsets.fromLTRB(
                                  15.w,
                                  2.h,
                                  15.w,
                                  7.h,
                                ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          vm.recently[index].title,
                                          style: AppStyle.w400s12rp.copyWith(
                                            color: AppColors.black,
                                          ),
                                        ),
                                        Text(
                                          vm.recently[index].description,
                                          style: AppStyle.w300s13w.copyWith(
                                            color: AppColors.black,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          spacing: 6.w,
                                          children: [
                                            Text(
                                              "${vm.recently[index].rating}",
                                              style: AppStyle.w400s12rp,
                                            ),
                                            SvgPicture.asset(AppSvg.star),
                                          ],
                                        ),
                                        Row(
                                          spacing: 6.w,
                                          children: [
                                            SvgPicture.asset(AppSvg.clock),
                                            Text(
                                              "${vm.recently[index].timeRequired}min",
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
                            Align(
                              alignment: Alignment.topCenter,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14.r),
                                child: Image.network(
                                  vm.recently[index].photo,
                                  width: 169.w,
                                  height: 153.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 7.h,
                              left: 133.w,
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
    );
  }
}
