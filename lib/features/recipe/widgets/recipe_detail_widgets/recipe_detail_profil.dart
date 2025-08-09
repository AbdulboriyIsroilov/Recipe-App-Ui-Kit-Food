import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';


import '../../../../data/models/recipe_model/detail_model.dart';


class RecipeDetailProfil extends StatefulWidget {
  const RecipeDetailProfil({
    super.key,
    required this.vm,
  });

  final DetailModel vm;

  @override
  State<RecipeDetailProfil> createState() => _RecipeDetailProfilState();
}

class _RecipeDetailProfilState extends State<RecipeDetailProfil> {
  bool tap = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(31.5),
          child: Image.network(
            widget.vm.user.profilePhoto,
            width: 61.w,
            height: 63.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 132.87.w,
          height: 33.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "@${widget.vm.user.username}",
                style: AppStyle.w400s12wr,
              ),
              Text(
                "${widget.vm.user.firstName} ${widget.vm.user.lastName}-chef",
                style: AppStyle.w300s14w,
              ),
            ],
          ),
        ),
        Row(
          spacing: 9,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.pastelPink,
                fixedSize: Size(109.09.w, 21.h),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                tap = !tap;
                setState(() {});
              },
              child: Text(
                tap ? "Following" : "Follow",
                style: AppStyle.w500s15w.copyWith(
                  color: AppColors.rosePink,
                ),
              ),
            ),
            SvgPicture.asset(AppSvg.threeDots),
          ],
        ),
      ],
    );
  }
}
