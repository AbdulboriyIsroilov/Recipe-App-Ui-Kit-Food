import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';

import '../../../data/models/user/profile_model.dart';


class TopChefFollow extends StatelessWidget {
  const TopChefFollow({
    super.key,
    required this.vm,
  });

  final ProfileModel vm;

  @override
  Widget build(BuildContext context) {
    TextStyle? w400s12Theme = Theme.of(context).textTheme.titleLarge;
    return Container(
      width: 356.w,
      height: 49.57.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: BoxBorder.all(
          width: 1.5,
          color: AppColors.pastelPink,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 7.h,
        horizontal: 20.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${vm.recipesCount}",
                style: w400s12Theme,
              ),
              Text(
                "recipes",
                style: w400s12Theme,
              ),
            ],
          ),
          VerticalDivider(
            color: AppColors.pastelPink,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${vm.followingCount}",
                style: w400s12Theme,
              ),
              Text(
                "Following",
                style: w400s12Theme,
              ),
            ],
          ),
          VerticalDivider(
            color: AppColors.pastelPink,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${vm.followerCount}",
                style: w400s12Theme,
              ),
              Text(
                "Followers",
                style: w400s12Theme,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
