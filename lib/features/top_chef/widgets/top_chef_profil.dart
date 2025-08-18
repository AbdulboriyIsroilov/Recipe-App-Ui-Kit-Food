import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/data/models/top_chef_detail_model/top_chef_detail_model.dart';


class TopChefProfil extends StatelessWidget {
  const TopChefProfil({
    super.key, required this.vm,
  });
  final TopChefDetailModel vm;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 97.h,
      child: Row(
        spacing: 13.w,
        children: [
          ClipOval(
            child: Image.network(
              vm.profilePhoto,
              width: 102.w,
              height: 97.h,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            spacing: 5.5.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${vm.firstName} ${vm.lastName}-chef",
                style: AppStyle.w500s15wr,
              ),
              Text(
                vm.presentation,
                style: AppStyle.w300s11rp.copyWith(
                  color: Colors.white,
                ),
                maxLines: 2,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.pastelPink,
                  foregroundColor: AppColors.watermelonRed,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 2,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size(0, 0),
                ),
                onPressed: () {},
                child: Text(
                  "Following",
                  style: AppStyle.w500s8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
