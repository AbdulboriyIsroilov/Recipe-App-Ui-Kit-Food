import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/recipe_image_over.dart';
import 'package:recipe_app_ui_kit_food/features/profile/managers/profile_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/profile/widgets/profile192.dart';
import 'package:recipe_app_ui_kit_food/features/profile/widgets/profile63.dart';
import 'package:recipe_app_ui_kit_food/features/profile/widgets/profile97.dart';

import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(profileRepo: context.read(), myRecipeRepo: context.read()),
      builder: (context, child) => Scaffold(
        extendBody: true,
        body: Consumer<ProfileViewModel>(
          builder: (context, vm, child) => CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(37.w, 56.h, 37.w, 17.71.h),
                sliver: SliverPersistentHeader(
                  pinned: true,
                  delegate: MyPersistentHeaderDelegate(),
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Recipe",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        SizedBox(
                          width: 162.5.w,
                          child: Divider(
                            color: AppColors.watermelonRed,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Favorites",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        SizedBox(
                          width: 162.5.w,
                          child: Divider(
                            color: AppColors.watermelonRed,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(37.w, 19.h, 37.w, 0),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18.w,
                    mainAxisSpacing: 31.h,
                    mainAxisExtent: 226.h,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: vm.recipes.length,
                    (context, index) => RecipeImageOver(
                      vm: vm.recipes,
                      index: index,
                    ),
                  ),
                ),
              ),
            ],
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

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  Widget getWidget(double shrinkOffset) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double h = constraints.maxHeight;
        if (h > 145.h) return Profile192();
        if (h > 63.h) return Profile97();
        return Profile63();
      },
    );
  }

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return getWidget(shrinkOffset);
  }

  @override
  double get maxExtent => 192.h;

  // 192
  @override
  double get minExtent => 63.h;

  // 63
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
