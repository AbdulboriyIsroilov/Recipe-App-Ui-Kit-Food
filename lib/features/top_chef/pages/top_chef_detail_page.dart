import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/manegers/top_chef_detail_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/widgets/top_chef_follow.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/widgets/top_chef_profil.dart';

import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';
import '../../recipe/manegers/recipe_list_view_model.dart';
import '../../recipe/widgets/recipe_list_foot.dart';

class TopChefDetailPage extends StatelessWidget {
  const TopChefDetailPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          TopChefDetailViewModel(repository: context.read(), id: id),
      builder: (context, child) => Consumer<TopChefDetailViewModel>(
        builder: (context, vm, child) => vm.loading
            ? Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                extendBody: true,
                backgroundColor: AppColors.backgroundColor,
                appBar: AppBarCommon(
                  title: "@${vm.chefDetail.username}",
                  oneButtom: AppSvg.share,
                  twoButtom: AppSvg.threeDots,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  oneOnPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: 373.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50.r),
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(56.w, 45.h, 56.w, 65.h),
                        child: Column(
                          spacing: 17.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 15.w,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    vm.chefDetail.profilePhoto,
                                    width: 64.w,
                                    height: 63.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text("@ ${vm.chefDetail.username}",style: AppStyle.w500s15wr,),
                              ],
                            ),
                            Column(
                              spacing: 17.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Manage notifications",
                                  style: AppStyle.w500s15w.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Report",
                                  style: AppStyle.w400s13.copyWith(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  twoOnPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: 253.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50.r),
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(56.w, 45.h, 56.w, 65.h),
                        child: Column(
                          spacing: 17.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 15.w,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    vm.chefDetail.profilePhoto,
                                    width: 64.w,
                                    height: 63.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text("@ ${vm.chefDetail.username}",style: AppStyle.w500s15wr,),
                              ],
                            ),
                            Column(
                              spacing: 17.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Copy Profile URL",
                                  style: AppStyle.w400s13.copyWith(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "ReportShare this Profile",
                                  style: AppStyle.w400s13.copyWith(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                body: ChangeNotifierProvider(
                  create: (context) => CategoriesViewModel(categoryId: 5),
                  builder: (context, child) => Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(37.w, 28.h, 37.w, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 12.71.h,
                          children: [
                            TopChefProfil(
                              vm: vm.chefDetail,
                            ),
                            TopChefFollow(
                              vm: vm.chefDetail,
                            ),
                            Text(
                              "Recipes",
                              style: AppStyle.w400s12w,
                            ),
                            Divider(
                              color: AppColors.watermelonRed,
                            ),
                          ],
                        ),
                      ),
                      Consumer<CategoriesViewModel>(
                        builder: (context, vmd, child) => Expanded(
                          child: GridView.builder(
                            padding: EdgeInsets.fromLTRB(37.w, 19.h, 37.w, 0),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 19.w,
                                  mainAxisSpacing: 30.h,
                                  mainAxisExtent: 226.h,
                                ),
                            itemCount: vmd.categories.length,
                            itemBuilder: (context, index) {
                              return RecipeListFoot(
                                vm: vmd.categories,
                                index: index,
                                categoryId: vmd.categories[index].id,
                              );
                            },
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
      ),
    );
  }
}
