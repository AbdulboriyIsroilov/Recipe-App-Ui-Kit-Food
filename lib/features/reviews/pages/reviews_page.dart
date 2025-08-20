import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/reviews/manegers/reviews_comments_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/reviews/manegers/reviews_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/reviews/widgets/reviews_add_review.dart';
import 'package:recipe_app_ui_kit_food/features/reviews/widgets/reviews_comments.dart';

import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key, required this.categoriyId});

  final int categoriyId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReviewsViewModel(categoryId: categoriyId),
      builder: (context, child) => Scaffold(
        extendBody: true,
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(AppSvg.backArrow),
          ),
          title: Text(
            "Reviews",
            style: AppStyle.w600s20wr,
          ),
          centerTitle: true,
        ),
        body: ChangeNotifierProvider(
          create: (context) => ReviewsCommentViewModel(categoryId: categoriyId),
          builder: (context, child) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 17.h, bottom: 126.h),
              child: Column(
                spacing: 27.75.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReviewsAddReview(),
                  ReviewsComments(),
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
