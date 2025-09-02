import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/center_loading.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/icon_popular.dart';
import 'package:recipe_app_ui_kit_food/features/profile/managers/profile_view_model.dart';

import '../../../core/router/routers.dart';
import '../../common/manegers/app_theme_view_model.dart';

class Profile63 extends StatelessWidget {
  const Profile63({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(profileRepo: context.read(), myRecipeRepo: context.read()),
      builder: (context, child) => Consumer<ProfileViewModel>(
        builder: (context, vm, child) => vm.loading
            ? CenterLoading()
            : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: Image.network(
                    vm.profile.profilePhoto,
                    width: 61.w,
                    height: 63.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "${vm.profile.firstName} ${vm.profile.lastName}",
                  style: AppStyles.w600s20w.copyWith(color: AppColors.watermelonRed),
                ),
                Row(
                  spacing: 5.w,
                  children: [
                    IconPopular(
                      icon: AppSvgs.add,
                      onPressed: (){
                        context.push(Routers.addRecipe);
                      },
                    ),
                    IconPopular(
                      icon: AppSvgs.menyu,
                      onPressed: () {
                        context.read<AppThemeViewModel>().toggleTheme();
                      },
                    ),
                  ],
                ),
              ],
            ),
      ),
    );
  }
}
