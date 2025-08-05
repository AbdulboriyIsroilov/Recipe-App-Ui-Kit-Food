import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/manegers/recipe_view_model.dart';

import 'bottom_item.dart';

class RecipeListAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const RecipeListAppBarBottom({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Size get preferredSize => Size(double.infinity, 25.h);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>RecipeViewModel(),
      builder: (context, child) {
        return Consumer<RecipeViewModel>(
          builder: (context, vm, child) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 39.w, vertical: 7.h),
                child: Row(
                  spacing: 19.w,
                  children: List.generate(
                    vm.recipe.length,
                        (index) => BottomItem(
                      id: vm.recipe[index].id,
                      title: vm.recipe[index].title,
                      isSelected: vm.recipe[index].id == selectedIndex,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
