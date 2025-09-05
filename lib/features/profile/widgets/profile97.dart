import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/center_loading.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/icon_popular.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_button_popular.dart';
import 'package:recipe_app_ui_kit_food/features/profile/managers/profile_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/top_chef_follow.dart';

import '../../../core/router/routers.dart';
import '../../../core/utils/themes.dart';
import '../../common/manegers/app_theme_view_model.dart';

class Profile97 extends StatelessWidget {
  const Profile97({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(profileRepo: context.read(), myRecipeRepo: context.read()),
      builder: (context, child) => Consumer<ProfileViewModel>(
        builder: (context, vm, child) => vm.loading
            ? CenterLoading()
            : Column(
          spacing: 12.h,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: Image.network(
                    vm.profile.profilePhoto,
                    width: 102.w,
                    height: 97.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${vm.profile.firstName} ${vm.profile.lastName}",
                      style: AppStyles.w500s15wr,
                    ),
                    Text(
                      "@${vm.profile.username}",
                      style: AppStyles.w400s12wr,
                    ),
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        vm.profile.presentation,
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
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
                        context.push(Routers.settings);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
