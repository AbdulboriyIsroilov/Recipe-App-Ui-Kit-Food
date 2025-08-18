import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/dio_core.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/login_sign_up_repositores/login_repostoriy.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/login_sign_up_repositores/sign_up_repostory.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/top_chefs_repository/top_chef_detail_reposty.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/top_chefs_repository/top_chefs_repostory.dart';

import 'data/repositores/home_repository/home_repository.dart';
import 'data/repositores/on_boarding_repositores/allergic_repository.dart';
import 'data/repositores/on_boarding_repositores/cuisines_repository.dart';
import 'data/repositores/on_boarding_repositores/on_boarding_repository.dart';
import 'features/home/manegers/home_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = Routers().router;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MultiProvider(
        providers: [
          Provider(create: (context)=>ApiClint()),
          Provider(create: (context)=>FlutterSecureStorage()),
          Provider(create: (context)=>LoginRepository(client: context.read())),
          Provider(create: (context)=>SignUpRepostory(client: context.read())),
          Provider(create: (context)=>AllergicRepository()),
          Provider(create: (context)=>CuisinesRepository()),
          Provider(create: (context)=>OnBoardingRepository()),
          Provider(create: (context)=> HomeRepository()),
          Provider(create: (context)=> TopChefsRepostory()),
          Provider(create: (context)=> TopChefDetailRepostory()),
        ],
        builder:(context,child)=> MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
        ),
      ),
    );
  }
}
