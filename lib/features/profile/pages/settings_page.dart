import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/profile/widgets/setting_svg.dart';

import '../../common/manegers/app_theme_view_model.dart';
import '../../common/widgets/app_bar_common.dart';
import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
        title: "Settings",
        action: false,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(36.w, 33.5.h, 36.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15.h,
          children: [
            SettingSvg(
              svg: AppSvgs.notification,
              title: "Notification",
              onPressed: (){
                context.push(Routers.notification);
              },
            ),
            SettingSvg(
              svg: AppSvgs.admin,
              title: "Help Center",
            ),
            SettingSvg(
              svg: AppSvgs.privacyPolicy,
              title: "Privacy Policy",
            ),
            SettingSvg(
              svg: AppSvgs.reviews,
              title: "Language",
            ),
            SettingSvg(
              svg: AppSvgs.theme,
              title: "Turn dark Theme",
              playIcon: false,
              onPressed: (){
                context.read<AppThemeViewModel>().toggleTheme();
              },
            ),
            SettingSvg(
              svg: AppSvgs.logOut,
              title: "Log Out",
              playIcon: false,
              onPressed: (){
                context.go(Routers.login);
              },
            ),
            Text("Delete Account",style: AppStyles.w500s15w.copyWith(color: AppColors.rosePink),)
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
    );
  }
}
