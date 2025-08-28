import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';


import '../../../data/models/community_models/community_model.dart';


class CommunityColumnRecipies extends StatelessWidget {
  const CommunityColumnRecipies({
    super.key,
    required this.vm, required this.viewModel,
  });

  final List<CommunityModel> vm;
  final Function viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 19.h,
      children: [
        ...List.generate(vm.length, (index) {
          return Column(
            spacing: 15.h,
            children: [
              Row(
                spacing: 14.w,
                children: [
                  ClipOval(
                    child: Image.network(
                      vm[index].user.profilePhoto,
                      width: 35.w,
                      height: 35.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "@${vm[index].user.username}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        viewModel(vm[index].created),
                        style: AppStyles.w400s12wr,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 356.w,
                height: 250.5.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(14.r),
                      ),
                      child: Image.network(
                        vm[index].photo,
                        width: 356.w,
                        height: 173.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: 356.w,
                      height: 77.5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(14.r),
                        ),
                        color: AppColors.watermelonRed,
                      ),
                      padding: EdgeInsets.fromLTRB(15.w, 6.h, 15.w, 6.h),
                      child: Column(
                        children: [
                          Row(
                            spacing: 22.w,
                            children: [
                              Text(
                                vm[index].title,
                                style: AppStyles.w500s15w,
                              ),
                              Row(
                                spacing: 5.w,
                                children: [
                                  SvgPicture.asset(AppSvgies.starFilled),
                                  Text(
                                    "${vm[index].rating}",
                                    style: AppStyles.w400s12w,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 258.31.w,
                                child: Text(
                                  vm[index].description,
                                  style: AppStyles.w300s11w,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    spacing: 6.w,
                                    children: [
                                      SvgPicture.asset(AppSvgies.clock),
                                      Text(
                                        "${vm[index].timeRequired} min",
                                        style: AppStyles.w400s12w,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 6.w,
                                    children: [
                                      Text(
                                        "${vm[index].reviewsCount}",
                                        style: AppStyles.w400s12w,
                                      ),
                                      SvgPicture.asset(AppSvgies.reviews),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: AppColors.watermelonRed),
            ],
          );
        }),
      ],
    );
  }
}
