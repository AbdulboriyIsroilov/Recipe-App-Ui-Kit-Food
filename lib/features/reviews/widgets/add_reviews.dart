import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_buttom_popular.dart';

class AddReviews extends StatefulWidget {
  const AddReviews({
    super.key,
  });

  @override
  State<AddReviews> createState() => _AddReviewsState();
}

class _AddReviewsState extends State<AddReviews> {
  int selectedStars = 0;
  TextEditingController commentController = TextEditingController();
  String? selected = "No";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 26.h,
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(5, (index) {
                    return IconButton(
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                        fixedSize: Size(28.57.w, 28.57.h),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedStars = index + 1;
                        });
                      },
                      icon: SvgPicture.asset(
                        width: 28.57.w,
                        height: 28.57.h,
                        index < selectedStars
                            ? AppSvg.starFilled
                            : AppSvg.starEmpty,
                        colorFilter: ColorFilter.mode(
                          AppColors.watermelonRed,
                          BlendMode.modulate,
                        ),
                      ),
                    );
                  }),
                ],
              ),
              Text(
                "Your overall rating",
                style: AppStyle.w400s12w,
              ),
            ],
          ),
        ),
        TextField(
          controller: commentController,
          maxLines: 4,
          style: AppStyle.w500s15w,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 11.w,
              vertical: 11.h,
            ),
            constraints: BoxConstraints(maxWidth: 358.w, maxHeight: 142.18.h),
            filled: true,
            fillColor: AppColors.pastelPink,
            hintText: "Leave us Review!",
            hintStyle: AppStyle.w500s15wr.copyWith(
              color: AppColors.black.withValues(alpha: 0.45),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(
          width: 196.w,
          child: Column(
            spacing: 6.h,
            children: [
              Text(
                "Do you recommend this recipe?",
                style: AppStyle.w400s12w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "No",
                        style: AppStyle.w300s15w,
                      ),
                      Radio<String>(
                        value: "No",
                        groupValue: selected,
                        activeColor: Colors.red,
                        onChanged: (val) {
                          setState(() {
                            selected = val;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Yes",
                        style: AppStyle.w300s15w,
                      ),
                      Radio<String>(
                        value: "Yes",
                        groupValue: selected,
                        activeColor: Colors.red,
                        onChanged: (val) {
                          setState(() {
                            selected = val;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtomPopular(
              title: "cancel",
              width: 168.w,
              height: 29.h,
              style: AppStyle.w500s15wr,
            ),
            TextButtomPopular(
              title: "Submit",
              width: 168,
              height: 29,
              backgroundColor: AppColors.watermelonRed,
              style: AppStyle.w500s15w,
            ),
          ],
        ),
      ],
    );
  }
}
