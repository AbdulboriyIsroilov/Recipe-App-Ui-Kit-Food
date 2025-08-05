import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/manegers/recipe_list_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/widgets/recipe_list_app_bar_bottom.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/widgets/recipe_list_foot.dart';

import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({
    super.key,
    required this.appBarTitle,
    required this.categoryId,
  });

  final String appBarTitle;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoriesViewModel(categoryId: categoryId),
      builder: (context, child) => Consumer<CategoriesViewModel>(
        builder: (context, vm, vhild) => vm.loading
            ? Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                extendBody: true,
                backgroundColor: AppColors.backgroundColor,
                appBar: AppBarCommon(
                  title: appBarTitle,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  bottom: RecipeListAppBarBottom(selectedIndex: categoryId),
                ),
                body: GridView.builder(
                  padding: EdgeInsets.fromLTRB(37.w, 19.h, 37.w, 126.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 19.w,
                    mainAxisSpacing: 30.h,
                    mainAxisExtent: 226.h,
                  ),
                  itemCount: vm.categories.length,
                  itemBuilder: (context, index) {
                    return RecipeListFoot(
                      vm: vm.categories,
                      index: index,
                      categoryId: vm.categories[index].id,
                      title: appBarTitle,
                    );
                  },
                ),
                bottomNavigationBar: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    BottomNavigationBarGradient(),
                    BottomNavigationBarMain(),
                  ],
                ),
              ),
      ),
    );
  }
}
