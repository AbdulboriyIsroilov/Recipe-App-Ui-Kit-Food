import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/data/models/home_model/top_chef_model.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/widgets/like.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/manegers/top_chef_view_model.dart';

class TopChefViewedChef extends StatelessWidget {
  const TopChefViewedChef({
    super.key,
    required this.vm,
    required this.index,
    this.star = 6687,
    this.follow = false,
  });

  final List<TopChefModel> vm;
  final int index, star;
  final bool follow;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 160.w,
            height: 76.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(14.r),
              ),
            ),
            padding: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 10.h),
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${vm[index].firstName} ${vm[index].lastName}",
                  style: AppStyle.w400s12b,
                  maxLines: 1,
                ),
                Text(
                  "@${vm[index].username}",
                  style: AppStyle.w300s11rp.copyWith(
                    color: AppColors.watermelonRed,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 6,
                      children: [
                        Text(
                          "$star",
                          style: AppStyle.w400s12wr,
                        ),
                        SvgPicture.asset(AppSvg.star),
                      ],
                    ),
                    Row(
                      spacing: 6,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: follow ? AppColors.pastelPink : AppColors.watermelonRed,
                            foregroundColor: follow ? AppColors.rosePink : AppColors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 2,
                            ),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: Size(0, 0),
                          ),
                          onPressed: () {},
                          child: Text(
                            follow ? "Follow" : "Following",
                            style: AppStyle.w500s8,
                          ),
                        ),
                        Container(
                          width: 13.72.w,
                          height: 13.68.h,
                          decoration: BoxDecoration(
                            color: AppColors.watermelonRed,
                            borderRadius: BorderRadius.circular(5.64.r),
                          ),
                          padding: EdgeInsets.all(1),
                          child: SvgPicture.asset(AppSvg.share),
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
              vm[index].profilePhoto,
              width: 170.w,
              height: 153.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
