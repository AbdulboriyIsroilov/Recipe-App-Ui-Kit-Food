import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/app_colors.dart';

import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';
import '../manegers/home_view_model.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/home_page_recently.dart';
import '../widgets/home_page_top_chef.dart';
import '../widgets/home_page_trending.dart';
import '../widgets/home_page_your_recipes.dart';
import '../widgets/recipe_list_app_bar_bottom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(homeRepo: context.read())
        ..fetchCategoriy()
        ..fetchRecipe()
        ..fetchTopChef(limit: 4, page: 1)
        ..fetchRecently(),
      builder: (context, child) => Scaffold(
        extendBody: true,
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBarWidget(
          bottom: RecipeListAppBarBottom(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 126.h),
            child: Column(
              spacing: 19.h,
              children: [
                HomePageTrending(),
                HomePageYourRecipes(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 19.h),
                  child: Column(
                    spacing: 19.h,
                    children: [
                      HomePageTopChef(),
                      HomePageRecently(),
                    ],
                  ),
                ),
              ],
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
