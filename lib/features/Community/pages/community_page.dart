import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/features/Community/manegers/community_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/Community/widgets/community_column_recipies.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';

import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBarCommon(
          title: "Community",
          bottom: TabBar(
            indicator: BoxDecoration(
              color: AppColors.watermelonRed,
              borderRadius: BorderRadius.circular(18.r),
            ),
            indicatorColor: Colors.transparent,
            labelColor: AppColors.white,
            unselectedLabelColor: AppColors.watermelonRed,
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ),
            tabs: [
              Tab(text: "Top Recipes"),
              Tab(text: "Newest"),
              Tab(text: "Oldest"),
            ],
          ),
        ),
        body: ChangeNotifierProvider(
          create: (context) => CommunityViewModel(communityRepo: context.read()),
          builder: (context, chil) => TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(36.w, 22.h, 36.w, 0),
                child: Consumer<CommunityViewModel>(
                  builder: (context, vm, child) => vm.loadingTop
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 126.h),
                            child: CommunityColumnRecipies(
                              vm: vm.communityTop,
                              viewModel: vm.datas,
                            ),
                          ),
                        ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(36.w, 22.h, 36.w, 0),
                child: Consumer<CommunityViewModel>(
                  builder: (context, vm, child) => vm.loadingNew
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 126.h),
                            child: CommunityColumnRecipies(
                              vm: vm.communityNew,
                              viewModel: vm.datas,
                            ),
                          ),
                        ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(36.w, 22.h, 36.w, 0),
                child: Consumer<CommunityViewModel>(
                  builder: (context, vm, child) => vm.loadingOld
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 126.h),
                            child: CommunityColumnRecipies(
                              vm: vm.communityOld,
                              viewModel: vm.datas,
                            ),
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
